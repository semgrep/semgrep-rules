<?php

function test1($input)
{
    $queryBuilder = $conn->createQueryBuilder();

    $queryBuilder
        ->select('id', 'name')
        ->from('users')
        // ruleid: doctrine-orm-dangerous-query
        ->where('email = '.$input)
    ;
}

function test2($email, $input)
{
    $queryBuilder = new QueryBuilder($this->connection);

    $queryBuilder
        ->select('id', 'name')
        ->from('users')
        ->where('email = ?')
        ->setParameter(0, $email)
        // ruleid: doctrine-orm-dangerous-query
        ->andWhere(sprintf('user = %s', $input))
    ;
}

function okTest1($input)
{
    $queryBuilder = $conn->createQueryBuilder();

    $queryBuilder
        ->select('id', 'name')
        ->from('users')
        // ok: doctrine-orm-dangerous-query
        ->where('email = ?')
        ->setParameter(0, $input)
    ;
}
