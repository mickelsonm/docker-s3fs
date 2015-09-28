#!/bin/bash

# creates our mounting point
mkdir -p /mnt/s3

# sets up our password file for s3fs
echo $AWS_ACCESS_KEY:$AWS_SECRET_ACCESS_KEY > /root/.passwd-s3fs
chmod 600 /root/.passwd-s3fs

# sets up the mount using s3fs
/usr/local/bin/s3fs $AWS_S3_BUCKET /mnt/s3

# gets us back into bash
/bin/bash
