pipeline {
    agent none
    stages {
        stage('Build') {
            agent any
            steps {
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
