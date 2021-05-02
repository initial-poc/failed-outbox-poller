FROM adoptopenjdk/openjdk11:alpine-jre

# maintainer info
LABEL maintainer="aarfi.siddique@infogain.com"

# add volume pointing to /tmp
VOLUME /tmp

# Make port 9002 available to the world outside the container
EXPOSE 9002

# application jar file when packaged
ARG jar_file=target/failed-outbox-poller.jar

# add application jar file to container
COPY ${jar_file} failed-outbox-poller.jar

# run the jar file
ENTRYPOINT ["java", "-jar", "-DserviceUrl=35.226.189.52:80","-Dlimit=10","failed-outbox-poller.jar" ]