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
        def buildNumber = env.BUILD_NUMBER
        def projectName = env.JOB_NAME
        def artifactName = "java-tomcat-maven-example.war"
        copyArtifacts filter: '**/*.war', fingerprintArtifacts: true, projectName: projectName, selector: specific(buildNumber)
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
