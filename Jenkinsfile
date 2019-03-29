node('maven'){
    
    def maven360home = tool name: 'maven360', type: 'maven'
    
    stage('checkout'){
        git branch: 'batch2', credentialsId: 'lokeshgithub', url: 'https://github.com/lokeshkamalay/simple-java-maven-app.git'
    }
    
    
    stage('Running Tests'){
        sh "$maven360home/bin/mvn clean test surefire-report:report-only"
        junit allowEmptyResults: true, testResults: 'target/surefire-reports/*.xml'
        publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'target/site', reportFiles: 'surefire-report.html', reportName: 'SureFireReportHTML', reportTitles: ''])
    }
    
    stage('Building'){
        sh "$maven360home/bin/mvn clean package -DskipTests=true"
    }
  
    stage('Archive Artifacts'){
        archiveArtifacts '**/target/*.jar'
    }


    stage('Backup the JAR') {
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-cli-2', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
            sh "aws s3 cp target/my-app-1-RELEASE.jar s3://lokeshkamalay/"
        }
    }
    
    stage('Deployment'){
        sshagent(['project-demo-ssh-key']) {
            sh "scp -o StrictHostKeyChecking=no target/my-app-1-RELEASE.jar deployuser@3.80.193.6:/home/deployuser/"
        }
    }
}
