## ruby

|                       |   rails |   lang |   jwt |   aws-lambda |
|:----------------------|--------:|-------:|------:|-------------:|
| Unmapped Metacategory |       7 |     23 |     3 |            0 |
| Cookie Flag Security  |       1 |      0 |     0 |            0 |
| Regex                 |       1 |      0 |     0 |            0 |
| Path Traversal        |       1 |      0 |     0 |            0 |
| Denial of Service     |       1 |      0 |     0 |            0 |
| Open Redirect         |       1 |      0 |     0 |            0 |
| Command Injection     |       1 |      0 |     0 |            0 |
| XSS                   |      12 |      0 |     0 |            0 |
| SQL Injection         |       3 |      0 |     0 |            5 |
| Prototype Pollution   |       2 |      2 |     0 |            0 |
| SSRF                  |       1 |      0 |     0 |            0 |
| Cryptography          |       0 |      1 |     1 |            0 |
| CSRF                  |       0 |      1 |     0 |            0 |
| Hard-coded Secrets    |       0 |      2 |     0 |            0 |
| Deserialization       |       0 |      0 |     0 |            1 |


## go

|                       |   gorilla |   lang |   template |   grpc |   jwt-go |   aws-lambda |   otto |
|:----------------------|----------:|-------:|-----------:|-------:|---------:|-------------:|-------:|
| Cookie Flag Security  |         1 |      1 |          0 |      0 |        0 |            0 |      0 |
| CSRF                  |         1 |      0 |          0 |      0 |        0 |            0 |      0 |
| Unmapped Metacategory |         0 |      5 |          1 |      0 |        0 |            0 |      1 |
| Path Traversal        |         0 |      1 |          0 |      0 |        0 |            0 |      0 |
| Cryptography          |         0 |      1 |          0 |      2 |        1 |            0 |      0 |
| Denial of Service     |         0 |      1 |          0 |      0 |        0 |            0 |      0 |
| Code Injection        |         0 |      1 |          0 |      0 |        0 |            0 |      0 |
| Active Debug Code     |         0 |      1 |          0 |      0 |        0 |            0 |      0 |
| XXE                   |         0 |      1 |          0 |      0 |        0 |            0 |      0 |
| XSS                   |         0 |     14 |          0 |      0 |        0 |            0 |      0 |
| SQL Injection         |         0 |      2 |          0 |      0 |        0 |            2 |      0 |
| Mass Assignment       |         0 |      2 |          0 |      0 |        0 |            0 |      0 |
| SSRF                  |         0 |      1 |          0 |      0 |        0 |            0 |      0 |
| Hard-coded Secrets    |         0 |      0 |          0 |      0 |        1 |            0 |      0 |


## java

|                       |   lang |   jax-rs |   spring |   servlets |   jjwt |   java-jwt |   rmi |   log4j |   aws-lambda |   jboss |   android |
|:----------------------|-------:|---------:|---------:|-----------:|-------:|-----------:|------:|--------:|-------------:|--------:|----------:|
| Cookie Flag Security  |      1 |        0 |        0 |          0 |      0 |          0 |     0 |       0 |            0 |       0 |         0 |
| Unmapped Metacategory |     10 |        0 |        2 |          0 |      0 |          1 |     0 |       1 |            0 |       1 |         7 |
| XSS                   |      3 |        0 |        0 |          0 |      0 |          0 |     0 |       0 |            0 |       0 |         0 |
| Command Injection     |      3 |        0 |        1 |          0 |      0 |          0 |     0 |       0 |            0 |       0 |         0 |
| Path Traversal        |      1 |        1 |        0 |          0 |      0 |          0 |     0 |       0 |            0 |       0 |         0 |
| Cryptography          |      1 |        0 |        0 |          1 |      1 |          1 |     0 |       0 |            0 |       0 |         0 |
| CSRF                  |      1 |        0 |        2 |          0 |      0 |          0 |     0 |       0 |            0 |       0 |         0 |
| Code Injection        |      1 |        0 |        1 |          0 |      0 |          0 |     0 |       0 |            0 |       1 |         0 |
| Deserialization       |      3 |        2 |        0 |          0 |      0 |          0 |     2 |       0 |            0 |       0 |         0 |
| Open Redirect         |      1 |        0 |        1 |          0 |      0 |          0 |     0 |       0 |            0 |       0 |         0 |
| XXE                   |      7 |        0 |        0 |          0 |      0 |          0 |     0 |       0 |            0 |       0 |         0 |
| SQL Injection         |      3 |        0 |        1 |          0 |      0 |          0 |     0 |       0 |            2 |       0 |         0 |


