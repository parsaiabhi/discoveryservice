pipeline { 
	agent any 
		tools { 
			maven 'maven3.8.6' 
			} 
		environment { 
			DATE = new Date().format('yy.M')
			TAG = "${DATE}.${BUILD_NUMBER}" 
			} 
			stages { 
				stage ('Build') { 
					steps { 
						sh 'mvn clean package' 
						} 
					} 
				stage('Docker Build') { 
					steps { 
						script { 
							docker.build("dockerabhi85/dockerhub-repo/DS:${TAG}") 
							} 
						} 
					} 
				stage('Pushing Docker Image to Dockerhub') { 
					steps { 
						script { 
							docker.withRegistry('https://registry.hub.docker.com', 'docker_credential') { docker.image("dockerabhi85/dockerhub-repo/DS:${TAG}").push() docker.image("dockerabhi85/dockerhub-repo/DS:${TAG}").push("latest") 
							} 
						} 
					} 
				} 
				stage('Deploy'){ 
					steps { 
						sh "docker stop DS | true" sh "docker rm DS | true" sh "docker run --name DS -d -p 9004:8080 dockerabhi85/dockerhub-repo/DS:${TAG}" 
						} 
					} 
				} 
			}