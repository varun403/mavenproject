node('docker'){
    stage('checkout'){
        echo "Checking the Git code"
        //git brach: 'docker' credentialsId: 'lokigithubapikey', url: 'https://github.com/lokeshkamalay/simple-java-maven-app.git'
        checkout scm
    }
    stage('Executing Test Cases'){
        docker.image('lokeshkamalay/batch2:maven').inside(){
            echo "Execuring Test Cases Started"
            sh "mvn sonar:sonar -Dsonar.host.url=http://00c56ae0.ngrok.io -Dsonar.login=094b7cce8f51999a937019871a5624494272e81e"
        }
    }
}
