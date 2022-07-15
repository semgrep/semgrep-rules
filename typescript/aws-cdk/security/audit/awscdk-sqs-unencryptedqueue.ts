import * as cdk from '@aws-cdk/core';
import * as sqs from '@aws-cdk/aws-sqs';
import * as rename_sqs from '@aws-cdk/aws-sqs';
import {Queue, QueueEncryption} from '@aws-cdk/aws-sqs';

export class Stack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // ruleid:awscdk-sqs-unencryptedqueue
    const unencryptedQueue1 = new sqs.Queue(this, 'unecryptedQueue1')

    // ruleid:awscdk-sqs-unencryptedqueue
    const unencryptedQueue2 = new sqs.Queue(this, 'unencryptedQueue2', {
        encryption: sqs.QueueEncryption.UNENCRYPTED
    })

    //ok:awscdk-sqs-unencryptedqueue
    const encryptedQueue1 = new sqs.Queue(this, 'encryptedQueue', {
        encryption: sqs.QueueEncryption.KMS_MANAGED
    })

    //ok:awscdk-sqs-unencryptedqueue
    const encryptedQueue2 = new sqs.Queue(this, 'encryptedQueue', {
        encryption: sqs.QueueEncryption.KMS
    })

    // ruleid:awscdk-sqs-unencryptedqueue
    const unencryptedQueue1RenamedImport = new rename_sqs.Queue(this, 'unencryptedQueue')

    // ruleid:awscdk-sqs-unencryptedqueue
    const unencryptedQueue2RenamedImport = new rename_sqs.Queue(this, 'unencryptedQueue2', {
        encryption: rename_sqs.QueueEncryption.UNENCRYPTED
    })

    //ok:awscdk-sqs-unencryptedqueue
    const encryptedQueue1RenamedImport = new rename_sqs.Queue(this, 'encryptedQueue', {
        encryption: rename_sqs.QueueEncryption.KMS_MANAGED
    })

    //ok:awscdk-sqs-unencryptedqueue
    const encryptedQueue2RenamedImport = new rename_sqs.Queue(this, 'encryptedQueue', {
        encryption: rename_sqs.QueueEncryption.KMS
    })

    // ruleid:awscdk-sqs-unencryptedqueue
    const unencryptedQueue1DirectImport = new Queue(this, 'unencryptedQueue')

    // ruleid:awscdk-sqs-unencryptedqueue
    const unencryptedQueue2DirectImport = new Queue(this, 'unencryptedQueue2', {
        encryption: QueueEncryption.UNENCRYPTED
    })

    //ok:awscdk-sqs-unencryptedqueue
    const encryptedQueue1DirectImport = new Queue(this, 'encryptedQueue', {
        encryption: QueueEncryption.KMS_MANAGED
    })

    //ok:awscdk-sqs-unencryptedqueue
    const encryptedQueue2DirectImport = new Queue(this, 'encryptedQueue', {
        encryption: QueueEncryption.KMS
    })
  }
}
