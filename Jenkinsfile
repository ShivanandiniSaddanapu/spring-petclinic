pipeline {
    agent { label 'spc' }

    triggers {
        pollSCM('H/5 * * * *')
    }

    parameters {
        string(name: 'goals', choices: ['package', 'clean install', 'verify'], description: '')
    }

    stages {

        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/ShivanandiniSaddanapu/spring-petclinic.git',
                    branch: 'main'
            }
        }

        stage('Build Project') {
            steps {
                sh 'mvn clean verify'
            }
        }

        stage('SonarCloud Analysis') {
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
    }
    post {
        always {
            archiveArtifacts artifacts: '**/target/*.jar', allowEmptyArchive: true
            junit allowEmptyResults: true, testResults: '**/target/surefire-reports/*.xml'
        }
    }
   
}