## kotlin

|                       |   lang |
|:----------------------|-------:|
| Command Injection     |      1 |
| Cookie Flag Security  |      1 |
| Cryptography          |      4 |
| Unmapped Metacategory |      1 |


## html

|                       |   security |
|:----------------------|-----------:|
| Unmapped Metacategory |          1 |


## php

|                       |   lang |   symfony |   laravel |   doctrine |
|:----------------------|-------:|----------:|----------:|-----------:|
| Unmapped Metacategory |     13 |         1 |         0 |          0 |
| Path Traversal        |      1 |         0 |         0 |          0 |
| Cryptography          |      1 |         0 |         0 |          0 |
| Code Injection        |      1 |         0 |         0 |          0 |
| Deserialization       |      2 |         0 |         0 |          0 |
| SQL Injection         |      1 |         0 |         3 |          2 |
| SSRF                  |      2 |         0 |         0 |          0 |
| CSRF                  |      0 |         1 |         1 |          0 |
| Open Redirect         |      0 |         1 |         0 |          0 |
| Prototype Pollution   |      0 |         0 |         1 |          0 |


## javascript

|                       |   lang |   express |   sequelize |   jsonwebtoken |   jose |   browser |   ajv |   grpc |   passport-jwt |   sax |   node-expat |   xml2json |   deno |   shelljs |   aws-lambda |   jquery |   fbjs |   monaco-editor |   serialize-javascript |   wkhtmltopdf |   puppeteer |   chrome-remote-interface |   playwright |   apollo |   wkhtmltoimage |   phantom |   thenify |   vm2 |   bluebird |   sandbox |   argon2 |   vue |   angular |
|:----------------------|-------:|----------:|------------:|---------------:|-------:|----------:|------:|-------:|---------------:|------:|-------------:|-----------:|-------:|----------:|-------------:|---------:|-------:|----------------:|-----------------------:|--------------:|------------:|--------------------------:|-------------:|---------:|----------------:|----------:|----------:|------:|-----------:|----------:|---------:|------:|----------:|
| XSS                   |      1 |        13 |           0 |              0 |      0 |         5 |     0 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |            2 |        3 |      1 |               1 |                      1 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |        0 |     0 |         0 |
| Unmapped Metacategory |      4 |         1 |           2 |              3 |      3 |         0 |     0 |      0 |              1 |     0 |            0 |          0 |      0 |         0 |            1 |        0 |      0 |               0 |                      0 |             0 |           1 |                         0 |            1 |        0 |               0 |         0 |         1 |     2 |          1 |         1 |        1 |     1 |        13 |
| Regex                 |      1 |         0 |           0 |              0 |      0 |         0 |     0 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |            0 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |        0 |     0 |         0 |
| Path Traversal        |      2 |         1 |           0 |              0 |      0 |         0 |     0 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |            0 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |        0 |     0 |         0 |
| Cryptography          |      1 |         0 |           0 |              1 |      1 |         2 |     0 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |            0 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |        0 |     0 |         0 |
| CSRF                  |      1 |         0 |           0 |              0 |      0 |         0 |     0 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |            0 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |        0 |     0 |         0 |
| Open Redirect         |      1 |         2 |           0 |              0 |      0 |         1 |     0 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |            0 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |        0 |     0 |         0 |
| Command Injection     |      4 |         0 |           0 |              0 |      0 |         0 |     0 |      0 |              0 |     0 |            0 |          0 |      1 |         1 |            1 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |        0 |     0 |         0 |
| SQL Injection         |      3 |         1 |           2 |              0 |      0 |         0 |     0 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |            5 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |        0 |     0 |         0 |
| Prototype Pollution   |      3 |         1 |           0 |              0 |      0 |         0 |     0 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |            0 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |        0 |     0 |         0 |
| Code Injection        |      3 |         0 |           0 |              0 |      0 |         2 |     0 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |            1 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |        0 |     0 |         0 |
| Deserialization       |      0 |         1 |           0 |              0 |      0 |         0 |     0 |      1 |              0 |     0 |            0 |          0 |      0 |         0 |            0 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |        0 |     0 |         0 |
| XXE                   |      0 |         5 |           0 |              0 |      0 |         0 |     0 |      0 |              0 |     1 |            1 |          1 |      0 |         0 |            0 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |        0 |     0 |         0 |
| Hard-coded Secrets    |      0 |         1 |           0 |              0 |      0 |         0 |     0 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |            0 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |        0 |     0 |         0 |
| SSRF                  |      0 |         5 |           0 |              0 |      0 |         0 |     0 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |            0 |        0 |      0 |               0 |                      0 |             1 |           4 |                         5 |            5 |        1 |               1 |         1 |         0 |     0 |          0 |         0 |        0 |     0 |         0 |
| Denial of Service     |      0 |         0 |           0 |              0 |      0 |         0 |     1 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |            0 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |        0 |     0 |         0 |


