@Library ('my-shared-library')
pipeline {
    agent {
        label 'spc'
    }

    stages {
        stage('git checkout') {
            steps {
                git url: 'https://github.com/ShivanandiniSaddanapu/spring-petclinic.git'
                branch: 'main'
            }
        }

        stage('build') {
            steps {
                build()
            }
        }
    }
}