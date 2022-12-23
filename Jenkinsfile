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
        sudo docker build -f web/Dockerfile -t 10.0.100.30:8300/joi-web:${BUILD_NUMBER} .
        sudo docker push 10.0.100.30:8300/joi-web:${BUILD_NUMBER}
        sudo docker build -f Dockerfile -t 10.0.100.30:8300/joi-app:${BUILD_NUMBER} .
        sudo docker push 10.0.100.30:8300/joi-app:${BUILD_NUMBER}
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
          sed -i 's/BUILD_NUMBER/${BUILD_NUMBER}/g' ci/deploy-playbook/roles/app/files/app-docker-compose.yml
          sed -i 's/BUILD_NUMBER/${BUILD_NUMBER}/g' ci/deploy-playbook/roles/web/files/web-docker-compose.yml
          cp ~/hosts ci/deploy-playbook/
          cd ci/deploy-playbook
          ansible-playbook site.yml
              '''
      }
    }
  }
}
