pipeline {
    agent any

    tools {
        gradle '8.10'
    }

    environment {
        JAR_PATH = 'build/libs/all-in-one-jar-1.0-SNAPSHOT.jar'
        DEPLOY_DIR = '/opt/test-jenkins'
        LOG_FILE = '/var/log/myapp.log'
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
                        // Move the JAR file to the deployment directory
                        sh "mv ${JAR_PATH} ${DEPLOY_DIR}/"

                        // Run the JAR file using nohup
                        sh "nohup java -jar ${DEPLOY_DIR}/all-in-one-jar-1.0-SNAPSHOT.jar > ${LOG_FILE} 2>&1 &"
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