## python

|                       |   jinja2 |   lang |   flask |   django |   jwt |   requests |   pycryptodome |   cryptography |   pyramid |   aws-lambda |   airflow |   sh |   boto3 |   sqlalchemy |   docker |   distributed |   pymongo |
|:----------------------|---------:|-------:|--------:|---------:|------:|-----------:|---------------:|---------------:|----------:|-------------:|----------:|-----:|--------:|-------------:|---------:|--------------:|----------:|
| XSS                   |        2 |      1 |      10 |       19 |     0 |          0 |              0 |              0 |         1 |            2 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| Unmapped Metacategory |        0 |      7 |       2 |        1 |     3 |          1 |              0 |              0 |         0 |            1 |         0 |    0 |       0 |            1 |        1 |             1 |         1 |
| Cryptography          |        0 |      4 |       0 |        0 |     1 |          1 |              9 |              6 |         0 |            0 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| Deserialization       |        0 |      9 |       1 |        1 |     0 |          0 |              0 |              0 |         0 |            1 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| XXE                   |        0 |      1 |       0 |        0 |     0 |          0 |              0 |              0 |         0 |            0 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| Command Injection     |        0 |      9 |       1 |        1 |     0 |          0 |              0 |              0 |         0 |            6 |         1 |    1 |       0 |            0 |        0 |             0 |         0 |
| SQL Injection         |        0 |      1 |       1 |        9 |     0 |          0 |              0 |              0 |         1 |            6 |         0 |    0 |       0 |            2 |        0 |             0 |         0 |
| Code Injection        |        0 |      1 |       2 |        3 |     0 |          0 |              0 |              0 |         0 |            1 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| Path Traversal        |        0 |      0 |       1 |        4 |     0 |          0 |              0 |              0 |         0 |            0 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| CSRF                  |        0 |      0 |       1 |        1 |     0 |          0 |              0 |              0 |         1 |            0 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| Active Debug Code     |        0 |      0 |       4 |        1 |     0 |          0 |              0 |              0 |         0 |            0 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| Open Redirect         |        0 |      0 |       1 |        1 |     0 |          0 |              0 |              0 |         0 |            0 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| Cookie Flag Security  |        0 |      0 |       1 |        1 |     0 |          0 |              0 |              0 |         0 |            0 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| Hard-coded Secrets    |        0 |      0 |       1 |        0 |     0 |          0 |              0 |              0 |         0 |            0 |         0 |    0 |       1 |            0 |        0 |             0 |         0 |
| SSRF                  |        0 |      0 |       2 |        3 |     0 |          0 |              0 |              0 |         0 |            0 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| Denial of Service     |        0 |      0 |       0 |        2 |     0 |          0 |              0 |              0 |         0 |            0 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| Prototype Pollution   |        0 |      0 |       0 |        1 |     0 |          0 |              0 |              0 |         0 |            0 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |


