FROM 'mysql'

ENV MYSQL_ALLOW_EMPTY_PASSWORD true

ADD ./db.sql .
RUN mysql -u root

EXPOSE 3306