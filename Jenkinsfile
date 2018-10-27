node('mavenbuilds'){
    stage('Checkout'){
        deleteDir()
        echo "Cloning my Git Repo"
        git credentialsId: 'githubaccount', url: 'https://github.com/lokeshkamalay/simple-java-maven-app.git'
        echo "Cloning Successful"
    }
    stage('Build'){
        echo "Build is started"
        sh 'mvn clean package'
        sh 'ls -latr'
    }
}
