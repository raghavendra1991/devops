def image = "duvvaraghavendra/pythonapp"
def containerName = "app"
node {
    stage('Git Checkout') {
         checkout scm
    }
    withEnv(['http_proxy=http://127.0.0.1:3128/', 'https_proxy=http://127.0.0.1:3128/', 'ftp_proxy=http://127.0.0.1:3128/', 'socks_proxy=socks://127.0.0.1:3128/']) {
        stage('Build Docker Image') {
            docker.build("${image}:${env.BUILD_ID}")
            image.inside {
                sh 'python test_main.py'
            }
        }
    }
}
