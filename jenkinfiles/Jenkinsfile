pipeline {
  agent any
  stages {
    stage('UnitTest') {
      steps {
        echo "Hello, Running unit test"
      }
    }
    stage("Build") {
      steps {
        echo "Building core now."
      }
    }
    stage("Deploy") {
      steps {
        echo "We are deploying the app."
      }
    }
  }
}
