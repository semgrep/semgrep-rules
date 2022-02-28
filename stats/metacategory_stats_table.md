## go

|                       |   gorilla |   lang |   grpc |   jwt-go |   otto |   template |
|:----------------------|----------:|-------:|-------:|---------:|-------:|-----------:|
| Cookie Flag Security  |         1 |      1 |      0 |        0 |      0 |          0 |
| Unmapped Metacategory |         1 |      5 |      0 |        0 |      1 |          1 |
| Path Traversal        |         0 |      1 |      0 |        0 |      0 |          0 |
| Cryptography          |         0 |      1 |      2 |        1 |      0 |          0 |
| Denial of Service     |         0 |      1 |      0 |        0 |      0 |          0 |
| Code Injection        |         0 |      1 |      0 |        0 |      0 |          0 |
| Active Debug Code     |         0 |      1 |      0 |        0 |      0 |          0 |
| XSS                   |         0 |     14 |      0 |        0 |      0 |          0 |
| SQL Injection         |         0 |      2 |      0 |        0 |      0 |          0 |
| Mass Assignment       |         0 |      2 |      0 |        0 |      0 |          0 |
| SSRF                  |         0 |      1 |      0 |        0 |      0 |          0 |
| Hard-coded Secrets    |         0 |      0 |      0 |        1 |      0 |          0 |


## java

|                       |   lang |   jax-rs |   servlets |   jjwt |   java-jwt |   spring |   rmi |   log4j |   jboss |   android |
|:----------------------|-------:|---------:|-----------:|-------:|-----------:|---------:|------:|--------:|--------:|----------:|
| Cookie Flag Security  |      1 |        0 |          0 |      0 |          0 |        0 |     0 |       0 |       0 |         0 |
| Unmapped Metacategory |     10 |        0 |          0 |      0 |          1 |        2 |     0 |       1 |       1 |         7 |
| XSS                   |      2 |        0 |          0 |      0 |          0 |        0 |     0 |       0 |       0 |         0 |
| Command Injection     |      2 |        0 |          0 |      0 |          0 |        0 |     0 |       0 |       0 |         0 |
| Path Traversal        |      1 |        1 |          0 |      0 |          0 |        0 |     0 |       0 |       0 |         0 |
| Cryptography          |      1 |        0 |          1 |      1 |          1 |        0 |     0 |       0 |       0 |         0 |
| CSRF                  |      1 |        0 |          0 |      0 |          0 |        2 |     0 |       0 |       0 |         0 |
| Code Injection        |      1 |        0 |          0 |      0 |          0 |        1 |     0 |       0 |       1 |         0 |
| Deserialization       |      3 |        2 |          0 |      0 |          0 |        0 |     2 |       0 |       0 |         0 |
| Open Redirect         |      1 |        0 |          0 |      0 |          0 |        1 |     0 |       0 |       0 |         0 |
| XXE                   |      3 |        0 |          0 |      0 |          0 |        0 |     0 |       0 |       0 |         0 |
| SQL Injection         |      2 |        0 |          0 |      0 |          0 |        1 |     0 |       0 |       0 |         0 |


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

|                       |   lang |   symfony |   doctrine |
|:----------------------|-------:|----------:|-----------:|
| Unmapped Metacategory |     13 |         1 |          0 |
| Path Traversal        |      1 |         0 |          0 |
| Cryptography          |      1 |         0 |          0 |
| Deserialization       |      1 |         0 |          0 |
| SQL Injection         |      1 |         0 |          2 |
| SSRF                  |      2 |         0 |          0 |
| CSRF                  |      0 |         1 |          0 |
| Open Redirect         |      0 |         1 |          0 |


## javascript

