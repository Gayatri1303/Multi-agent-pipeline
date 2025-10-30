sudo apt update
sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ubuntu
sudo chmod 666 /var/run/docker.sock
docker stop frontendapp || true
docker rm frontendapp || true
docker pull gayatri491/frontend_app3:latest 
docker run -d -p 80:80 --name frontendapp gayatri491/frontend_app3:latest