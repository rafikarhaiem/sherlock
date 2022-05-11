#docker login -u rafikarhaiem
#docker build -t rafikarhaiem/sherlock:v1 .
#docker push rafikarhaiem/sherlock:v1
#docker run --rm -t -v "$PWD/results:/opt/sherlock/results" rafikarhaiem/sherlock:v1 -o /opt/sherlock/results/list.txt rafikarhaiem
#git init
#git config --global --add safe.directory /home/rafika/Bureau/docker/sherlock-master
git add .
git commit -m "Sherlock modify"
git branch -M main
git remote add origin git@github.com:rafikarhaiem/sherlock.git
git push -u origin main
