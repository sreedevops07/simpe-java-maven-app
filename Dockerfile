# Pull base image 
From tomcat 

# Maintainer 
MAINTAINER "Phani" 
COPY /var/lib/jenkins/workspace/Simple_Maven_Job/webapp/target/webapp.war /usr/local/tomcat/webapps
