pipeline {
    agent { label 'spc'}
    triggers {
        pollSCM('* * * * *')
    }
    stages {
        stage('git checkout') {
            steps {
                git url: 'https://github.com/ShivanandiniSaddanapu/spring-petclinic.git',
                    branch: 'main'
            }
        }
        stage('Build and Scan') {
            steps {
                withCredentials([string(credentialsId:'sonar_token', variable:'SONAR_TOKEN')]) {
                withSonarQubeEnv('SONAR') {
                    sh """mvn package sonar:sonar \
                          -Dsonar.projectKey=shivanandinisaddanapu \
                          -Dsonar.organization=ShivanandiniSaddanapu \
                          -Dsonar.host.url=https://sonarcloud.io/ \
                          -Dsonar.login=$SONAR_TOKEN"""
                }
                }
            }
        }
    }
}