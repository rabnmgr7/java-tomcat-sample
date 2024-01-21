echo "Building docker image"
docker image build -t harbor.registry.local/java-tomcat-sample/1-21-maven-app:v1 .
echo "Pushing image to harbor registry"
docker push harbor.registry.local/java-tomcat-sample/1-21-maven-app:v1

