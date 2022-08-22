pipeline { 

    environment { 

        registry = "dockerabhi85/dockerhub-repo" 

        registryCredential = 'dockerhub' 

        dockerImage = '' 
        
    }

    agent any 

    stages { 

        stage('Cloning our Git') { 

            steps { 

                git 'https://github.com/parsaiabhi/discoveryservice.git' 

            }

        } 

        stage('Building our image') { 

            steps { 

                script { 
                                        
                    dockerImage = -f docker.build registry + ":$BUILD_NUMBER"                     
                }    

            } 

        }

        stage('Deploy our image') { 

            steps { 

                script { 

                    docker.withRegistry( '', registryCredential ) { 

                        dockerImage.push() 

                    }

                } 

            }

        } 

        stage('Cleaning up') { 

            steps { 

                sh "docker rmi $registry:$BUILD_NUMBER" 

            }

        } 

    }

}