# kafdrop-docker

Dockerfile for [HomeAdvisor/kafdrop](https://github.com/HomeAdvisor/Kafdrop)

- build the image 

  `docker build --no-cache -f Dockerfile --rm -t kafdrop .`

- verify you have it 

  `docker images`

- now you can run your image as a container (expose/forward to local port 9000 from container's 9000)

  `docker run -i -t  \
   -e ZK_HOSTS=ZK_HOSTS="localhost:2181,localhost:2182" \
   -e KAFDROP_PORT=9000 \
   -e SCHEMA_REGISTRY="http://localhost:8080" \
   -e SG_FORMAT=DEFAULT \
   -p9000:9000 kafdrop`
