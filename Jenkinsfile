node('demo'){
    def mvnHome = tool name: 'maven362', type: 'maven'
    def user = "ec2-user"
    def target = ""
    stage('checkout'){
        git credentialsId: 'lokigithubaccount', url: 'https://github.com/lokeshkamalay/simple-java-maven-app.git'
    }
    stage('Maven Test'){
        sh "$mvnHome/bin/mvn clean test surefire-report:report-only"
        //archiveArtifacts 'target/site/surefire-report.html'
        publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'target/site', reportFiles: 'surefire-report.html', reportName: 'Surefire-Report', reportTitles: ''])
    }
    // stage('SonarAnalysis'){
    //     sh "$mvnHome/bin/mvn sonar:sonar"
    // }
    stage('Build'){
        sh "$mvnHome/bin/mvn package -DskipTests=true"
        stash includes: 'target/my-app-1-RELEASE.jar', name: 'myPackage'
    }
    timeout(2){
        stage('Deployments'){
            input 'Do you want me to promote to Prod?'
            unstash 'myPackage'
            target = getTarget(targetEnv)
            sshagent(['proddeploymentsshkey']) {
                sh "scp -o StrictHostKeyChecking=no target/my-app-1-RELEASE.jar $user@$target:/tmp"
            }
        }
    }
}

def getTarget(params) {
    if (params == 'dev') {
        return("172.31.88.172")
    } else if (params == 'test') {
        return("1.1.1.1")
    } else if (params == 'prod') {
        return("2.2.2.2")
    }
}
