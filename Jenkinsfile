pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh '''
                aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin 180294212631.dkr.ecr.us-east-1.amazonaws.com
                sudo docker build -t 180294212631.dkr.ecr.us-east-1.amazonaws.com/spark:latest .
                sudo docker push 180294212631.dkr.ecr.us-east-1.amazonaws.com/spark:latest
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                kubectl apply -f .
                '''
            }
        }
    }
}