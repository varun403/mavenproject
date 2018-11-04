node('maven'){
    def mvnHome = tool name: 'maven360', type: 'maven'
    stage('checkout'){
        echo "Checking the Git code"
        git credentialsId: 'lokigithubapikey', url: 'https://github.com/lokeshkamalay/simple-java-maven-app.git'
    }
    stage('Executing Test Cases'){
        echo "Execuring Test Cases Started"
        sh "$mvnHome/bin/mvn clean test surefire-report:report-only"
        archiveArtifacts 'target/**/*'
        junit allowEmptyResults: true, testResults: 'target/surefire-reports/*.xml'
        echo "Executing Test Cases Completed"
    }
    stage('Packaging'){
        echo "Preparing artifacts"
        sh "$mvnHome/bin/mvn package -DskipTests=true"
    }
}
