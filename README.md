# Mongo Dump and copy to S3

A simple docker image which uses mongodump and awscli to backup mongo database in s3

## Configuring

ENV variables, required for mongodump:

 * *AWS_ACCESS_KEY_ID
 * AWS_DEFAULT_REGION
 * AWS_SECRET_ACCESS_KEY
 * BACKUP_CRON_SCHEDULE
 * MONGO_DB_NAME
 * MONGO_HOST
 * MONGO_PASS
 * MONGO_PORT
 * MONGO_USER
 * S3_BUCKET

## How to run

For one-time dump, run container without passing `BACKUP_CRON_SCHEDULE`
You can user IP like 172.17.0.1 to reference database
Run docker network inspect <Network with mongodatabase> to find database container IP address. 
```
docker run -d --name mongodump \
  -e  "AWS_ACCESS_KEY_ID=aws_key" \
  -e  "AWS_DEFAULT_REGION=aws_region" \
  -e  "AWS_SECRET_ACCESS_KEY=aws_secret" \
  -e  "BACKUP_CRON_SCHEDULE=** * * * * * **" \
  -e  "MONGO_DB_NAME=mongodatabase" \
  -e  "MONGO_HOST=localhost" \
  -e  "MONGO_PASS=mongo_password" \
  -e  "MONGO_PORT=mongo_port" \
  -e  "MONGO_USER=mongo_user" \
  -e  "S3_BUCKET=s3_bucket_name" \
  public.ecr.aws/o0j8c5i3/codica:mongo-backups
```

Use `BACKUP_CRON_SCHEDULE` for setting periodic backup

```
docker run -d --name mongodump \
  -e "MONGO_HOST=your_container_address" \
  -e "MONGO_PORT=port_of_your_container" \
  -e "MONGO_DB_NAME=name_of_your_db" \
  -e "BACKUP_CRON_SCHEDULE=0 2 0 0 0" \
  -e "AWS_ACCESS_KEY_ID=your_aws_access_key" \
  -e "AWS_SECRET_ACCESS_KEY=your_aws_secret_access_key" \
  -e "AWS_DEFAULT_REGION=us-west-1" \
  -e "S3_BUCKET=your_aws_bucket" \
  public.ecr.aws/o0j8c5i3/codica:mongo-backups
```

### One time backup 
```
docker run -d --name mongodump \
  -e  "AWS_ACCESS_KEY_ID=aws_key" \
  -e  "AWS_DEFAULT_REGION=aws_region" \
  -e  "AWS_SECRET_ACCESS_KEY=aws_secret" \
  -e  "MONGO_DB_NAME=mongodatabase" \
  -e  "MONGO_HOST=localhost" \
  -e  "MONGO_PASS=mongo_password" \
  -e  "MONGO_PORT=mongo_port" \
  -e  "MONGO_USER=mongo_user" \
  -e  "S3_BUCKET=s3_bucket_name" \
  public.ecr.aws/o0j8c5i3/codica:mongo-backups
```


## License
Mongo dump is Copyright © 2015-2021 Codica. It is released under the [MIT License](https://opensource.org/licenses/MIT).

## About Codica

[![Codica logo](https://www.codica.com/assets/images/logo/logo.svg)](https://www.codica.com)

We love open source software! See [our other projects](https://github.com/codica2) or [hire us](https://www.codica.com/) to design, develop, and grow your product.
