FROM mariadb:latest

# Configure mariadb 
#   envent_scheduler=ON
COPY ./config/my.cnf /etc/mysql/conf.d

RUN chmod 440 /etc/mysql/conf.d/my.cnf
