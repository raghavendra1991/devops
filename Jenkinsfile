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
        stage('Unit Tests') {
            steps {
                def imageTest= docker.build("${imageName}-test", "-f Dockerfile.test .")
                imageTest.inside {
                    sh 'python test_main.py'
                }
            }
        }
    }
}
