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
        copyArtifacts filter: '**/*.war', fingerprintArtifacts: true, projectName: env.JOB_NAME, selector: lastSuccessful()
        sh '''
        bash docker-image-build.sh
        original_pwd=$(pwd -P)
        echo "$original_pwd"
        '''
      }
    }
    stage("Deploy Maven App") {
      steps {
        echo "We are deploying the app."
        sh '''
        bash docker-container-create.sh
        '''
      }
    }
  }
}
