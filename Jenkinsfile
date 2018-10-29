node('mavenbuilds'){
    def mvnHome = tool 'maven354'

    stage('Checkout'){
        deleteDir()
        echo "Cloning my Git Repo"
        git credentialsId: 'githubaccount', url: 'https://github.com/lokeshkamalay/simple-java-maven-app.git'
        echo "Cloning Successful"
    }
    stage('Tests'){
        sh "$mvnHome/bin/mvn clean test"
    }
    
    stage('Build'){
        echo "Build is started"
        sh "${mvnHome}/bin/mvn clean package"
        sh 'ls -latr'
    }
}
