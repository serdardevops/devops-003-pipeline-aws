pipeline {
    agent any

    tools {
        jdk 'JDK21'
        maven 'Maven3'
    }

    stages {
        stage('Cleanup Workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Checkout from SCM') {
            steps {
                git branch: 'master', credentialsId: 'github', url: 'https://github.com/serdardevops/devops-003-pipeline-aws'
            }
        }
        stage('Build Maven') {
            steps {

               sh 'mvn clean package'

            }
        }
        stage('Test Application') {
            steps {
                sh 'mvn test'
            }
        }

        stage("SonarQube Analysis") {
            steps {
                script {
                    withSonarQubeEnv(credentialsId: 'sonarqube-token') {
                        sh "mvn sonar:sonar"
                    }
                }
            }
        }

       stage("Quality Gate"){
           steps {
               script {
                    waitForQualityGate abortPipeline: false, credentialsId: 'sonarqube-token'
                }
            }
        }

    }
}
/*
        stage('Docker Image') {
            steps {
                bat 'docker build -t serdardevops/my-application .'
            }
        }

        stage('Docker Image to DeckerHub') {
            steps {
              script{
                    withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) {

                     bat 'echo docker login -u serdardevops -p ${dockerhub}'
                     bat 'docker image push serdardevops/my-application'
                    }
                }
            }
        }

        stage('Deploy Kubernetes') {
            steps {
              script {
                    kubernetesDeploy (configs: 'deploymentservice.yaml',kubeconfigId: 'kubernetes' )
                }
            }
        }

        stage('Docker Image to Clean') {
            steps {
                bat 'docker image prune -f'
            }
        }
    }
}
*/