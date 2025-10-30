pipeline {
    agent none

    environment{
        PRIV_IP=credentials('PRIV')
        INS_IP=credentials('DEMO')
        GCHAT_URL=credentials('gchaturl')
    }

    stages {
        stage('Parallel Deployment') {
            parallel{
                stage('Deploy app on private ec2'){
                    agent {label 'agent2'}
                    steps {
                        sh 'scp -i ~/.ssh/key123.pem script2.sh ubuntu@${PRIV_IP}:/home/ubuntu/'
                        sh 'ssh -i ~/.ssh/key123.pem ubuntu@${PRIV_IP}'
                        sh 'sudo chmod +x script2.sh'
                        sh './script2.sh'
                    }
                }

                stage('Deploy app on  other agent'){
                    agent {label 'agent1'}
                    steps {
                        sh 'scp -i ~/.ssh/key123.pem script1.sh ubuntu@${INS_IP}:/home/ubuntu/'
                        sh 'ssh -i ~/.ssh/key123.pem ubuntu@${INS_IP}'
                        sh 'sudo chmod +x script1.sh'
                        sh './script1.sh'
                    }
                }
            }
        }
    }

   post {
        always {
            node('agent1') {

                googlechatnotification(
                    url: '${GCHAT_URL}',
                    message: "${env.JOB_NAME} : Build #${env.BUILD_NUMBER} - ${currentBuild.currentResult}: Check output at ${env.BUILD_URL}"
                )
        }
        }
    }



}