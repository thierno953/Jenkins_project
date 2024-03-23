pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "eu-west-3"  
    }
    
    stages {
        stage("Create EKS Cluster") {
            steps {
                script {
                    dir('terraform') {
                        sh "terraform fmt"
                        sh "terraform init"
                        sh "terraform plan -input=false"
                        sh "terraform apply -input=false -auto-approve"
                    }
                }
            }
        }
        
        stage("Deploy to EKS") {
            steps {
                script {
                    dir('kubernetes') {
                        sh "aws eks update-kubeconfig --name myapp-eks-cluster"
                        sh "kubectl apply -f nginx-deployment.yaml"
                        sh "kubectl apply -f nginx-service.yaml"
                    }
                }
            }
        }
    }
}
