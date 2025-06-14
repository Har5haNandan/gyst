pipeline {
    agent any

    environment {
        IMAGE_NAME = 'my-python-wsgi-app'
        APP_CONTAINER = 'python-wsgi-container'
        APP_PORT = '6000'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: '03542d40-31dc-4c63-b761-2d1edbc78f8b', url: 'https://github.com/Vass007/gyst.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                  docker build -t $IMAGE_NAME .
                '''
            }
        }

        stage('Run App Container') {
            steps {
                sh '''
                  docker rm -f $APP_CONTAINER || echo "Container not found"
                  docker run -d -p $APP_PORT:$APP_PORT --name $APP_CONTAINER $IMAGE_NAME
                '''
            }
        }
    }

    post {
        success {
            echo "App container deployed successfully."
        }
        failure {
            echo "Pipeline failed."
        }
    }
}
