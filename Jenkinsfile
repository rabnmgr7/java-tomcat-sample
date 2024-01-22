pipeline {
  agent any
  stages {
    stage('BuildApplication') {
      steps {
        sh 'mvn -f pom.xml clean package'
      }
      post {
        success {
            echo "We are archiving the artifact"
            archiveArtifacts artifacts: '**/*.war', followSymlinks: false
        }
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
