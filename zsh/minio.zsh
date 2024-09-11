export AWS_REGION=$(sed -n 's/^AWS_REGION=//p' ~/.secrets/aws/minio-config)
export AWS_ENDPOINT_URL_S3=$(sed -n 's/^AWS_ENDPOINT_URL_S3=//p' ~/.secrets/aws/minio-config)
export AWS_ACCESS_KEY_ID=$(sed -n 's/^AWS_ACCESS_KEY_ID=//p' ~/.secrets/aws/minio-config)
export AWS_SECRET_ACCESS_KEY=$(sed -n 's/^AWS_SECRET_ACCESS_KEY=//p' ~/.secrets/aws/minio-config)
