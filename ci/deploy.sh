ansible server -m copy -a "src=../build/libs/joi-news-1.0-SNAPSHOT.jar dest=/home/ubuntu/app.jar" --become
ansible server -m copy -a "src=../Dockerfile dest=/home/ubuntu/Dockerfile" --become
ansible server -m copy -a "src=docker-compose.yml dest=/home/ubuntu/docker-compose.yml" --become
ansible server -m shell -a "docker build . -t myapp:1.0" --become
ansible server -m shell -a "docker-compose up --force-recreate" --become