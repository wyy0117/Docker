import argparse
import json
import os
import socket
import time
from os.path import join


def get_ip():
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(('8.8.8.8', 80))
        ip = s.getsockname()[0]
    finally:
        s.close()
    return ip


def get_folder_size(folder):
    size = 0
    for root, dirs, files in os.walk(folder):
        size += sum([os.path.getsize(join(root, name)) for name in files])
    return size


parser = argparse.ArgumentParser()
parser.add_argument('--dest', type=str, default=os.path.realpath(''), help='the folder path to save container')
parser.add_argument('--ip', type=str, help='ip address')
parser.add_argument('--backup-all', type=bool, default=False,
                    help='backup all files,include very big files,and --bigfile arg will invalid,default false')
parser.add_argument('--bigfile', type=int, default=1024 * 1024 * 1024,
                    help='file or folder exceed it will not backup,default is 1024*1024*1024 byte (1G)')
args = parser.parse_args()

ip = args.ip
dest = args.dest
bigfile = args.bigfile
backup_all = args.backup_all

if ip == None:
    print('no ip args,get it by code')
    ip = get_ip()

print('ip : %s' % (ip))
print('folder path : %s' % (dest))
print('bigfile : %d' % (bigfile))
print('backup all : %s' % (str(backup_all)))

docker_backup = dest + '/dockerbackup'
mkdir_command = 'mkdir -p %s' % (docker_backup)
print(mkdir_command)
system = os.system(mkdir_command)

print("clear dockerbackup folder : %s" % (docker_backup))
delete_files_command = 'rm -rf %s/*' % (docker_backup)
print(delete_files_command)
os.system(delete_files_command)

print('backup files save to %s' % (docker_backup))

date_str = time.strftime("%Y-%m-%d", time.localtime())
container_names = os.popen("docker ps -a --format 'table {{.Names}}'").read().split('\n')

# remove 'NAMES' and ''
container_names.remove('NAMES')
container_names.remove('')

for container in container_names:

    # analyse container use inspect
    inspect_file = '%s/%s-%s-%s-inspect.json' % (docker_backup, ip, container, date_str)
    inspect_command = 'docker inspect %s > %s' % (container, inspect_file)
    print(inspect_command)
    os.system(inspect_command)

    tar_files = ''
    with open(inspect_file, 'r') as f:
        inspect = json.load(f)
        mounts = inspect[0]['Mounts']
        for mount in mounts:
            source = mount['Source']
            # not backup all and is big file
            if ((not backup_all) and os.path.isfile(source) and os.path.getsize(source) > bigfile):
                print('file : %s size exceed %d ,not copy backup' % (source, bigfile))
                continue

            folder_size = get_folder_size(source)
            # not backup all and is big folder
            if (not backup_all) and folder_size > bigfile:
                print('folder : %s size exceed %d ,not backup ' % (source, bigfile))
                continue

            tar_files = tar_files + source + ' '
    tar_filename = '%s-%s-%s.tar.gz' % (ip, container, date_str)
    tar_command = 'tar -zcvf %s/%s %s' % (docker_backup, tar_filename, tar_files)
    print(tar_command)
    os.system(tar_command)

    # create image from container
    commit_command = 'docker commit %s %s-bak' % (container, container)
    print(commit_command)
    os.system(commit_command)
    # export image to tar file
    export_command = 'docker save %s-bak -o %s/%s-%s-%s.tar' % (container, docker_backup, ip, container, date_str)
    print(export_command)
    os.system(export_command)
