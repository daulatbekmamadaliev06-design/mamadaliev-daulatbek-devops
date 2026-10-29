pipeline {
    agent any

    environment {
        STUDENT_NAME = 'Daulatbek'
        STUDENT_SURNAME = 'Mamadaliev'
        STUDENT_GROUP = 'IT-2 2309'
        STUDENT_ID = '123456'
        IMAGE_NAME = 'mamadaliev-daulatbek-devops'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'sh -n app/app.sh'
                echo 'Build completed successfully'
            }
        }

        stage('Test') {
            steps {
                sh '''
                    test -f Dockerfile
                    test -f app/app.sh
                    sh -n app/app.sh
                    sh app/app.sh | grep -q "Application is running successfully"
                '''
                echo 'All tests passed'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Docker Run') {
            steps {
                sh '''
                    docker rm -f mamadaliev-jenkins-container 2>/dev/null || true
                    docker run --name mamadaliev-jenkins-container \
                      -e STUDENT_NAME="$STUDENT_NAME" \
                      -e STUDENT_SURNAME="$STUDENT_SURNAME" \
                      -e STUDENT_GROUP="$STUDENT_GROUP" \
                      -e STUDENT_ID="$STUDENT_ID" \
                      "$IMAGE_NAME"
                '''
            }
        }
    }

    post {
        success {
            echo 'Student: Daulatbek Mamadaliev'
            echo 'Group: IT-2 2309'
            echo 'Student ID: 123456'
            echo 'PIPELINE SUCCESS'
        }
        failure {
            echo 'PIPELINE FAILED'
        }
    }
}
