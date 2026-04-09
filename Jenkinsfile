pipeline {
    agent { label 'spc' }

    triggers {
        pollSCM('H/5 * * * *')
    }

    parameters {
        choice(name: 'goals', choices: ['package', 'clean install', 'verify'], description: '')
    }

    stages {

        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/ShivanandiniSaddanapu/spring-petclinic.git',
                    branch: 'main'
            }
        }

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
    stage('docker image push to ecr and pulling from dockerhub') {
        steps {
            sh """docker image pull nginx:1.29,
                  aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 239500134360.dkr.ecr.ap-south-1.amazonaws.com
                  docker tag nginx:1.29 239500134360.dkr.ecr.ap-south-1.amazonaws.com/dev/spcimage:latest,
                  docker push 239500134360.dkr.ecr.ap-south-1.amazonaws.com/dev/spcimage:latest"""
            }
        }

    }








}


//    post {
//        always {
//            archiveArtifacts artifacts: '**/target/*.jar', allowEmptyArchive: true
//            junit allowEmptyResults: true, testResults: '**/target/surefire-reports/*.xml'
//        }
//    }
