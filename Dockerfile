FROM ubuntu:14.04
# Some Environment Variables
ENV    DEBIAN_FRONTEND noninteractive

# MySQL Installation
RUN apt-get update && \
	echo "mysql-server mysql-server/root_password password " | debconf-set-selections && \
	echo "mysql-server mysql-server/root_password_again password " | debconf-set-selections && \
	apt-get install -y wget mysql-server && \
	wget wget https://raw.githubusercontent.com/typista/docker-mysql/master/files/my.cnf -O /etc/mysql/conf.d/my.cnf && \
	wget wget https://raw.githubusercontent.com/typista/docker-mysql/master/files/run.sh -O /run.sh && \
	wget wget https://raw.githubusercontent.com/typista/docker-mysql/master/files/create_first_admin_user.sh -O /create_first_admin_user.sh && \
	chmod 644 /etc/mysql/conf.d/my.cnf && \
	chmod 755 /*.sh

# Expose port and volumes
#EXPOSE 3306
#VOLUME ["/var/log/mysql", "/etc/mysqld", "/var/run/mysqld"]

# Start the magic
CMD ["/run.sh"]
