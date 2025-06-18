FROM rockylinux:8

# Install Apache
RUN dnf install httpd -y

# Create Hello World page
RUN echo "Hello Worksflkjfkslfklsdjfksld" > /var/www/html/index.html

# Start Apache
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80
