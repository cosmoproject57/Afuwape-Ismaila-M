
node { 
   // def mavenHome = tool name: 'maven3.8.4' version 3.8.4 didn't work
    def MHD = tool name: 'maven3.8.2'
   stage('1-Initiation') {
     sh "echo Start of boa deployment"
}

   stage('2-Clone') {
	//git credentialsId: 'GIT HUBCREDENTIALS', url: 'https://github.com/Landmark-FintechProjects/private-web-app'
git branch: 'master', credentialsId: 'GIT HUBCREDENTIALS', url: 'https://github.com/Landmark-FintechProjects/private-web-app'       
}
   stage('3-mavenbuild') {
  sh "${MHD}/bin/mvn package"
}
   stage('4-CodeQualitySonaQube') {
  sh "${MHD}/bin/mvn sonar:sonar"
}
   stage('5-UploadArtifatsNexus') {
  sh "${MHD}/bin/mvn deploy"
}

   stage('6-Deployment-2Stage-TomCat') {
  //  deploy adapters: [tomcat9(credentialsId: 'TOMCATCREDENTIALS', path: '', url: 'http://34.239.113.63:8080/')], contextPath: null, war: 'target/*war'
     sshagent(['5fdafc2a-2a37-4a16-b8da-aa222703c0c1']) {
      sh "scp -o StrictHostKeyChecking=yes target/*war ec2-user@172.31.85.188:/opt/tomcat9/webapps/"
    // some block
}
  }

   stage('7-Approval') {
        timeout(time:8, unit: 'DAYS' ) {
            input message: 'Please verify and appprove'
}
}
   stage('8-pro-Deploy') {
           sshagent(['5fdafc2a-2a37-4a16-b8da-aa222703c0c1']) {
     sh "scp -o StrictHostKeyChecking=yes target/*war ec2-user@172.31.85.188:/opt/tomcat9/webapps/" 
}
}
}
