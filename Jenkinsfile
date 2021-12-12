//This jenkinsfile is written in Groovy by Ismaila .
//This code is used for Full automation on Jenkins pipeline by pulling the code project from remote github repo, 
//Maven build package, Sonaqube for quality code testing, deploying artifiat into nexus, Deploy to UAT Tomcat testing environment,
//Email notification using SMTP Server, Manual Approval and then Final deployment to production.

node { 
    def mavenHome = tool name: 'maven3.8.2'
    
   stage('1-GitClone') {
	git credentialsId: 'GIT HUBCREDENTIALS', url: 'https://github.com/ remote repo'
}
   stage('2-mavenbuild') {
  sh "${mavenHome}/bin/mvn clean package"
}
   stage('3-CodeQualitySonaQube') {
  sh "${mavenHome}/bin/mvn sonar:sonar"
}
   stage('4-DeployArtifatsNexus') {
  sh "${mavenHome}/bin/mvn deploy"
}
   stage('5-Deployment-UAT-PROD-TomCat') {
    deploy adapters: [tomcat9(credentialsId: 'TOMCATCREDENTIALS', path: '', url: 'http://00.000.000.00:8080/')], contextPath: null, war: 'target/*war'
}
   stage('6-EmailNotificationSMPT') {
    emailext body: '''Hello everyone,

Build status Ebay pipeline project.

Landmark Tech''', subject: 'build status', to: 'developers'   
}
   stage('7-Approval') {
        timeout(time:8, unit: 'HOURS' ) {
            input message: 'Please verify and appprove'
}
}
   stage('8-pro-Deploy') {
    deploy adapters: [tomcat9(credentialsId: 'TOMCATCREDENTIALS', path: '', url: 'http://00.000.000.00:8080/')], contextPath: null, war: 'target/*war'
}
}
