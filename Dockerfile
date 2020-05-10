# Pull base image 
From apache2

# Maintainer 
MAINTAINER "Phani" 
COPY webapp/target/webapp.war /var/www/html/index.html
