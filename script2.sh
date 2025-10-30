sudo apt update
sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ubuntu
sudo chmod 666 /var/run/docker.sock
docker pull nginx:latest
docker stop demo || true
docker run -d -p 80:80 --name demo nginx:latest