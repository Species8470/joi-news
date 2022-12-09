pipeline {
  agent any

  stages {

    stage('Test & sonarqube') {
      steps {
        sh '''
         ./gradlew test jacocoTestReport sonarqube
         '''
      }
    }

    stage('Build and push to internal repo') {
      steps {
        sh '''
        ./gradlew build
         '''
      }
    }

    stage('GenImage') {
      steps {
        sh '''

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
            cd ci
            chmod +x deploy.sh
            ./deploy.sh
              '''
      }
    }
  }
}
