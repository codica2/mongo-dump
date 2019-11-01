# Mongo Dump and copy to S3

A simple docker image for mongodump and awscli for backup mongo database to s3

## Configuring

ENV variables, required for mongodump:
  
  * MONGO_HOST
  * MONGO_DB_NAME
  * MONGO_PORT
  * S3_PATH (optional, default is `mongodb`)
  * AWS_DEFAULT_REGION (optional, default is `eu-central-1`)
  * BACKUP_CRON_SCHEDULE (optional)

## How to run

For one-time dump,run container without passing `BACKUP_CRON_SCHEDULE`

```
docker run -d --name mongodump \
  -e "MONGO_URI=mongodb://user:pass@host:port/dbname"
  -e "AWS_ACCESS_KEY_ID=your_aws_access_key"
  -e "AWS_SECRET_ACCESS_KEY=your_aws_secret_access_key"
  -e "AWS_DEFAULT_REGION=us-west-1"
  -e "S3_BUCKET=your_aws_bucket"
  rkorin/mongo-dump
```

Use `BACKUP_CRON_SCHEDULE` for setting periodic backup

```
docker run -d --name mongodump \
  -e "BACKUP_CRON_SCHEDULE=0 2 0 0 0"
  -e "MONGO_URI=mongodb://user:pass@host:port/dbname"
  -e "AWS_ACCESS_KEY_ID=your_aws_access_key"
  -e "AWS_SECRET_ACCESS_KEY=your_aws_secret_access_key"
  -e "AWS_DEFAULT_REGION=us-west-1"
  -e "S3_BUCKET=your_aws_bucket"
  rkorin/mongo-dump
```

### One time backup 




## License
mongo-dump is Copyright © 2015-2019 Codica. It is released under the [MIT License](https://opensource.org/licenses/MIT).

## About Codica

[![Codica logo](https://www.codica.com/assets/images/logo/logo.svg)](https://www.codica.com)

We love open source software! See [our other projects](https://github.com/codica2) or [hire us](https://www.codica.com/) to design, develop, and grow your product.