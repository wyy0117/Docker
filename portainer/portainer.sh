docker run -itd -p 9000:9000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v ~/docker/data/portainer:/data portainer/portainer
