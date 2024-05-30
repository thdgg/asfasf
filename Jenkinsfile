pipeline {
    agent any

    environment {
        TERRAFORM_VERSION = '1.1.7'
        CHECKOV_VERSION = '2.0.672'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/thdgg/asfasf'
                checkout scm
            }
        }

        stage('Validate Terraform') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'terraform init'
                        sh 'terraform validate'
                    } else {
                        bat 'terraform init'
                        bat 'terraform validate'
                    }
                }
            }
        }

        stage('Checkov') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'checkov -d . --version'
                    } else {
                        bat 'checkov -d . --version'
                    }
                }
            }
        }

        stage('Format') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'terraform fmt -check'
                    } else {
                        bat 'terraform fmt -check'
                    }
                }
            }
        }

        stage('Deploy to AWS') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'terraform apply -auto-approve'
                    } else {
                        bat 'terraform apply -auto-approve'
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}