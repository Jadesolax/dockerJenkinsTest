pipeline{
    agent any
    
   
    stages {
        
      

        stage("Build"){
            steps{
                echo "running"
                sh '''
                    
                    sudo ssh -i /var/lib/jenkins/centserver.pem -t -o StrictHostKeyChecking=no ubuntu@ec2-52-91-244-28.compute-1.amazonaws.com
                    cd /var/www
                    sudo rm -rf html
                    sudo mkdir html
                    cd html
                    sudo git init
                    sudo git config --global --add safe.directory /var/www/html
                    sudo git remote add origin https://github.com/cent-kanayo/docker.git
                    sudo git pull origin main
                   
                '''
            }
        }
          
        stage('Test') {
            steps {
                echo 'Testing..'

                
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh '''
                    sudo docker build -t reactimage .
                    sudo docker run --name myreact -d -p 3000:3000 reactimage
                '''
            }
        }
    }
}
