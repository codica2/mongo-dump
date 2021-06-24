FROM alpine:3.13.5

MAINTAINER codica <dev.codica@gmail.com>

RUN apk add --no-cache mongodb-tools bash py3-pip && \
  pip3 install pymongo awscli && \
  mkdir /backup

ENV S3_PATH=mongodb AWS_DEFAULT_REGION=eu-central-1

COPY backup.sh /usr/local/bin/backup
COPY entrypoint.sh /usr/local/bin/entrypoint
COPY mongouri.py /usr/local/bin/mongouri

EXPOSE 27017

CMD /usr/local/bin/entrypoint
