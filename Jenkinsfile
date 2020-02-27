pipeline {
    agent {
        docker {
            image 'lokeshkamalay/uta-test:good'
            label 'docker'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh "mvn clean package"
            }
        }
    }
    post {
        success {
            echo "Good Job Docker!"
        }
        failure {
            echo "I did mistake, let me fix"
        }
        always {
            deleteDir()
        }
    }
}