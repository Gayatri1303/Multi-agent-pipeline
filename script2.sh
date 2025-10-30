ssh -i ~/.ssh/key123.pem ubuntu@${PRIV_IP}
sudo apt update
sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker jenkins
sudo chmod 666 /var/run/docker.sock
docker pull nginx:latest
docker run -d -p 80:80 nginx:latest