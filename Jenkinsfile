pipeline {
    agent none

    stages {
        stage('Build') {
            steps {
                println "Hello from Groovy: ${BRANCH_NAME}"
                echo 'Building..'
            }
        }
        stage('Test') {
            when {
                expression {
                    BRANCH_NAME == 'master' || BRANCH_NAME == 'dev'
                }
            }
            agent {
                dockerfile {
                    filename 'Dockerfile'
                }
            }
            steps {
                echo 'Testing..'
                sh "aws --version"
                whateverFunction()
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
    post {
        always {
            echo 'send email'
        }
    }
}

void whateverFunction() {
    println("Hello Word")
}
