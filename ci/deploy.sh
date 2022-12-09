ansible server -m copy -a "src=../build/libs/joi-news-1.0-SNAPSHOT.jar dest=/opt/app.jar"
ansible server -m copy -a "src=../Dockerfile dest=/opt/Dockerfile"
ansible server -m shell -a "cd /opt docker \ build -t myapp:1.0"