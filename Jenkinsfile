pipeline {

    stages {
        stage('Build') {
            agent any
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
            //agent {
             //   dockerfile {
             //       filename 'Dockerfile'
            //    }
            //}
            agent { dockerfile true }
            steps {
                echo 'Testing..'
                sh "aws --version"
                whateverFunction()
            }
        }
        stage('Deploy') {
            agent any
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
