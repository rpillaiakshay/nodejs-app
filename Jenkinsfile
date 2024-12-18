pipeline {
    agent any
    environment {
        AWS_REGION = 'us-east-1'
        ECR_REPO = 'your-ecr-repo-name'
        DOCKER_HUB_ID = 'your-docker-hub-id'
        DOCKER_HUB_REPO = 'your-docker-hub-repo-name'
        KUBECONFIG = '/home/jenkins/.kube/config'
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/rpillaiakshay/nodejs-app.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    sh 'npm install'
                    sh 'npm run test'  // Run tests if any
                }
            }
        }
        stage('Docker Build & Push') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_HUB_ID/$DOCKER_HUB_REPO:latest .'
                    sh 'docker push $DOCKER_HUB_ID/$DOCKER_HUB_REPO:latest'
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh 'kubectl apply -f kubernetes/deployment.yaml'
                    sh 'kubectl apply -f kubernetes/service.yaml'
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
