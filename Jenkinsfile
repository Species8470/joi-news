pipeline {
  agent any

  stages {

    stage('Test for Spring app') {
      steps {
        sh '''
          ./gradlew test jacocoTestReport
         '''
      }
    }

    stage('Build') {
      steps {
        sh '''
        cd web
        npm install
        npm run build
        cd ../
         '''
      }
    }

    stage('Generate Docker Image') {
      steps {
        sh '''
        sudo docker build -f web/Dockerfile -t 10.0.100.30:8300/joi-web:0.1 .
        sudo docker push 10.0.100.30:8300/joi-web:0.1
         '''
      }
    }

    stage('delpoy') {
      options {
          timeout(time: 60, unit: 'SECONDS')
      }

      input {
          message 'Do you want to delpoy to prod?'
          ok 'Yes, go ahead.'
      }

      steps {
          sh '''
            ssh -i ~/.ssh/joi.pem ubuntu@10.0.0.10 sudo docker run -itd --restart=always 10.0.100.30:8300/joi-web:0.1 -p 80:80
            ssh -i ~/.ssh/joi.pem ubuntu@10.0.1.10 sudo docker run -itd --restart=always 10.0.100.30:8300/joi-web:0.1 -p 80:80
              '''
      }
    }
  }
}
