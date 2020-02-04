node {
    tools {
              maven '3.6.3'
              jdk 'jdk8'
              }
                stage("clone repository") {
		                    git "https://github.com/"
            	}	
                stage('--portal-core:latest--'){
                        steps{
                                sh '''image="########:8080/keycloak:build-${BUILD_NUMBER}"
                                      docker build -t ${image} /var/lib/jenkins/QA-Portal/qa-portal-angular
                                      docker service update --image ${image} portal-core:latest
                                      '''
                        }
                }  
                stage('--core-api--'){
                        steps{
                                sh '''image="#########:8080/core-api:build-${BUILD_NUMBER}"
                                      docker build -t ${image} /var/lib/jenkins/QA-Portal/qa-portal-services/core-api
                                      docker push ${image}
                                      ssh ##.##.##.##  << EOF
                                      docker service update --image ${image} core-api
                                      '''
                        }
                }
                stage('--user-api--'){
                        steps{ 
                                 sh '''image="########:8080/user-api:build-${BUILD_NUMBER}"
                                      docker build -t ${image} /var/lib/jenkins/QA-Portal/qa-portal-services/user-api
                                      docker push ${image}
                                      ssh ##.##.##.##  << EOF
                                      docker service update --image ${image} user-api
                                      ''' 
                        } 
                }
                 stage('--self-reflection-api--'){
                        steps{ 
                                 sh '''image="########:8080/self-reflection:build-${BUILD_NUMBER}"
                                      docker build -t ${image} /var/lib/jenkins/QA-Portal/qa-portal-services/self-reflection-api
                                      docker push ${image}
                                      ssh ##.##.##.##  << EOF
                                      docker service update --image ${image} self-reflection-api
                                      ''' 
                        } 
                }
                 stage('--cv-api--'){
                        steps{ 
                                 sh '''image="########:8080/cv-api:build-${BUILD_NUMBER}"
                                      docker build -t ${image} /var/lib/jenkins/QA-Portal/qa-portal-services/cv-api
                                      docker push ${image}
                                      ssh ##.##.##.##  << EOF
                                      docker service update --image ${image} cv-api
                                      ''' 
                        } 
                }
                 stage('--feedback-api--'){
                        steps{ 
                                 sh '''image="########:8080/feedback-api:build-${BUILD_NUMBER}"
                                      docker build -t ${image} /var/lib/jenkins/QA-Portal/qa-portal-services/feedback-api
                                      docker push ${image}
                                      ssh ##.##.##.##  << EOF
                                      docker service update --image ${image} feedback-api
                                      ''' 
                        } 
                }
                 stage('--form-api--'){
                        steps{ 
                                 sh '''image="########:8080/form-api:build-${BUILD_NUMBER}"
                                      docker build -t ${image} /var/lib/jenkins/QA-Portal/qa-portal-services/cv-api
                                      docker push ${image}
                                      ssh ##.##.##.##  << EOF
                                      docker service update --image ${image} form-api 
                                      ''' 
                        } 
 

                }
                stage('--Back End--'){
                        steps{
                                sh '''image="##.##.##.##:8080/backend:build-${BUILD_NUMBER}"
                                      docker build -t ${image} /var/lib/jenkins/fffff/fffff/backend
                                      docker push ${image}
                                      ssh ##.##.##.##  << EOF
                                      docker service update --image ${image} ffffff_backend
                                      '''
                        }
                }
                stage('--Test--'){
                        steps{ 
                               sh "sudo systemctl status postgresql.service"
                                   sudo systemctl status mongodb
                        }
                }
                stage('--Clean up--'){
                        steps{
                                sh '''ssh ##.##.##.##  << EOF
                                      docker system prune
                                      '''
                        }
                }
        }
}

