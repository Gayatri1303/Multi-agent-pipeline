pipeline {
    agent none

    environment{
        PRIV_IP=credentials('PRIV')
        INS_IP=credentials('DEMO')
        GCHAT_URL=credentials('gchaturl')
    }

    stages {
        stage('Deploy app on private ec2'){
            agent {label 'agent2'}
            steps {
                sh 'sudo su'
                sh './script2.sh'
            }
        }

        stage('Deploy app on agent 2'){
            agent {label 'agent1'}
            steps {
                sh 'sudo su'
                sh './script1.sh'
            }
        }

        

    }

   post {
        always {
            googlechatnotification(
                url: "${GCHAT_URL}",
                message: "${env.JOB_NAME} : Build #${env.BUILD_NUMBER} - ${currentBuild.currentResult}: Check output at ${env.BUILD_URL}"
            )
        }
    }



}