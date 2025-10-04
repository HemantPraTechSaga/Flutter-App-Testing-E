pipeline{
    agent any 
    environment {
        FLUTTER_HOME = "/tmp/workspace/flutter"
        PUB_CACHE = "/var/jenkins_home/.pub-cache"   // persistent cache location
        PATH = "${FLUTTER_HOME}/bin:${env.PATH}"
    }
    stages {
        // stage("Checkout"){
        //     steps{
        //         // Pull Code from SCM
        //         git branch: 'main', url: 'https://github.com/HemantPraTechSaga/Flutter-App-Testing-E.git'
        //     }
        // }
        stage("Setup") {
            steps {
                echo "Current PATH: ${env.PATH}"
                echo "Using Flutter at: ${env.FLUTTER_HOME}"
                echo "Using PUB_CACHE at: ${env.PUB_CACHE}"
                
                // Mark workspace safe to avoid Git ownership warnings
                sh "git config --global --add safe.directory ${WORKSPACE} || true"

                // Get dependencies
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
