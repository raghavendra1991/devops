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
                def image = "duvvaraghavendra/pythonapp"
                docker.build("${image}:${env.BUILD_ID}")
                docker.image("${image}:${env.BUILD_ID}").run("--name ${containerName} --publish 5000:5000")
                image.inside {
                    sh 'python test_main.py'
                }
            }
        }
    }
}
