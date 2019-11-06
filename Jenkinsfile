pipeline {
    agent none
    options {
        skipDefaultCheckout(true)
    }
    stages {
        stage('checkout'){
            agent {
                docker {
                    image 'cloudbees/jnlp-slave-with-java-build-tools'
                    label 'docker'
                }
            }
            steps {
                git branch: 'batch4docker', url: 'https://github.com/lokeshkamalay/simple-java-maven-app.git'
            }
        }
        stage('Build'){
            agent {
                docker {
                    image 'maven'
                    label 'docker'
                }
            }
            steps {
                sh "mvn clean package"
            }
            post {
                success {
                    echo "Successful"
                }
                failure {
                    echo "Failed"
                }
                always {
                    deleteDir()
                }
            }
        }
    }
}





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

// pipeline {
//     agent {
//         docker {
//             image 'cloudbees/jnlp-slave-with-java-build-tools'
//             label 'docker'
//         }
//     }
//     stages {
//         stage('Build'){
//             steps {
//                 sh "mvn clean package"
//             }
//         }
//     }
//     post {
//         success {
//             echo "Successfull"
//         }
//         failure {
//             echo "Failed"
//         }
//         always {
//             deleteDir()
//         }
//     }
// }