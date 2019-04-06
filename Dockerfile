FROM maven:alpine

ENV ZK_HOSTS localhost:2181 
ENV KAFDROP_PORT 9000 
ENV SCHEMA_REGISTRY http://localhost:8081 
ENV MSG_FORMAT DEFAULT 

RUN apk add --update git 
RUN cd /tmp && git clone https://github.com/HomeAdvisor/Kafdrop.git 
RUN cd /tmp/Kafdrop && mvn clean package
RUN cp /tmp/Kafdrop/target/kafdrop*.jar /usr/local/bin/kafdrop.jar 
# RUN rm -rf /tmp/Kafdrop
# RUN java -version
RUN ls -al /usr/local/bin/

ENTRYPOINT ["java", "-jar", "/usr/local/bin/kafdrop.jar"]
CMD ["--zookeeper.connect=${ZK_HOSTS}","--server.port=${KAFDROP_PORT}","--schemaregistry.connect=${SCHEMA_REGISTRY}","--message.format=${MSG_FORMAT}"]
