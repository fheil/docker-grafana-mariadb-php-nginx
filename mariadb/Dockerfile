FROM mariadb:latest

# Configure mariadb 
#   envent_scheduler=ON
COPY custom.cnf /etc/mysql/conf.d/custom.cnf

RUN chmod 440 /etc/mysql/conf.d/my.cnf
