node('docker'){
    stage('checkout'){
        echo "Checking the Git code"
        //git brach: 'docker' credentialsId: 'lokigithubapikey', url: 'https://github.com/lokeshkamalay/simple-java-maven-app.git'
        checkout scm
    }
    stage('Executing Test Cases'){
        docker.image('lokeshkamalay/batch2:maven').inside(){
            echo "Execuring Test Cases Started"
            withCredentials([string(credentialsId: 'sonar-login', variable: 'sonar-login')]) {
                sh "mvn sonar:sonar -Dsonar.host.url=http://fceed723.ngrok.io -Dsonar.login=$sonar-login"
            }
        }
    }
}
