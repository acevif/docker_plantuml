FROM openjdk:19-jdk-alpine3.16
LABEL org.opencontainers.image.authors="acevif@gmail.com"
ENV PLANTUML_VERSION=1.2023.7
ENV LANG en_US.UTF-8
RUN \
  apk add --no-cache graphviz wget ca-certificates ttf-dejavu fontconfig && \
  apk add --no-cache font-ipa && \
  wget "http://downloads.sourceforge.net/project/plantuml/${PLANTUML_VERSION}/plantuml.${PLANTUML_VERSION}.jar" -O plantuml.jar && \
  apk del wget ca-certificates
RUN ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar", "-version"]
RUN ["dot", "-version"]
ENTRYPOINT ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar", "-p"]
CMD ["-tsvg"]
