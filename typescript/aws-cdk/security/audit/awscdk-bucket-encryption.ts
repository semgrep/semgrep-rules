import * as s3 from '@aws-cdk/aws-s3';
import * as cdk from '@aws-cdk/core';
import * as renamed_s3 from '@aws-cdk/aws-s3';
import {Bucket, BucketEncryption} from '@aws-cdk/aws-s3';

export class CdkStarterStack extends cdk.Stack {
  constructor(scope: cdk.App, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // ok:awscdk-bucket-encryption
    const goodBucket = new s3.Bucket(this, 's3-bucket', {
      encryption: s3.BucketEncryption.S3_MANAGED
    })
    // ruleid:awscdk-bucket-encryption
    const badBucket = new s3.Bucket(this, 's3-bucket-bad')
    // ok:awscdk-bucket-encryption
    const AnotherGoodBucket = new s3.Bucket(this, 's3-bucket', {
      encryption: s3.BucketEncryption.KMS_MANAGED
    })
    // ruleid:awscdk-bucket-encryption
    const badBucket2 = new s3.Bucket(this, 's3-bucket-bad',{
      encryption: s3.BucketEncryption.UNMANAGED
     })
    // ok:awscdk-bucket-encryption
    const goodBucketRenamed = new renamed_s3.Bucket(this, 's3-bucket', {
      encryption: renamed_s3.BucketEncryption.S3_MANAGED
    })
    // ruleid:awscdk-bucket-encryption
    const badBucketRenamed = new renamed_s3.Bucket(this, 's3-bucket-bad')
    // ok:awscdk-bucket-encryption
    const AnotherGoodBucketRenamed = new renamed_s3.Bucket(this, 's3-bucket', {
      encryption: renamed_s3.BucketEncryption.KMS_MANAGED
    })
    // ruleid:awscdk-bucket-encryption
    const badBucket2Renamed = new renamed_s3.Bucket(this, 's3-bucket-bad',{
      encryption: renamed_s3.BucketEncryption.UNMANAGED
     })
    // ok:awscdk-bucket-encryption
    const goodBucketDirect = new Bucket(this, 's3-bucket', {
      encryption: BucketEncryption.S3_MANAGED
    })

    // ruleid:awscdk-bucket-encryption
    const badBucketDirect = new Bucket(this, 's3-bucket-bad')
    // ok:awscdk-bucket-encryption
    const AnotherGoodBucketDirect = new Bucket(this, 's3-bucket', {
      encryption: BucketEncryption.KMS_MANAGED
    })
    // ruleid:awscdk-bucket-encryption
    const badBucket2Direct = new Bucket(this, 's3-bucket-bad',{
      encryption: BucketEncryption.UNMANAGED
     })
  }
}
