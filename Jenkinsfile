pipeline {
    agent any

    parameters {
        string(name: 'DOCKER_USERNAME', defaultValue: '', description: 'Docker Hub Username')
        password(name: 'DOCKER_PASSWORD', defaultValue: '', description: 'Docker Hub Password')
    }

    environment {
        DOCKER_IMAGE = "rpillaiakshay/nodejs-app:latest"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/rpillaiakshay/nodejs-app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push $DOCKER_IMAGE'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f kubernetes/deployment.yaml'
                sh 'kubectl apply -f kubernetes/service.yaml'
            }
        }
    }
}
