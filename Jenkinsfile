pipeline {
    agent {
        label 'Jenkins-Agent'
    }
    environment {
        APP_NAME = "devops-003-pipeline-aws"
        RELEASE = "1.0"
        DOCKER_USER = "serdardevops"
        DOCKER_LOGIN = "dockerhub"
        IMAGE_NAME = "${DOCKER_USER}" + "/" + "${APP_NAME}"
        IMAGE_TAG = "${RELEASE}.${BUILD_NUMBER}"
    }
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

        stage('Execute Command Based on OS') {
            steps {
                script {
                    // Windows kontrolü
                    if (!isUnix()) {
                        bat 'echo This is Windows & mvn test'
                    }
                    // Mac veya Linux kontrolü
                    if (isUnix()) {
                        sh 'echo This is Unix (Mac/Linux) && mvn test'
                    }
                }
            }
        }
    }

}
        /*
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
        /*
        stage("Quality Gate") {
            steps {
                script {
                    waitForQualityGate abortPipeline: false, credentialsId: 'sonarqube-token'
                }
            }
        }

        stage('Build & Push Docker Image to DockerHub') {
            steps {
                script {
                    docker.withRegistry('', DOCKER_LOGIN) {
                        docker_image = docker.build "${IMAGE_NAME}"
                        docker_image.push("${IMAGE_TAG}")
                        docker_image.push("latest")
                    }
                }
            }
        }

        stage("Trivy Scan") {
            steps {
                script {
                    sh ('docker run -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image serdardevops/devops-003-pipeline-aws:latest --no-progress --scanners vuln  --exit-code 0 --severity HIGH,CRITICAL --format table')
                }
            }
        }

        stage ('Cleanup Artifacts') {
            steps {
                script {
                    sh "docker rmi ${IMAGE_NAME}:${IMAGE_TAG}"
                    sh "docker rmi ${IMAGE_NAME}:latest"


                    // Agent makinesi zamanla dolacak. Docker şişecek dolacak. Temizlik yapmanız lazım.
                    // Agent makinede temizlik için yeriniz azalmışsa şu komutları kulanın lütfen.
                    // Hatta mümkünse bu kodları buraya uyarlayın lütfen.
                    /*
                    docker rmi $(docker images --format '{{.Repository}}:{{.Tag}}' | grep 'devops-003-pipeline-aws')

                    docker container rm -f $(docker container ls -aq)

                    docker volume prune


                }
            }
        }
        

        stage('Deploy Kubernetes') {
            steps {
                script {
                    kubernetesDeploy(configs: 'deploymentservice.yaml', kubeconfigId: 'kubernetes')
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