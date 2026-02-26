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
                withCredentials([string(credentialsId: '', variable: '')]) {
                withSonarQubeEnv('') {
                    sh """mvn package sonar:sonar \
                          -Dsonar.projectkey= \
                          -Dsonar.organization= \
                          -Dsonar.host.url=https://sonarcloud.io/ \
                          -Dsonar.login=$SONAR_TOKEN"""
                }
                }
            }
        }
    }
}