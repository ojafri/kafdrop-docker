FROM maven:alpine

ENV ZK_HOSTS=localhost:2181 \
    KAFDROP_PORT=9000 \
    SCHEMA_REGISTRY=http://localhost:8081 \
    MSG_FORMAT=DEFAULT 

RUN apk add --update git \
    && cd /tmp \
    && git clone https://github.com/HomeAdvisor/Kafdrop.git \
    && cd /tmp/Kafdrop \
    && mvn package \
    && cp ./target/kafdrop-*.jar /usr/local/bin/kafdrop.jar \
    && mvn clean \
    && rm -fr /tmp/Kafdrop /tmp/master.zip \
    && echo ""

CMD java -jar /usr/local/bin/kafdrop.jar \
      --zookeeper.connect=${ZK_HOSTS} \
      --server.port=${KAFDROP_PORT} --schemaregistry.connect=${SCHEMA_REGISTRY} \
      --message.format=${MSG_FORMAT}
