FROM amazoncorretto:8

RUN mkdir /checkstyle
WORKDIR /checkstyle

ADD https://github.com/checkstyle/checkstyle/releases/download/checkstyle-8.44/checkstyle-8.44-all.jar checkstyle.jar
ADD https://github.com/checkstyle/checkstyle/blob/master/src/main/resources/google_checks.xml google.xml

RUN echo 'java -jar /checkstyle/checkstyle.jar -c /checkstyle/google.xml "$@"' > /usr/bin/checkstyle \
    && chmod +x /usr/bin/checkstyle

ENTRYPOINT [ "/bin/bash" ]