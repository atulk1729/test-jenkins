pipeline {
    agent any

    tools {
        gradle '8.10'
    }

    environment {
        // Define environment variables
        JAR_PATH = 'build/libs/all-in-one-jar-1.0-SNAPSHOT.jar'
        DEPLOY_DIR = '/opt/test-jenkins'
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
        // Add stages for testing and deployment
        stage('Deploy') {
            steps {
                script {
                    // Move the JAR file to the deployment directory
                    sh "mv ${JAR_PATH} ${DEPLOY_DIR}/"

                    // Run the JAR file
                    // Adjust the command if you need to pass arguments or run the JAR differently
                    sh "java -jar ${DEPLOY_DIR}/all-in-one-jar-1.0-SNAPSHOT.jar"
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