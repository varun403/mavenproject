def Build(){
    echo "inside Build printing"
}
node('mavenbuilds'){
    def mvnHome = tool 'maven354'
    stage('Building'){
        Build()
    }
    stage('Checkout'){
        deleteDir()
        echo "Cloning my Git Repo"
        git credentialsId: 'githubaccount', url: 'https://github.com/lokeshkamalay/simple-java-maven-app.git'
        echo "Cloning Successful"
    }
    stage('Tests'){
        sh "$mvnHome/bin/mvn clean test surefire-report:report-only"
        sh "ls -latr target/"
        //archive "target/**/*"
        //junit 'target/surefire-reports/*.xml'
        publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'target/site/', reportFiles: 'surefire-report.html', reportName: 'HTML_Report', reportTitles: ''])
    }
    
    stage('Analysis'){
        //sh "$mvnHome/bin/mvn sonar:sonar surefire-report:report-only"
        //sh "ls -latr target/site/surefire-report/"
    }
    
    stage('Build'){
        echo "Build is started"
        sh "${mvnHome}/bin/mvn clean package"
        sh 'ls -latr'
    }
}
