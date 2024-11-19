pipeline {
    agent any

    environment {
        GIT_BRANCH = "${env.BRANCH_NAME}" // Use Jenkins pipeline variable
    }

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'chmod +x build.sh'
                sh './build.sh'
            }
        }

        stage('Deploy and Push Docker Image') {
            steps {
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
