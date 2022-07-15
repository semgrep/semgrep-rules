import * as cdk from '@aws-cdk/core';
import * as s3 from '@aws-cdk/aws-s3';
import * as rename_s3  from '@aws-cdk/aws-s3';
import {Bucket} from '@aws-cdk/aws-s3';

export class CdkStarterStack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // ruleid:awscdk-bucket-grantpublicaccessmethod
    const publicBucket1 = new s3.Bucket(this, 'bucket')
    console.log('something unrelated')
    publicBucket1.grantPublicAccess()

    // ruleid:awscdk-bucket-grantpublicaccessmethod
    const publicBucket2 = new s3.Bucket(this, 'bucket')
    publicBucket2.grantPublicAccess()

    // ok:awscdk-bucket-grantpublicaccessmethod
    const nonPublicBucketRenamed = new rename_s3.Bucket(this, 'bucket')

    // ruleid:awscdk-bucket-grantpublicaccessmethod
    const publicBucket1Rename = new rename_s3.Bucket(this, 'bucket')
    console.log('something unrelated')
    publicBucket1Rename.grantPublicAccess()

    // ruleid:awscdk-bucket-grantpublicaccessmethod
    const publicBucket2Rename = new rename_s3.Bucket(this, 'bucket')
    publicBucket2Rename.grantPublicAccess()

    // ok:awscdk-bucket-grantpublicaccessmethod
    const nonPublicBucketRename = new rename_s3.Bucket(this, 'bucket')

    // ruleid:awscdk-bucket-grantpublicaccessmethod
    const publicBucket1Direct = new Bucket(this, 'bucket')
    console.log('something unrelated')
    publicBucket1Direct.grantPublicAccess()

    // ruleid:awscdk-bucket-grantpublicaccessmethod
    const publicBucket2Direct = new Bucket(this, 'bucket')
    publicBucket2Direct.grantPublicAccess()

    // ok:awscdk-bucket-grantpublicaccessmethod
    const nonPublicBucketDirect = new Bucket(this, 'bucket')
  }
}
