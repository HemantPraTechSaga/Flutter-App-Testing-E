pipeline{
    agent any 
    environment {
        PATH = "/tmp/workspace/flutter/bin:${env.PATH}"
    }
    stages {
        // stage("Checkout"){
        //     steps{
        //         // Pull Code from SCM
        //         git branch: 'main', url: 'https://github.com/HemantPraTechSaga/Flutter-App-Testing-E.git'
        //     }
        // }
        stage("Setup"){
            steps{
                echo "Current PATH: ${env.PATH}"
                sh "git config --global --add safe.directory ${WORKSPACE} || true"
                sh "flutter pub get"
            }
        }
        stage("Doctor Check"){
            steps {
                script{
                    def doctorOutput = sh(script: "flutter doctor -v", returnStdout: true).trim()
                    echo "Flutter Doctor Output:\n${doctorOutput}"
                }
            }
        }
        stage('Perform Tests') {
            steps {
                script {
                    def testOutput = sh(script: "flutter test --no-pub", returnStdout: true).trim()
                    echo "Flutter Test Results:\n${testOutput}"
                }
            }
        }

        stage('Greetings') {
            steps {
                echo "Pipeline completed successfully!"
            }
        }
    }
    post {
        always {
            echo "Pipeline finished."
        }
    }
}