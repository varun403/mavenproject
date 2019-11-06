// node('docker') {
//     stage('Checkout'){
//         checkout scm
//     }
//     stage('Build'){
//         docker.image('cloudbees/jnlp-slave-with-java-build-tools').inside() {
//             sh "mvn clean package"
//         }
//     }
// }

pipeline {
    agent {
        docker {
            image 'cloudbees/jnlp-slave-with-java-build-tools'
            label 'docker'
        }
    }
    stages {
        stage('Build'){
            steps {
                sh "mvn clean package"
            }
        }
    }
    post {
        success {
            echo "Successfull"
        }
        failure {
            echo "Failed"
        }
        always {
            deleteDir()
        }
    }
}