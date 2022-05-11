#Install Docker
apt-get update
apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt update
apt-cache policy docker-ce
apt install docker-ce
usermod -aG docker ${USER}
su - ${USER}

#Generate SSH key to add the project to Git Repository
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
eval "$(ssh-agent -s)"

#Login to your Dockerhub to push the Docker image
docker login -u rafikarhaiem
docker build -t rafikarhaiem/sherlock:v1 .
docker push rafikarhaiem/sherlock:v1

#Generate Data into the file list.txt for the user user123
docker run --rm -t -v "$PWD/results:/opt/sherlock/results" rafikarhaiem/sherlock:v1 -o /opt/sherlock/results/list.txt user123

#Push the code to GitHub
git init
git config --global --add safe.directory /home/rafika/Bureau/docker/sherlock-master
git add .
git commit -m "Sherlock"
git branch -M main
git remote add origin git@github.com:rafikarhaiem/sherlock.git
git push -u origin main
