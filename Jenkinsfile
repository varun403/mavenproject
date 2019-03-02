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
        sh "$maven360home/bin/mvn clean package"
    }

        //publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'target/site', reportFiles: 'surefire-report.html', reportName: 'SureFireReportHTML', reportTitles: ''])
  
    stage('Archive Artifacts'){
        archiveArtifacts '**/target/*.jar'
    }
}
