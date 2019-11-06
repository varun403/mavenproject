pipeline {
    agent none
    options {
        skipDefaultCheckout(true)
    }
    environment {
        VAR1 = "Variable1 in Environment"
    }
    stages {
        stage('First Stage'){
            agent {
                docker {
                    image 'cloudbees/jnlp-slave-with-java-build-tools'
                    label 'docker'
                }
            }
            steps {
                echo "In First Stage"
            }
            post {
                success {
                    echo "Successful"
                }
                failure {
                    echo "Failure"
                }
                always {
                    deleteDir()
                }
            }
        }
        stage('Parallel'){
            parallel {
                stage('Parallel 1'){
                    agent {
                        label 'docker'
                    }
                    steps {
                        sh "sleep 20"
                    }
                }
                stage('Parallel 2'){
                    agent {
                        docker {
                            image 'cloudbees/jnlp-slave-with-java-build-tools'
                            label 'docker'
                        }
                    }
                    steps {
                        sh "sleep 20"
                    }
                }
                stage('Parallel 3'){
                    agent {
                        label 'docker'
                    }
                    steps {
                        sh "sleep 10"
                    }
                }
            }
        }
    }
}

// pipeline {
//     agent none
//     options {
//         skipDefaultCheckout(true)
//     }
//     stages {
//         stage('checkout'){
//             agent {
//                 docker {
//                     image 'cloudbees/jnlp-slave-with-java-build-tools'
//                     label 'docker'
//                 }
//             }
//             steps {
//                 git branch: 'batch4docker', url: 'https://github.com/lokeshkamalay/simple-java-maven-app.git'
//             }
//         }
//         stage('Build'){
//             agent {
//                 docker {
//                     image 'maven'
//                     label 'docker'
//                 }
//             }
//             steps {
//                 sh "mvn clean package"
//             }
//             post {
//                 success {
//                     echo "Successful"
//                 }
//                 failure {
//                     echo "Failed"
//                 }
//                 always {
//                     deleteDir()
//                 }
//             }
//         }
//     }
// }





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