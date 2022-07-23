// Declarative pipeline
pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = "raghaduvva/flaskapp"
        CONTAINER_NAME = "app"
        http_proxy = 'http://127.0.0.1:3128/'
        https_proxy = 'http://127.0.0.1:3128/'
        ftp_proxy = 'http://127.0.0.1:3128/'
        socks_proxy = 'socks://127.0.0.1:3128/'
    }
    stages {
        stage ('Build Docker Image') {
            steps {
                echo 'Building Docker Image'
                sh 'docker build -t $DOCKER_HUB_REPO:$BUILD_NUMBER .'       
            }
        }
        stage ('Unit Test') {
            steps {
                echo 'Building Docker Image'
                sh 'docker run --rm -v $PWD/test-reports:/app/test-reports $DOCKER_HUB_REPO:$BUILD_NUMBER'
                junit '$PWD/test-reports/.xml'       
            }
        }  
    }
}