|                       |   lang |   express |   sequelize |   jsonwebtoken |   jose |   browser |   ajv |   grpc |   passport-jwt |   sax |   node-expat |   xml2json |   deno |   shelljs |   jquery |   fbjs |   monaco-editor |   serialize-javascript |   wkhtmltopdf |   puppeteer |   chrome-remote-interface |   playwright |   apollo |   wkhtmltoimage |   phantom |   thenify |   vm2 |   bluebird |   sandbox |   vue |   angular |
|:----------------------|-------:|----------:|------------:|---------------:|-------:|----------:|------:|-------:|---------------:|------:|-------------:|-----------:|-------:|----------:|---------:|-------:|----------------:|-----------------------:|--------------:|------------:|--------------------------:|-------------:|---------:|----------------:|----------:|----------:|------:|-----------:|----------:|------:|----------:|
| XSS                   |      1 |        13 |           0 |              0 |      0 |         5 |     0 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |        3 |      1 |               1 |                      1 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |     0 |         0 |
| Unmapped Metacategory |      4 |         3 |           2 |              3 |      3 |         0 |     0 |      0 |              1 |     0 |            0 |          0 |      0 |         0 |        0 |      0 |               0 |                      0 |             0 |           1 |                         0 |            1 |        0 |               0 |         0 |         1 |     2 |          1 |         1 |     1 |        12 |
| Regex                 |      1 |         0 |           0 |              0 |      0 |         0 |     0 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |     0 |         0 |
| Path Traversal        |      2 |         1 |           0 |              0 |      0 |         0 |     0 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |     0 |         0 |
| Cryptography          |      1 |         0 |           0 |              1 |      1 |         2 |     0 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |     0 |         0 |
| CSRF                  |      1 |         0 |           0 |              0 |      0 |         0 |     0 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |     0 |         0 |
| Open Redirect         |      1 |         1 |           0 |              0 |      0 |         1 |     0 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |     0 |         0 |
| Command Injection     |      4 |         0 |           0 |              0 |      0 |         0 |     0 |      0 |              0 |     0 |            0 |          0 |      1 |         1 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |     0 |         0 |
| SQL Injection         |      1 |         1 |           1 |              0 |      0 |         0 |     0 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |     0 |         0 |
| Prototype Pollution   |      3 |         1 |           0 |              0 |      0 |         0 |     0 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |     0 |         0 |
| Code Injection        |      3 |         0 |           0 |              0 |      0 |         2 |     0 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |     0 |         0 |
| XXE                   |      0 |         3 |           0 |              0 |      0 |         0 |     0 |      0 |              0 |     1 |            1 |          1 |      0 |         0 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |     0 |         0 |
| SSRF                  |      0 |         5 |           0 |              0 |      0 |         0 |     0 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |        0 |      0 |               0 |                      0 |             1 |           4 |                         5 |            5 |        1 |               1 |         1 |         0 |     0 |          0 |         0 |     0 |         0 |
| Denial of Service     |      0 |         0 |           0 |              0 |      0 |         0 |     1 |      0 |              0 |     0 |            0 |          0 |      0 |         0 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |     0 |         0 |
| Deserialization       |      0 |         0 |           0 |              0 |      0 |         0 |     0 |      1 |              0 |     0 |            0 |          0 |      0 |         0 |        0 |      0 |               0 |                      0 |             0 |           0 |                         0 |            0 |        0 |               0 |         0 |         0 |     0 |          0 |         0 |     0 |         0 |


## python

|                       |   jinja2 |   lang |   flask |   django |   jwt |   requests |   pycryptodome |   cryptography |   airflow |   sh |   boto3 |   sqlalchemy |   docker |   distributed |   pymongo |
|:----------------------|---------:|-------:|--------:|---------:|------:|-----------:|---------------:|---------------:|----------:|-----:|--------:|-------------:|---------:|--------------:|----------:|
| XSS                   |        1 |      1 |      10 |       19 |     0 |          0 |              0 |              0 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| Unmapped Metacategory |        0 |      7 |       2 |        1 |     3 |          1 |              0 |              0 |         0 |    0 |       0 |            1 |        1 |             1 |         1 |
| Cryptography          |        0 |      4 |       0 |        0 |     1 |          1 |              9 |              6 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| Deserialization       |        0 |      9 |       1 |        1 |     0 |          0 |              0 |              0 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| XXE                   |        0 |      1 |       0 |        0 |     0 |          0 |              0 |              0 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| Command Injection     |        0 |      9 |       1 |        1 |     0 |          0 |              0 |              0 |         1 |    1 |       0 |            0 |        0 |             0 |         0 |
| SQL Injection         |        0 |      1 |       1 |        9 |     0 |          0 |              0 |              0 |         0 |    0 |       0 |            2 |        0 |             0 |         0 |
| Code Injection        |        0 |      1 |       2 |        3 |     0 |          0 |              0 |              0 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| Path Traversal        |        0 |      0 |       1 |        4 |     0 |          0 |              0 |              0 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| CSRF                  |        0 |      0 |       1 |        1 |     0 |          0 |              0 |              0 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| Active Debug Code     |        0 |      0 |       4 |        1 |     0 |          0 |              0 |              0 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| Open Redirect         |        0 |      0 |       1 |        1 |     0 |          0 |              0 |              0 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| Cookie Flag Security  |        0 |      0 |       1 |        1 |     0 |          0 |              0 |              0 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| Hard-coded Secrets    |        0 |      0 |       1 |        0 |     0 |          0 |              0 |              0 |         0 |    0 |       1 |            0 |        0 |             0 |         0 |
| SSRF                  |        0 |      0 |       2 |        3 |     0 |          0 |              0 |              0 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| Denial of Service     |        0 |      0 |       0 |        2 |     0 |          0 |              0 |              0 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |
| Prototype Pollution   |        0 |      0 |       0 |        1 |     0 |          0 |              0 |              0 |         0 |    0 |       0 |            0 |        0 |             0 |         0 |


