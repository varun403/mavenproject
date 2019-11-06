node('docker') {
    stage('Checkout'){
        checkout 'scm'
    }
    stage('Build'){
        docker.image('cloudbees/jnlp-slave-with-java-build-tools').inside() {
            sh "mvn clean package"
        }
    }
}