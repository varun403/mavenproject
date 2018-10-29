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
        sh "ls -latr target/"
        archive "target/**/*"
        junit 'target/surefire-reports/*.xml'
    }
    
    stage('Analysis'){
        sh "$mvnHome/bin/mvn sonar:sonar surefire-report:report-only"
    }
    
    stage('Build'){
        echo "Build is started"
        sh "${mvnHome}/bin/mvn clean package"
        sh 'ls -latr'
    }
}
