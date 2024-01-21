echo "Pulling image from harbor registry!!"
docker image pull harbor.registry.local/java-tomcat-sample/1-21-maven-app:v1
echo "Running container for image:"
docker run -itd --name java-tomcat-sample-container -p 8083:8080 harbor.registry.local/java-tomcat-sample/1-21-maven-app:v1
