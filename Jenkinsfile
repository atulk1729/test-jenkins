pipeline {
    agent any

    tools {
        gradle '8.10'
    }

    environment {
        JAR_PATH = 'build/libs/all-in-one-jar-1.0-SNAPSHOT.jar'
        DEPLOY_DIR = '/opt/test-jenkins'
        LOG_FILE = '/var/log/test-jenkins/myapp.log'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/atulk1729/test-jenkins.git', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                sh 'gradle clean build customFatJar'
            }
        }

        stage('Deploy') {
            steps {
                script {
                    try {
                        sh 'docker build -t my-app .'
                        sh 'docker rm -f my-container'
                        sh 'docker run -d --name my-container -p 8888:8888 my-app'
                    } catch (Exception e) {
                        error "Deployment failed: ${e.getMessage()}"
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Build and deployment succeeded!'
        }
        failure {
            echo 'Build or deployment failed.'
        }
        always {
            cleanWs()
        }
    }
}