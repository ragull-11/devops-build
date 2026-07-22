pipeline {
    agent any

    environment {
        DOCKERHUB_CREDS = credentials('dockerhub-creds')
        EC2_HOST = '13.201.100.80'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'chmod +x build.sh deploy.sh'
                sh './build.sh local'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh 'echo $DOCKERHUB_CREDS_PSW | docker login -u $DOCKERHUB_CREDS_USR --password-stdin'
                script {
                    if (env.BRANCH_NAME == 'master') {
                        sh 'docker tag devops-build:local ragul11/prod:latest'
                        sh 'docker push ragul11/prod:latest'
                    } else {
                        sh 'docker tag devops-build:local ragul11/dev:latest'
                        sh 'docker push ragul11/dev:latest'
                    }
                }
            }
        }

        stage('Deploy to EC2') {
            steps {
                script {
                    def imageTag = (env.BRANCH_NAME == 'master') ? 'ragul11/prod:latest' : 'ragul11/dev:latest'
                    sshagent(credentials: ['ec2-ssh-key']) {
                        sh """
                            ssh -o StrictHostKeyChecking=no ubuntu@${EC2_HOST} '
                                docker pull ${imageTag} &&
                                docker rm -f devops-build-app || true &&
                                docker run -d -p 80:80 --name devops-build-app --restart unless-stopped ${imageTag}
                            '
                        """
                    }
                }
            }
        }
    }

    post {
        always {
            sh 'docker logout || true'
        }
    }
}
