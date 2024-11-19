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
                        // List files in the build directory to confirm location //
                        sh 'ls -la build'

                        // Use relative path to deploy.sh and ensure it's executable
                        sh 'chmod +x build/deploy.sh'
                        sh './build/deploy.sh'
                    }
                }
            }
        }
    }
}