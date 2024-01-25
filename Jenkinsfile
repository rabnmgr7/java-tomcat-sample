pipeline {
  agent {
    label 'built-in-node'
  }
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
      agent {
        label 'ubuntu-slave-worker1'
      }
      steps {
        script {
          def buildNumber = env.BUILD_NUMBER
          def projectName = env.JOB_NAME
          def artifactName = "java-tomcat-maven-example.war"
          copyArtifacts filter: '**/*.war', fingerprintArtifacts: true, projectName: projectName, selector: specific(buildNumber)
          sh '''
          bash docker-image-build.sh
          '''
        }
      }
    }
    stage("Deploy in QA Instance") {
      agent {
        label 'ubuntu-slave-worker1'
      }
      steps {
        timeout(time:1, unit: 'MINUTES') {
          input message: 'Approve QA Instance'
        }
        sh '''
        echo "We are deploying the app."
        bash docker-container-create.sh
        '''
      }
    }
    stage("Deploy in Stagging Instance") {
      agent {
        label 'ubuntu-slave-worker1'
      }
      steps {
        timeout(time:5, unit:'MINUTES') {
          input message: 'Approve the stagging deployment'
        }
        sh '''
        echo "We are deploying the app in stagging env."
        cp ./docker-container-create.sh ./docker-stagging-container-create.sh
        sed -i 's/java-tomcat-sample-container/java-tomcat-stagging-container/g' docker-stagging-container-create.sh
        sed -i 's/8083/8084/g' docker-stagging-container-create.sh
        bash docker-stagging-container-create.sh
        '''
      }
    }
  }
}
