import * as cdk from '@aws-cdk/core';
import * as rds from '@aws-cdk/aws-rds';
import * as rename_rds from '@aws-cdk/aws-rds';
import {DatabaseInstance, DatabaseCluster} from '@aws-cdk/aws-rds';
// CDK v2 import patterns
import * as rds_v2 from 'aws-cdk-lib/aws-rds';
import {DatabaseInstance as DatabaseInstanceV2, DatabaseCluster as DatabaseClusterV2} from 'aws-cdk-lib/aws-rds';

export class Stack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // ruleid:awscdk-rds-unencrypted-database
    const unencryptedDb1 = new rds.DatabaseInstance(this, 'unencryptedDb1', {
      engine: rds.DatabaseInstanceEngine.mysql({
        version: rds.MysqlEngineVersion.VER_8_0_35
      }),
      instanceType: rds.InstanceType.of(rds.InstanceClass.T3, rds.InstanceSize.MICRO)
    });

    // ruleid:awscdk-rds-unencrypted-database
    const unencryptedDb2 = new rds.DatabaseInstance(this, 'unencryptedDb2', {
      engine: rds.DatabaseInstanceEngine.mysql({
        version: rds.MysqlEngineVersion.VER_8_0_35
      }),
      instanceType: rds.InstanceType.of(rds.InstanceClass.T3, rds.InstanceSize.MICRO),
      storageEncrypted: false
    });

    // ok:awscdk-rds-unencrypted-database
    const encryptedDb1 = new rds.DatabaseInstance(this, 'encryptedDb1', {
      engine: rds.DatabaseInstanceEngine.mysql({
        version: rds.MysqlEngineVersion.VER_8_0_35
      }),
      instanceType: rds.InstanceType.of(rds.InstanceClass.T3, rds.InstanceSize.MICRO),
      storageEncrypted: true
    });

    // ruleid:awscdk-rds-unencrypted-database
    const unencryptedCluster1 = new rds.DatabaseCluster(this, 'unencryptedCluster1', {
      engine: rds.DatabaseClusterEngine.auroraPostgres({
        version: rds.AuroraPostgresEngineVersion.VER_13_7
      })
    });

    // ruleid:awscdk-rds-unencrypted-database
    const unencryptedCluster2 = new rds.DatabaseCluster(this, 'unencryptedCluster2', {
      engine: rds.DatabaseClusterEngine.auroraPostgres({
        version: rds.AuroraPostgresEngineVersion.VER_13_7
      }),
      storageEncrypted: false
    });

    // ok:awscdk-rds-unencrypted-database
    const encryptedCluster1 = new rds.DatabaseCluster(this, 'encryptedCluster1', {
      engine: rds.DatabaseClusterEngine.auroraPostgres({
        version: rds.AuroraPostgresEngineVersion.VER_13_7
      }),
      storageEncrypted: true
    });

    // Tests with renamed import
    // ruleid:awscdk-rds-unencrypted-database
    const unencryptedDbRenamed = new rename_rds.DatabaseInstance(this, 'unencryptedDbRenamed', {
      engine: rename_rds.DatabaseInstanceEngine.mysql({
        version: rename_rds.MysqlEngineVersion.VER_8_0_35
      }),
      instanceType: rename_rds.InstanceType.of(rename_rds.InstanceClass.T3, rename_rds.InstanceSize.MICRO)
    });

    // ruleid:awscdk-rds-unencrypted-database
    const unencryptedDbRenamed2 = new rename_rds.DatabaseInstance(this, 'unencryptedDbRenamed2', {
      engine: rename_rds.DatabaseInstanceEngine.mysql({
        version: rename_rds.MysqlEngineVersion.VER_8_0_35
      }),
      instanceType: rename_rds.InstanceType.of(rename_rds.InstanceClass.T3, rename_rds.InstanceSize.MICRO),
      storageEncrypted: false
    });

    // ok:awscdk-rds-unencrypted-database
    const encryptedDbRenamed = new rename_rds.DatabaseInstance(this, 'encryptedDbRenamed', {
      engine: rename_rds.DatabaseInstanceEngine.mysql({
        version: rename_rds.MysqlEngineVersion.VER_8_0_35
      }),
      instanceType: rename_rds.InstanceType.of(rename_rds.InstanceClass.T3, rename_rds.InstanceSize.MICRO),
      storageEncrypted: true
    });

    // Tests with direct import
    // ruleid:awscdk-rds-unencrypted-database
    const unencryptedDbDirect = new DatabaseInstance(this, 'unencryptedDbDirect', {
      engine: rds.DatabaseInstanceEngine.mysql({
        version: rds.MysqlEngineVersion.VER_8_0_35
      }),
      instanceType: rds.InstanceType.of(rds.InstanceClass.T3, rds.InstanceSize.MICRO)
    });

    // ok:awscdk-rds-unencrypted-database
    const encryptedDbDirect = new DatabaseInstance(this, 'encryptedDbDirect', {
      engine: rds.DatabaseInstanceEngine.mysql({
        version: rds.MysqlEngineVersion.VER_8_0_35
      }),
      instanceType: rds.InstanceType.of(rds.InstanceClass.T3, rds.InstanceSize.MICRO),
      storageEncrypted: true
    });

    // ruleid:awscdk-rds-unencrypted-database
    const unencryptedClusterDirect = new DatabaseCluster(this, 'unencryptedClusterDirect', {
      engine: rds.DatabaseClusterEngine.auroraPostgres({
        version: rds.AuroraPostgresEngineVersion.VER_13_7
      })
    });

    // ok:awscdk-rds-unencrypted-database
    const encryptedClusterDirect = new DatabaseCluster(this, 'encryptedClusterDirect', {
      engine: rds.DatabaseClusterEngine.auroraPostgres({
        version: rds.AuroraPostgresEngineVersion.VER_13_7
      }),
      storageEncrypted: true
    });

    // CDK v2 tests
    // ruleid:awscdk-rds-unencrypted-database
    const unencryptedDbV2 = new rds_v2.DatabaseInstance(this, 'unencryptedDbV2', {
      engine: rds_v2.DatabaseInstanceEngine.mysql({
        version: rds_v2.MysqlEngineVersion.VER_8_0_35
      }),
      instanceType: rds_v2.InstanceType.of(rds_v2.InstanceClass.T3, rds_v2.InstanceSize.MICRO)
    });

    // ok:awscdk-rds-unencrypted-database
    const encryptedDbV2 = new rds_v2.DatabaseInstance(this, 'encryptedDbV2', {
      engine: rds_v2.DatabaseInstanceEngine.mysql({
        version: rds_v2.MysqlEngineVersion.VER_8_0_35
      }),
      instanceType: rds_v2.InstanceType.of(rds_v2.InstanceClass.T3, rds_v2.InstanceSize.MICRO),
      storageEncrypted: true
    });

    // ruleid:awscdk-rds-unencrypted-database
    const unencryptedDbV2Direct = new DatabaseInstanceV2(this, 'unencryptedDbV2Direct', {
      engine: rds_v2.DatabaseInstanceEngine.mysql({
        version: rds_v2.MysqlEngineVersion.VER_8_0_35
      }),
      instanceType: rds_v2.InstanceType.of(rds_v2.InstanceClass.T3, rds_v2.InstanceSize.MICRO)
    });

    // ok:awscdk-rds-unencrypted-database
    const encryptedDbV2Direct = new DatabaseInstanceV2(this, 'encryptedDbV2Direct', {
      engine: rds_v2.DatabaseInstanceEngine.mysql({
        version: rds_v2.MysqlEngineVersion.VER_8_0_35
      }),
      instanceType: rds_v2.InstanceType.of(rds_v2.InstanceClass.T3, rds_v2.InstanceSize.MICRO),
      storageEncrypted: true
    });
  }
}