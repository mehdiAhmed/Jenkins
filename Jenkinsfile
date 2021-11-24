pipeline {
    agent none
    stages {
        stage('Build') {
            agent {label: "toto"}
            steps {
                echo 'Building..'
                sleep time: 10, unit: 'MINUTES'
            }
        }
    }
    post {
        always {
            echo 'send email'
        }
    }
}
