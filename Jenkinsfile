pipeline {
  agent any

  environment {
  }

  stages {

    stage('Test & sonarqube') {
      steps {
        sh '''
         ./gradlew test jacocoTestReport sonarqube
         '''
      }
    }

    stage('Build') {
      steps {
        sh '''
         '''
      }
    }

    stage('GenImage') {
      steps {
        sh '''
         set +x
         ./ci/gen-image.sh
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
              '''
      }
    }
  }
}