## csharp

|                       |   dotnet |   lang |   razor |
|:----------------------|---------:|-------:|--------:|
| Unmapped Metacategory |        1 |      1 |       1 |
| CSRF                  |        1 |      0 |       0 |
| Cookie Flag Security  |        1 |      0 |       0 |
| Regex                 |        0 |      2 |       0 |
| Path Traversal        |        0 |      1 |       0 |
| Deserialization       |        0 |     10 |       0 |
| XXE                   |        0 |      3 |       0 |
| Command Injection     |        0 |      1 |       0 |
| SQL Injection         |        0 |      1 |       0 |
| SSRF                  |        0 |      4 |       0 |


## c

|                       |   lang |
|:----------------------|-------:|
| Unmapped Metacategory |      8 |


## terraform

|                       |   lang |   aws |   gcp |   azure |
|:----------------------|-------:|------:|------:|--------:|
| Unmapped Metacategory |      2 |     4 |     0 |      18 |
| Cryptography          |      3 |     4 |     1 |       0 |
| Hard-coded Secrets    |      0 |     1 |     0 |       0 |


## typescript

|                       |   react |   aws-cdk |   angular |   lang |   nestjs |
|:----------------------|--------:|----------:|----------:|-------:|---------:|
| Unmapped Metacategory |       4 |         3 |         2 |      1 |        3 |
| Cryptography          |       1 |         0 |         0 |      0 |        0 |
| XSS                   |      10 |         0 |         0 |      0 |        0 |


## scala

|                       |   lang |   play |   jwt-scala |   scala-jwt |   slick |
|:----------------------|-------:|-------:|------------:|------------:|--------:|
| Path Traversal        |      1 |      0 |           0 |           0 |       0 |
| Cryptography          |      1 |      0 |           0 |           0 |       0 |
| Active Debug Code     |      1 |      0 |           0 |           0 |       0 |
| XXE                   |      3 |      0 |           0 |           0 |       0 |
| Command Injection     |      3 |      0 |           0 |           0 |       0 |
| SQL Injection         |      1 |      2 |           0 |           0 |       2 |
| SSRF                  |      3 |      1 |           0 |           0 |       0 |
| Unmapped Metacategory |      1 |      0 |           1 |           1 |       0 |
| CSRF                  |      0 |      1 |           0 |           0 |       0 |
| Cookie Flag Security  |      0 |      1 |           0 |           0 |       0 |
| XSS                   |      0 |      2 |           0 |           0 |       0 |


## json

|                       |   aws |   npm |
|:----------------------|------:|------:|
| Unmapped Metacategory |     1 |     1 |


## contrib

|                       |   nodejsscan |
|:----------------------|-------------:|
| Cryptography          |            1 |
| Unmapped Metacategory |            1 |


## yaml

|                       |   kubernetes |   github-actions |   docker-compose |
|:----------------------|-------------:|-----------------:|-----------------:|
| Active Debug Code     |            1 |                0 |                0 |
| Unmapped Metacategory |           12 |                1 |                6 |
| Command Injection     |            0 |                2 |                0 |
| Mass Assignment       |            0 |                1 |                0 |


## generic

|                       |   ci |   html-templates |   unicode |   secrets |   nginx |
|:----------------------|-----:|-----------------:|----------:|----------:|--------:|
| Unmapped Metacategory |    1 |                0 |         1 |        52 |      11 |
| XSS                   |    0 |                4 |         0 |         0 |       0 |


## bash

|                       |   curl |   lang |
|:----------------------|-------:|-------:|
| Code Injection        |      2 |      0 |
| Unmapped Metacategory |      0 |      1 |


## dockerfile

|                       |   security |
|:----------------------|-----------:|
| Unmapped Metacategory |          2 |


