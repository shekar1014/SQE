pipeline {
	agent any
	stages {

	   stage (git clone repo) {
	     steps {
	       sh " git clone git@github.com:raviaws1234/jenkins-1.git"
	          }
         }

       stage (docker build image) {
         steps {
           sh "docker build 101410/jenkins-1:${BUILD_NUMBER} ."
                }
           }

       stage (docker push image) {
         steps {
           sh "docker push 101410/jenkins-1:${BUILD_NUMBER} ."
                }
           }

       stage (deploy docker images to host) {
         steps {
           sh "docker -H tcp://10.0.2.31:2375 stop jenkins-1 || true"
           sh "docker -H tcp://10.0.2.31:2375 run -dit --name jenkins-1 --hostname jenkins-1 -p 8000:80 101410/jenkins-1:${BUILD_NUMBER} "

                 }
           }

       stage (check wesite rechability) {
         steps {
           sh "sleep 10s"
           sh "curl http://10.0.2.31:8000"
                  }
            }
        
       }
}
