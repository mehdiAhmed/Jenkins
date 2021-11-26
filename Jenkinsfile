pipeline {
    agent { 
        node {
            label 'cake-netframework'
            //customWorkspace getWindowsPipelineDirectory()
        }
    }

    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
        disableConcurrentBuilds()
        disableResume()
        timeout(time: 1, unit: 'HOURS')
        skipDefaultCheckout()
        skipStagesAfterUnstable()
    }

    stages {
        stage('Run Cake build') {
            steps {
                checkout scm
            }
            post {
                always {
                    echo "======== Always executed ========"
                }
                success {
                    echo "======== Executed when stage succeeded ========"
                }
                failure {
                    echo "======== Executed when stage failed ========"
                }
                cleanup {
                }
            }
        }
    }
    post {
        always {
            echo "======== Always executed ========"
        }
        success {
            echo "======== Executed when pipeline succeeded ========"
        }
        failure {
            echo "======== Executed when pipeline failed ========"
        }
    }
}
