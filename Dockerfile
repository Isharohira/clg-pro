FROM centos:7

# Install Apache (httpd)
RUN yum install httpd -y

# Create Hello World HTML file
RUN echo "Hello World" > /var/www/html/index.html

# Start Apache when container runs
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80
