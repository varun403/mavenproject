node('maven'){
    
    def maven360home = tool name: 'maven360', type: 'maven'
    
    stage('checkout'){
        git branch: 'batch2', credentialsId: 'lokeshgithub', url: 'https://github.com/lokeshkamalay/simple-java-maven-app.git'
    }
    
    stage('Building'){
        sh "$maven360home/bin/mvn clean package"
    }
    
    stage('Test Results'){
        junit 'target/surefire-reports/*.xml'
    }
    stage('Archive Artifacts'){
        archiveArtifacts '**/target/*.jar'
    }
}
