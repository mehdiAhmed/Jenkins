pipeline {
    agent any

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
                    BRANCH_NAME == 'master' || BRANCH_NAME == 'master'
                }
            }
            steps {
                echo 'Testing..'
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