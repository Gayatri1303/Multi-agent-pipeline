sudo apt update
sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker
sudo chmod 666 /var/run/docker.sock
docker pull nginx:latest
docker run -d -p 80:80 nginx:latest