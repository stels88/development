#!/bin/bash
#
# AWS S3 buckets backup
# Oleg Smirnov <oleg.smirnov.1988@gmail.com>
#  
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=

aws_s3_buckets=`aws s3 ls | awk {'print $3'}`
mkdir -pv $AWS_DEFAULT_REGION && cd $AWS_DEFAULT_REGION

for aws_s3_bucket in $aws_s3_buckets; do
    mkdir -pv $aws_s3_bucket
    aws s3 sync s3://$aws_s3_bucket $aws_s3_bucket
done
