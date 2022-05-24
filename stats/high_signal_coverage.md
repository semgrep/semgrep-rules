For a rule to be included as high signal, it has to: have `confidence: HIGH` in the metadata OR \(be a taint mode rule AND cannot be an audit rule\).

Data about high signal repos can be generated using the `matrixify.py` script with the `-hs` argument.

## html

|                       |   html |
|:----------------------|-------:|
| Unmapped Metacategory |      1 |


## csharp

|                       |   .net |   mvc |   xml |   razor |   asp |
|:----------------------|-------:|------:|------:|--------:|------:|
| Unmapped Metacategory |      2 |     0 |     0 |       0 |     0 |
| Path Traversal        |      1 |     0 |     0 |       0 |     0 |
| CSRF                  |      1 |     1 |     0 |       0 |     0 |
| Deserialization       |      7 |     0 |     0 |       0 |     0 |
| XXE                   |      3 |     0 |     3 |       0 |     0 |
| Code Injection        |      1 |     0 |     0 |       1 |     1 |


## ruby

|                       |   ruby |   rails |   md5 |   aws-lambda |   mysql2 |   active-record |   postgres |   pg |   sequel |
|:----------------------|-------:|--------:|------:|-------------:|---------:|----------------:|-----------:|-----:|---------:|
| Regex                 |      1 |       1 |     0 |            0 |        0 |               0 |          0 |    0 |        0 |
| Path Traversal        |      3 |       3 |     0 |            0 |        0 |               0 |          0 |    0 |        0 |
| Deserialization       |      1 |       0 |     0 |            1 |        0 |               0 |          0 |    0 |        0 |
| Open Redirect         |      1 |       1 |     0 |            0 |        0 |               0 |          0 |    0 |        0 |
| Unmapped Metacategory |      2 |       1 |     0 |            0 |        0 |               0 |          0 |    0 |        0 |
| SQL Injection         |      1 |       2 |     0 |            5 |        1 |               1 |          1 |    1 |        1 |
| Code Injection        |      2 |       2 |     0 |            0 |        0 |               0 |          0 |    0 |        0 |
| XSS                   |      0 |       2 |     0 |            0 |        0 |               0 |          0 |    0 |        0 |
| Cryptography          |      0 |       0 |     1 |            0 |        0 |               0 |          0 |    0 |        0 |


## go

|                       |   go |   grpc |   jwt |   md5 |   aws-lambda |   database |   sql |
|:----------------------|-----:|-------:|------:|------:|-------------:|-----------:|------:|
| Unmapped Metacategory |    1 |      0 |     0 |     0 |            0 |          0 |     0 |
| Path Traversal        |    1 |      0 |     0 |     0 |            0 |          0 |     0 |
| Cryptography          |    3 |      2 |     1 |     1 |            0 |          0 |     0 |
| XSS                   |    1 |      0 |     0 |     0 |            0 |          0 |     0 |
| SQL Injection         |    1 |      0 |     0 |     0 |            2 |          1 |     1 |
| SSRF                  |    1 |      0 |     0 |     0 |            0 |          0 |     0 |


## java

|                       |   java |   spring |   jwt |   aws-lambda |   sql |
|:----------------------|-------:|---------:|------:|-------------:|------:|
| Path Traversal        |      1 |        0 |     0 |            0 |     0 |
| Unmapped Metacategory |      1 |        1 |     0 |            0 |     0 |
| Command Injection     |      1 |        1 |     0 |            0 |     0 |
| XSS                   |      1 |        1 |     0 |            0 |     0 |
| SQL Injection         |      1 |        1 |     0 |            2 |     1 |
| SSRF                  |      1 |        1 |     0 |            0 |     0 |
| Cryptography          |      0 |        0 |     2 |            0 |     0 |


## php

|                 |   md5 |   php |   laravel |
|:----------------|------:|------:|----------:|
| Cryptography    |     1 |     0 |         0 |
| Code Injection  |     0 |     1 |         0 |
| Deserialization |     0 |     1 |         0 |
| SQL Injection   |     0 |     3 |         3 |
| SSRF            |     0 |     2 |         0 |


## javascript