## csharp

|                       |   dotnet |   lang |   razor |
|:----------------------|---------:|-------:|--------:|
| Unmapped Metacategory |        1 |      1 |       1 |
| CSRF                  |        1 |      0 |       0 |
| Cookie Flag Security  |        1 |      0 |       0 |
| Regex                 |        0 |      2 |       0 |
| Deserialization       |        0 |     10 |       0 |
| XXE                   |        0 |      3 |       0 |
| Command Injection     |        0 |      1 |       0 |
| SQL Injection         |        0 |      1 |       0 |
| SSRF                  |        0 |      4 |       0 |


## terraform

|                       |   lang |   aws |   azure |
|:----------------------|-------:|------:|--------:|
| Unmapped Metacategory |      2 |     1 |      18 |
| Cryptography          |      3 |     1 |       0 |


## typescript

|                       |   react |   aws-cdk |   angular |   lang |   nestjs |
|:----------------------|--------:|----------:|----------:|-------:|---------:|
| Unmapped Metacategory |       4 |         3 |         2 |      1 |        3 |
| Cryptography          |       1 |         0 |         0 |      0 |        0 |
| XSS                   |      10 |         0 |         0 |      0 |        0 |


## ruby

|                       |   rails |   jwt |   lang |
|:----------------------|--------:|------:|-------:|
| Path Traversal        |       3 |     0 |      0 |
| Unmapped Metacategory |       7 |     3 |     22 |
| Open Redirect         |       1 |     0 |      0 |
| Command Injection     |       1 |     0 |      0 |
| XSS                   |      12 |     0 |      0 |
| SQL Injection         |       1 |     0 |      0 |
| SSRF                  |       1 |     0 |      0 |
| Cryptography          |       0 |     1 |      1 |
| CSRF                  |       0 |     0 |      1 |
| Hard-coded Secrets    |       0 |     0 |      1 |
| Prototype Pollution   |       0 |     0 |      2 |


## scala

|                       |   lang |   scala-jwt |
|:----------------------|-------:|------------:|
| Path Traversal        |      1 |           0 |
| Cryptography          |      1 |           0 |
| Unmapped Metacategory |      0 |           1 |


## json

|                       |   aws |
|:----------------------|------:|
| Unmapped Metacategory |     1 |


## contrib

|                       |   nodejsscan |
|:----------------------|-------------:|
| Cryptography          |            1 |
| Unmapped Metacategory |            1 |


## c

|                       |   lang |
|:----------------------|-------:|
| Unmapped Metacategory |      8 |


## yaml

|                       |   kubernetes |   github-actions |   docker-compose |
|:----------------------|-------------:|-----------------:|-----------------:|
| Active Debug Code     |            1 |                0 |                0 |
| Unmapped Metacategory |           11 |                1 |                6 |
| Command Injection     |            0 |                2 |                0 |
| Mass Assignment       |            0 |                1 |                0 |


## generic

|                       |   html-templates |   unicode |   dockerfile |   ci |   secrets |   nginx |
|:----------------------|-----------------:|----------:|-------------:|-----:|----------:|--------:|
| XSS                   |                4 |         0 |            0 |    0 |         0 |       0 |
| Unmapped Metacategory |                0 |         1 |            2 |    1 |        52 |      11 |


## bash

|                       |   curl |   lang |
|:----------------------|-------:|-------:|
| Code Injection        |      2 |      0 |
| Unmapped Metacategory |      0 |      1 |


