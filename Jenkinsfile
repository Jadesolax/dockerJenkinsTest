pipeline{
    agent any
    
   
    stages {
        
      

        stage("Build"){
            steps{
                echo "pulling git repo"
                sh '''
                    
                    sudo ssh -i /var/lib/jenkins/docker3.pem -t -o StrictHostKeyChecking=no ubuntu@ec2-44-203-195-3.compute-1.amazonaws.com
                    cd /var/www
                    sudo rm -rf html
                    sudo mkdir html
                    cd html
                    sudo git init
                    sudo git config --global --add safe.directory /var/www/html
                    sudo git remote add origin https://github.com/Jadesolax/dockerJenkinsTest.git
                    sudo git pull origin master
                   
                '''
            }
        }
          
        stage('Test') {
            steps {
                echo 'instaling docker'
                sh '''
                    sudo apt-get update
                    sudo apt-get install \
                        ca-certificates \
                        curl \
                        gnupg \
                        lsb-release -y
                    sudo mkdir -p /etc/apt/keyrings
                    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
                    echo \
                        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
                        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
                    sudo apt-get update
                    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

                '''

                
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
