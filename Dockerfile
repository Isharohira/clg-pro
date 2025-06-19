FROM centos:7

# Fix deprecated CentOS repo URLs
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Install Apache, wget, unzip
RUN yum install -y httpd wget unzip

# Set working directory
WORKDIR /var/www/html

# Download Oberlo theme ZIP and unzip
RUN wget https://github.com/themewagon/Oberlo/archive/refs/heads/gh-pages.zip -O oberlo.zip && \
    unzip oberlo.zip && \
    cp -r Oberlo-gh-pages/* . && \
    rm -rf oberlo.zip Oberlo-gh-pages

# Expose HTTP port
EXPOSE 80

# Start Apache server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
