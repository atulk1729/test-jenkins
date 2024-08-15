pipeline {
    agent any

    tools {
        gradle '8.10'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/atulk1729/test-jenkins.git', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                sh 'gradle --version'
            }
        }
        // Add stages for testing and deployment
    }
}