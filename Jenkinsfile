pipeline {

    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    }

    agent any

    environment {
    AWS_ACCESS_KEY_ID     = credentials('terraform-aws-961341539223')
    AWS_SECRET_ACCESS_KEY = credentials('terraform-aws-961341539223')
    }
    stages {
        stage('Terraform Version') {
            steps {
                echo 'Terraform Initialization is In Progress!'
                sh 'terraform --version'
            }
        }
        stage('Terraform format') {
            steps {
                echo 'Terraform Initialization is In Progress!'
                sh 'terraform fmt'
            }
        }		
        stage('Terraform init') {
            steps {
                echo 'Terraform Initialization is In Progress!'
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                echo 'Terraform Initialization is In Progress!'
                sh 'terraform plan -var-file=terraform.tfvars -out=tfplan.txt'

            }
        }
        stage('Approval') {
            when {
                not {
                    equals expected: true, actual: params.autoApprove
                }
            }

            steps {
                script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Do you want to apply the plan?",
                        parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                }
            }
        }       
        stage('Terraform Apply') {
            steps {
                echo 'Terraform Apply'
                sh 'terraform destroy --auto-approve'
            }
        }
	}

}
