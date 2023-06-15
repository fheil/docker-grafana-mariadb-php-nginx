FROM alpine:latest

RUN apk update && \
    apk upgrade && \

COPY set.sh /set.sh

CMD ["/set.sh"]
