import argparse
import os
import shutil
import socket
import time


def get_ip():
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(('8.8.8.8', 80))
        ip = s.getsockname()[0]
    finally:
        s.close()
    return ip


"""
delete all file and folder in the filepath
:param filepath
:return:
"""


def del_files(filepath):
    del_list = os.listdir(filepath)
    for f in del_list:
        file_path = os.path.join(filepath, f)
        if os.path.isfile(file_path):
            os.remove(file_path)
        elif os.path.isdir(file_path):
            shutil.rmtree(file_path)


parser = argparse.ArgumentParser()
parser.add_argument('--dest', type=str, default='.', help='the folder path to save container')
parser.add_argument('--ip', type=str, help='ip address')
args = parser.parse_args()

ip = args.ip
dest = args.dest

if ip == None:
    print('no ip args,get it by code')
    ip = get_ip()

print('ip : %s' % (ip))
print('folder path : %s' % (dest))

dest = dest + '/backup'
if not os.path.isdir(dest):
    os.mkdir(dest)

print("clear dest folder : %s" % (dest))
del_files(dest)

print('backup files save to %s' % (dest))

datestr = time.strftime("%Y-%m-%d", time.localtime())
containernames = os.popen("docker ps -a --format 'table {{.Names}}'").read().split('\n')

# remove 'NAMES' and ''
containernames.remove('NAMES')
containernames.remove('')

i = 0
while i < len(containernames):
    container = containernames[i]
    # create image from container
    commitcommand = 'docker commit %s %s-bak' % (container, container)
    print(commitcommand)
    os.system(commitcommand)
    # export image to tar file
    exportcommand = 'docker save %s-bak -o %s/%s-%s-%s.tar' % (container, dest, ip, container, datestr)
    print(exportcommand)
    os.system(exportcommand)
    # analyse container use inspect
    inspectcommand = 'docker inspect %s > %s/%s-%s-%s-inspect.json' % (container, dest, ip, container, datestr)
    print(inspectcommand)
    os.system(inspectcommand)
    i += 1
