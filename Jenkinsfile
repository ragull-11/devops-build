pipeline {
    agent any

    triggers {
        // Automatically trigger builds on GitHub push events
        githubPush()
    }

    stages {
        stage('Build and Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    script {
                        sh 'chmod +x deploy.sh'
                        sh 'deploy.sh'
                    }
                }
            }
        }
    }
}