node('mavenbuilds'){
    def mvnHome = tool name: 'maven354', type: 'maven'
    stage('Checkout'){
        echo "Downloading the source code"
        git credentialsId: 'githubaccount', url: 'https://github.com/lokeshkamalay/simple-java-maven-app.git'
    }
    stage('Execute Test Cases'){
        echo "Executing Test Cases"
        sh "${mvnHome}/bin/mvn clean test surefire-report:report-only"
        archiveArtifacts allowEmptyArchive: true, artifacts: 'target/**/*'
        junit allowEmptyResults: true, testResults: 'target/surefire-reports/*.xml'
    }
    stage('Build'){
        echo "Building the job now"
        //sh "${mvnHome}/bin/mvn clean package"
    }
    stage('Post Build Actions'){
        echo "Sending an email to user"
    }
}