|                       |   express |   javascript |   aws-lambda |   mysql |   mysql2 |   sequelize |   postgres |   pg |   knex |   dynamodb |   argon2 |   cryptography |   typescript |   pug |   jade |   dot |   ejs |   nunjucks |   lodash |   handlbars |   mustache |   hogan.js |   eta |   squirrelly |   angularjs |   angular |
|:----------------------|----------:|-------------:|-------------:|--------:|---------:|------------:|-----------:|-----:|-------:|-----------:|---------:|---------------:|-------------:|------:|-------:|------:|------:|-----------:|---------:|------------:|-----------:|-----------:|------:|-------------:|------------:|----------:|
| Unmapped Metacategory |         3 |            2 |            1 |       0 |        0 |           0 |          0 |    0 |      0 |          1 |        1 |              1 |            1 |     1 |      1 |     1 |     1 |          1 |        1 |           1 |          1 |          1 |     1 |            1 |           2 |         1 |
| XXE                   |         1 |            0 |            0 |       0 |        0 |           0 |          0 |    0 |      0 |          0 |        0 |              0 |            0 |     0 |      0 |     0 |     0 |          0 |        0 |           0 |          0 |          0 |     0 |            0 |           0 |         0 |
| SQL Injection         |         1 |            0 |            5 |       1 |        1 |           1 |          1 |    1 |      1 |          0 |        0 |              0 |            0 |     0 |      0 |     0 |     0 |          0 |        0 |           0 |          0 |          0 |     0 |            0 |           0 |         0 |
| Prototype Pollution   |         1 |            0 |            0 |       0 |        0 |           0 |          0 |    0 |      0 |          0 |        0 |              0 |            0 |     0 |      0 |     0 |     0 |          0 |        0 |           0 |          0 |          0 |     0 |            0 |           0 |         0 |
| SSRF                  |         1 |            0 |            0 |       0 |        0 |           0 |          0 |    0 |      0 |          0 |        0 |              0 |            0 |     0 |      0 |     0 |     0 |          0 |        0 |           0 |          0 |          0 |     0 |            0 |           0 |         0 |
| Code Injection        |         3 |            2 |            2 |       0 |        0 |           0 |          0 |    0 |      0 |          0 |        0 |              0 |            0 |     0 |      0 |     0 |     0 |          0 |        0 |           0 |          0 |          0 |     0 |            0 |           0 |         0 |
| Open Redirect         |         0 |            1 |            0 |       0 |        0 |           0 |          0 |    0 |      0 |          0 |        0 |              0 |            0 |     0 |      0 |     0 |     0 |          0 |        0 |           0 |          0 |          0 |     0 |            0 |           0 |         0 |
| Command Injection     |         0 |            1 |            1 |       0 |        0 |           0 |          0 |    0 |      0 |          0 |        0 |              0 |            0 |     0 |      0 |     0 |     0 |          0 |        0 |           0 |          0 |          0 |     0 |            0 |           0 |         0 |
| XSS                   |         0 |            0 |            2 |       0 |        0 |           0 |          0 |    0 |      0 |          0 |        0 |              0 |            0 |     0 |      0 |     0 |     0 |          0 |        0 |           0 |          0 |          0 |     0 |            0 |           0 |         0 |


## scala

|                       |   scala |   sbt |   jwt |   cryptography |   play |   slick |   scala-js |
|:----------------------|--------:|------:|------:|---------------:|-------:|--------:|-----------:|
| Active Debug Code     |       1 |     1 |     0 |              0 |      0 |       0 |          0 |
| XXE                   |       3 |     0 |     0 |              0 |      0 |       0 |          0 |
| Cryptography          |       1 |     0 |     0 |              1 |      0 |       0 |          0 |
| XSS                   |       1 |     0 |     0 |              0 |      1 |       0 |          0 |
| SQL Injection         |       2 |     0 |     0 |              0 |      2 |       1 |          0 |
| Code Injection        |       1 |     0 |     0 |              0 |      0 |       0 |          1 |
| Unmapped Metacategory |       0 |     0 |     1 |              0 |      0 |       0 |          0 |


## python

|                       |   python |   aws-lambda |   flask |   django |   pyramid |   sqlalchemy |   pymssql |   mysql |   pymysql |   psycopg |   psycopg2 |   boto3 |   dynamodb |
|:----------------------|---------:|-------------:|--------:|---------:|----------:|-------------:|----------:|--------:|----------:|----------:|-----------:|--------:|-----------:|
| Deserialization       |        1 |            1 |       0 |        0 |         0 |            0 |         0 |       0 |         0 |         0 |          0 |       0 |          0 |
| Command Injection     |        6 |            4 |       0 |        0 |         0 |            0 |         0 |       0 |         0 |         0 |          0 |       0 |          0 |
| Unmapped Metacategory |        1 |            1 |       1 |        1 |         0 |            0 |         0 |       0 |         0 |         0 |          0 |       1 |          1 |
| Code Injection        |        1 |            0 |       0 |        0 |         0 |            0 |         0 |       0 |         0 |         0 |          0 |       0 |          0 |
| XSS                   |        0 |            2 |       1 |        1 |         1 |            0 |         0 |       0 |         0 |         0 |          0 |       0 |          0 |
| SQL Injection         |        0 |            6 |       1 |        1 |         1 |            2 |         1 |       1 |         1 |         1 |          1 |       0 |          0 |
| SSRF                  |        0 |            0 |       2 |        0 |         0 |            0 |         0 |       0 |         0 |         0 |          0 |       0 |          0 |


## bash

|                |   bash |   curl |
|:---------------|-------:|-------:|
| Code Injection |      1 |      1 |


## c

|                       |   c |
|:----------------------|----:|
| Unmapped Metacategory |   3 |


## generic

|                       |   nginx |
|:----------------------|--------:|
| Unmapped Metacategory |       4 |


