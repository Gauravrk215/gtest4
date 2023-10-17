 #pulling from github
      #  FROM alpine/git:v2.30.1 AS code
        #ARG BUILD_ID
        #RUN echo $BUILD_ID
        #LABEL stage=builder
        #LABEL build_id=$BUILD_ID
        #RUN mkdir repo
        #WORKDIR /repo
        #RUN git clone http://risadmin:admin1234@try.gitea.io/risadmin/a_madhurtest1.git
        #******** Stage 2 - Mysql Build*********
        FROM mysql:latest
        ENV MYSQL_ROOT_PASSWORD welcometoris1
        COPY conf.d /etc/mysql/conf.d
        COPY dump.sql /docker-entrypoint-initdb.d/
        #COPY --from=code /repo//backend/src/main/resources/ .
        VOLUME /var/lib/mysql
        EXPOSE 3306
        CMD ["mysqld"]