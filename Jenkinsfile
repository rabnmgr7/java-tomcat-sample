pipeline {
  agent any
  stages {
    stage('UnitTest') {
      steps {
        echo "Hello, we are inside unit test, Running unit test"
      }
    }
    stage("Build") {
      steps {
        echo "We are inside Build stage, Building core now."
      }
    }
    stage("Deploy") {
      steps {
        echo "We are deploying the app."
      }
    }
  }
}
