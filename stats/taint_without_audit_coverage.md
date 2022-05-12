## ruby

|                       |   rails |   lang |   aws-lambda |
|:----------------------|--------:|-------:|-------------:|
| Regex                 |       1 |      0 |            0 |
| Path Traversal        |       3 |      0 |            0 |
| Open Redirect         |       1 |      0 |            0 |
| Unmapped Metacategory |       1 |      1 |            0 |
| XSS                   |       2 |      0 |            0 |
| SQL Injection         |       2 |      0 |            5 |
| Code Injection        |       2 |      0 |            0 |
| Cryptography          |       0 |      1 |            0 |
| Deserialization       |       0 |      0 |            1 |


## csharp

|                |   lang |   dotnet |
|:---------------|-------:|---------:|
| Path Traversal |      1 |        0 |
| XXE            |      3 |        0 |
| Code Injection |      0 |        1 |


## java

|                       |   lang |   spring |   aws-lambda |
|:----------------------|-------:|---------:|-------------:|
| Path Traversal        |      1 |        0 |            0 |
| Unmapped Metacategory |      0 |        1 |            0 |
| Command Injection     |      0 |        1 |            0 |
| XSS                   |      0 |        1 |            0 |
| SQL Injection         |      0 |        1 |            2 |
| SSRF                  |      0 |        1 |            0 |


## go

|                |   lang |   aws-lambda |
|:---------------|-------:|-------------:|
| Path Traversal |      1 |            0 |
| XSS            |      1 |            0 |
| SQL Injection  |      1 |            2 |
| SSRF           |      1 |            0 |


## php

|                 |   lang |   laravel |
|:----------------|-------:|----------:|
| Cryptography    |      1 |         0 |
| Code Injection  |      1 |         0 |
| Deserialization |      1 |         0 |
| SQL Injection   |      1 |         3 |
| SSRF            |      2 |         0 |


## javascript

|                       |   express |   lang |   aws-lambda |   argon2 |   angular |
|:----------------------|----------:|-------:|-------------:|---------:|----------:|
| Unmapped Metacategory |         3 |      0 |            1 |        1 |         3 |
| XXE                   |         1 |      0 |            0 |        0 |         0 |
| SQL Injection         |         1 |      0 |            5 |        0 |         0 |
| Prototype Pollution   |         1 |      0 |            0 |        0 |         0 |
| SSRF                  |         1 |      0 |            0 |        0 |         0 |
| Code Injection        |         3 |      0 |            2 |        0 |         0 |
| Open Redirect         |         0 |      1 |            0 |        0 |         0 |
| Command Injection     |         0 |      0 |            1 |        0 |         0 |
| XSS                   |         0 |      0 |            2 |        0 |         0 |


## python

|                       |   aws-lambda |   flask |   django |   pyramid |
|:----------------------|-------------:|--------:|---------:|----------:|
| Deserialization       |            1 |       0 |        0 |         0 |
| Command Injection     |            6 |       0 |        0 |         0 |
| XSS                   |            2 |       1 |        1 |         1 |
| SQL Injection         |            6 |       1 |        1 |         1 |
| Unmapped Metacategory |            1 |       1 |        1 |         0 |
| Code Injection        |            1 |       0 |        0 |         0 |
| SSRF                  |            0 |       1 |        1 |         0 |


## scala

|               |   play |
|:--------------|-------:|
| SQL Injection |      2 |
| XSS           |      1 |


## bash

|                |   curl |
|:---------------|-------:|
| Code Injection |      1 |


