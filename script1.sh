sudo apt update
sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker jenkins
sudo chmod 666 /var/run/docker.sock
docker pull gayatri491/frontend_app3:latest 
docker run -d -p 80:80 gayatri491/frontend_app3:latest