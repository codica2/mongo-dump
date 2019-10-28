FROM alpine:3.7

MAINTAINER codica <dev.codica@gmail.com>

RUN apk add --no-cache mongodb-tools py2-pip && \
  pip install pymongo awscli && \
  mkdir /backup

ENV S3_PATH=mongodb AWS_DEFAULT_REGION=eu-central-1

COPY backup.sh /usr/local/bin/backup
COPY entrypoint.sh /usr/local/bin/entrypoint
COPY mongouri.py /usr/local/bin/mongouri

CMD /usr/local/bin/entrypoint