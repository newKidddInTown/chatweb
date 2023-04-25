pipeline {

  agent any

  stages {

    stage('Build') {
      steps {
        sh 'mvn package -DskipTests'
      }
    }

    stage('Docker Build') {
      steps {
          script {
              dockerImage = docker.build("myapp")
          }
      }
    }
  }
}
