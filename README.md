# docker-postgressql-s3-backups
Schedule posrgressql backups and store them in S3. It uses s3cmd to upload the backups to S3.

# docker-compose.yml.sample

docker-compose.yml sample file, it contains the ENV variables necessaries to config the backups and store it in S3. 

```
db:
  image: postgres:9.4
  environment:
    PGPASSWORD: "password"
    POSTGRES_USER: "user"

dbbackup:
  image: jospergon/docker-nginx-proxy
  environment:
    AWS_ACCESS_KEY: "aws_access_key"
    AWS_SECRET_KEY: "aws_secret_key"
    BUCKET: s3bucket
    APPNAME: appname
    PGPASSWORD: "password"
  links:
    - db

```

