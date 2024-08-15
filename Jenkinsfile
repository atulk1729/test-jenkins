pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/atulk1729/test-jenkins.git', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                sh 'echo "Hello"'
            }
        }
        // Add stages for testing and deployment
    }
}