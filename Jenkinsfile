//pipeline {
//   agent { label 'spc' }
//
  //  triggers {
    //    pollSCM('H/5 * * * *')
    //}
//
  //  parameters {
    //    choice(name: 'goals', choices: ['package', 'clean install', 'verify'], description: '')
    //}

    //environment {
        image_name = 'spc'
        tag_name = '1.0'
    //}



    //stages {

      //  stage('Checkout Code') {
        //    steps {
          //      git url: 'https://github.com/ShivanandiniSaddanapu/spring-petclinic.git',
            //        branch: 'main'
            //}
        //}

     /*   stage('Build Project') {
            steps {
                sh 'mvn clean verify'
            }
        }
*/
 /*       stage('SonarCloud Analysis') {
            steps {
                withCredentials([string(credentialsId:'sonar', variable:'SONAR_TOKEN')]) {
                withSonarQubeEnv('SONAR') {
                     sh """
                        mvn ${params.goals} sonar:sonar \
                        -Dsonar.projectKey=shivanandinisaddanapu \
                        -Dsonar.organization=shivanandinisaddanapu \
                        -Dsonar.host.url=https://sonarcloud.io \
                        -Dsonar.login=$SONAR_TOKEN
                    """
                }
            }
        }
    }
*/
   // stage('spc java docker image build') {
     //   steps {
       //     sh "docker image build -t ${image_name}:${tag_name} ."
         //   }
    //}

    //stage('Trivy scan for Image') {
      //  steps{
        //    sh "trivy image ${image_name}:${tag_name}"
        //}
    //} 

    //stage('Image push to ECR') {
      //  steps{
        //    sh """
          //  aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 239500134360.dkr.ecr.ap-south-1.amazonaws.com && \
            //docker tag ${image_name}:${tag_name} 239500134360.dkr.ecr.ap-south-1.amazonaws.com/dev/spcimage:latest && \
            //docker image ls && \
            //docker push 239500134360.dkr.ecr.ap-south-1.amazonaws.com/dev/spcimage:latest
            //"""
        //}
    //}  

    //stage('deploy to k8s for dev env') {
    //steps {
      //  withCredentials([file(credentialsId: 'myeks', variable: 'KUBECONFIG')]) {
        //    sh '''
          //  export KUBECONFIG=$KUBECONFIG
            //kubectl apply -f deploy-k8s/.
            //'''
        //}
    //}
    //} 

    //}

//}


//    post {
//        always {
//            archiveArtifacts artifacts: '**/target/*.jar', allowEmptyArchive: true
//            junit allowEmptyResults: true, testResults: '**/target/surefire-reports/*.xml'
//        }
//    }





/* Shared Library */

@Library ('my-shared-library')
pipeline{
    agent{
        label 'spc'
    }

    stages{
        stage('git checkout') {
            steps{
                git url: 'https://github.com/ShivanandiniSaddanapu/spring-petclinic.git'
                branch: 'main'
            }
        }

        stage('build') {
            steps{
                build()
            }
        }
    }
}