// node('docker'){
//     stage('checkout'){
//         checkout scm
//     }
//     stage('Build'){
//         docker.image('lokeshkamalay/uta-test:good').inside(){
//             sh 'mvn clean install'
//         }
//     }
// }


pipeline {
    agent none
    
    environment {
        DOCKER_CREDS = credentials('dockerhub-id')
    }
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'lokeshkamalay/uta-test:good'
                    label 'docker'
                }
            }
            steps {
                checkout scm
                sh "mvn clean package"
            }
            post {
                success {
                    stash includes: 'target/my-app-1-RELEASE.jar', name: 'myartifacts'
                    deleteDir()
                }
            }
        }
        stage('Create-Image') {
            agent {
                label 'docker'
            }
            steps {
                unstash 'myartifacts'
                sh """
                    docker build -t lokeshkamalay/uta-test:dockertest .
                    docker login -u ${DOCKER_CREDS_USR} -p ${DOCKER_CREDS_PSW}
                    docker push lokeshkamalay/uta-test:dockertest
                """
            }
            post {
                always {
                    deleteDir()
                }
            }
        }
    }
}