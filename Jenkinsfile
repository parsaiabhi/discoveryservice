pipeline { 

    environment { 

        imagename = "dockerabhi85/dockerhub-repo" 

        registryCredential = 'dockerhub' 

        dockerImage = '' 
        
    }

    agent any 

    stages { 

        stage('Cloning our Git') { 

            steps { 

                git([url: 'https://github.com/parsaiabhi/discoveryservice.git', branch: 'master', credentialsId: 'GitHubTOKEN']) 
				git '' 

            }

        } 

        stage('Building our image') { 

            steps { 

                script { 
                                        
                    dockerImage = docker.build imagename                     
                }    

            } 

        }

        stage('Deploy our image') { 

            steps { 

                script { 

                    docker.withRegistry( '', registryCredential ) {
						dockerImage.push("$BUILD_NUMBER")
							dockerImage.push('latest')
					}

                } 

            }

        } 

        stage('Cleaning up') { 

            steps { 

                sh "docker rmi $imagename:$BUILD_NUMBER" 

            }

        } 

    }

}