@Library('my-shared-library') _

pipeline {
    agent {
        label 'spc'
    }

    stages {
        stage('git checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ShivanandiniSaddanapu/spring-petclinic.git'
            }
        }

        stage('build') {
            steps {
                buildApp()
            }
        }
    }
}