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
    stage("CreateTomcatImage") {
      steps {
        copyArtifacts filter: '**/*.war', fingerprintArtifacts: true, projectName: BuildApplication, selector: lastSuccessful()
        sh '''
        bash docker-image-build.sh
        '''
      }
    }
    stage("Deploy Maven App") {
      steps {
        sh '''
        echo "We are deploying the app."
        '''
      }
    }
  }
}
