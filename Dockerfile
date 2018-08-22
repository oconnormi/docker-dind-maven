FROM docker:dind

RUN apk add --no-cache openjdk8 bash maven
COPY docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh
WORKDIR /usr/local/src
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD bash
