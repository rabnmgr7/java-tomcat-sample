FROM tomcat:9.0
RUN rm -r /usr/local/tomcat/webapps/ROOT || true
ADD **/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
