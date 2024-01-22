echo "Removing previously build container"
docker container rm -f java-tomcat-sample-container || true
echo "Pulling image from harbor registry!!"
docker image pull harbor.registry.local/java-tomcat-sample/1-21-maven-app:$BUILD_NUMBER
echo "Running container for image:"
docker run -itd --name java-tomcat-sample-container -p 8083:8080 harbor.registry.local/java-tomcat-sample/1-21-maven-app:$BUILD_NUMBER
