/**
 * CommonJS import
 */

const { sql } = require("drizzle-orm");
async function rawGetUser(id) {
  // ruleid: ban-drizzle-sql-raw
  return sql.raw(`select * from users where id = ${id}`);
}

async function sqlEscapedGetUser(id) {
  // ok: ban-drizzle-sql-raw
  return sql.execute(sql`select * from users where id = ${id}`);
}
  

async function rawGetUserInTemplateLiteralsVariable(id) {
   // ruleid: ban-drizzle-sql-raw
  const query = `select * from users where id = ${id}`;
  return sql.raw(query);
}

async function rawGetUserWithPlusOperator(id) {
  // ruleid: ban-drizzle-sql-raw
  const query = "select * from users where id = " + id;
  return sql.raw(query);
}

async function rawGetUserWithPlusOperatorVariable(id) {
  // ruleid: ban-drizzle-sql-raw
  return sql.raw("select * from users where id = " + id);
}

async function rawGetUserWithoutInjection() {
  // ok: ban-drizzle-sql-raw
  return sql.raw("select * from users where id = 1");
}

/**
 * ESM import
 */

import { sql } from "drizzle-orm";
async function rawGetUser(id) {
  // ruleid: ban-drizzle-sql-raw
  return sql.raw(`select * from users where id = ${id}`);
}

async function sqlEscapedGetUser(id) {
  // ok: ban-drizzle-sql-raw
  return sql.execute(sql`select * from users where id = ${id}`);
}

async function rawGetUserInTemplateLiteralsVariable(id) {
   // ruleid: ban-drizzle-sql-raw
  const query = `select * from users where id = ${id}`;
  return sql.raw(query);
}

async function rawGetUserWithPlusOperator(id) {
  // ruleid: ban-drizzle-sql-raw
  const query = "select * from users where id = " + id;
  return sql.raw(query);
}

async function rawGetUserWithPlusOperatorVariable(id) {
  // ruleid: ban-drizzle-sql-raw
  return sql.raw("select * from users where id = " + id);
}

async function rawGetUserWithoutInjection() {
  // ok: ban-drizzle-sql-raw
  return sql.raw("select * from users where id = 1");
}

/**
 * CommonJS import sql as SQL
 */

const { sql: SQL } = require("drizzle-orm");

async function rawGetUser(id) {
  // ruleid: ban-drizzle-sql-raw
  return SQL.raw(`select * from users where id = ${id}`);
}

async function sqlEscapedGetUser(id) {
  // ok: ban-drizzle-sql-raw
  return SQL.execute(sql`select * from users where id = ${id}`);
}

/**
 *  ESM import sql as SQL
 */

import { sql as SQL } from "drizzle-orm";
async function rawGetUser(id) {
  // ruleid: ban-drizzle-sql-raw
  return SQL.raw(`select * from users where id = ${id}`);
}

async function sqlEscapedGetUser(id) {
  // ok: ban-drizzle-sql-raw
  return SQL.execute(sql`select * from users where id = ${id}`);
}

async function rawGetUserInTemplateLiteralsVariable(id) {
   // ruleid: ban-drizzle-sql-raw
  const query = `select * from users where id = ${id}`;
  return SQL.raw(query);
}

async function rawGetUserWithPlusOperator(id) {
  // ruleid: ban-drizzle-sql-raw
  const query = "select * from users where id = " + id;
  return SQL.raw(query);
}

async function rawGetUserWithPlusOperatorVariable(id) {
  // ruleid: ban-drizzle-sql-raw
  return SQL.raw("select * from users where id = " + id);
}

async function rawGetUserWithoutInjection() {
  // ok: ban-drizzle-sql-raw
  return SQL.raw("select * from users where id = 1");
}

/**
 * ESM import Drizzle
 */

import Drizzle from "drizzle-orm";
async function rawGetUser(id) {
  // ruleid: ban-drizzle-sql-raw
  return Drizzle.sql.raw(`select * from users where id = ${id}`);
}

async function sqlEscapedGetUser(id) {
  // ok: ban-drizzle-sql-raw
  return Drizzle.sql.execute(sql`select * from users where id = ${id}`);
}

/**
 * CommonJS import Drizzle
 */

const Drizzle = require("drizzle-orm");
async function rawGetUser(id) {
  // ruleid: ban-drizzle-sql-raw
  return Drizzle.sql.raw(`select * from users where id = ${id}`);
}

async function sqlEscapedGetUser(id) {
  // ok: ban-drizzle-sql-raw
  return Drizzle.sql.execute(sql`select * from users where id = ${id}`);
}

async function rawGetUserInTemplateLiteralsVariable(id) {
   // ruleid: ban-drizzle-sql-raw
  const query = `select * from users where id = ${id}`;
  return Drizzle.sql.raw(query);
}

async function rawGetUserWithPlusOperator(id) {
  // ruleid: ban-drizzle-sql-raw
  const query = "select * from users where id = " + id;
  return Drizzle.sql.raw(query);
}

async function rawGetUserWithPlusOperatorVariable(id) {
  // ruleid: ban-drizzle-sql-raw
  return Drizzle.sql.raw("select * from users where id = " + id);
}

async function rawGetUserWithoutInjection() {
  // ok: ban-drizzle-sql-raw
  return Drizzle.sql.raw("select * from users where id = 1");
}

