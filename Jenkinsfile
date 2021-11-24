pipeline {
    agent none
    stages {
        stage('Build') {
            agent any
            steps {
                println "Hello from Groovy: ${BRANCH_NAME}"
                echo 'Building..'
            }
        }
    }
    post {
        always {
            echo 'send email'
        }
    }
}
