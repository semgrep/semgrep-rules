<?php

class ProductRepository extends ServiceEntityRepository
{
    public function test1(int $price): array
    {
        $conn = $this->getEntityManager()->getConnection();

        $sql = "SELECT * FROM product p WHERE p.price > " . $_GET['cur_price']. " ORDER BY p.price ASC";
        // ruleid: doctrine-dbal-dangerous-query
        $stmt = $conn->prepare($sql);
        $stmt->execute(['price' => $price]);

        return $stmt->fetchAllAssociative();
    }

    public function test2(): array
    {
        $conn = $this->getEntityManager()->getConnection();

        // ruleid: doctrine-dbal-dangerous-query
        $query = $conn->createQuery("SELECT u FROM User u WHERE u.username = '" . $_GET['username'] . "'");
        $data = $query->getResult();
        return $data;
    }

    public function okTest1(int $price): array
    {
        $conn = $this->getEntityManager()->getConnection();
        $sql = "SELECT * FROM users WHERE username = ?";
        // ok: doctrine-dbal-dangerous-query
        $stmt = $conn->prepare($sql);
        $stmt->bindValue(1, $_GET['username']);
        $resultSet = $stmt->executeQuery();
        return $resultSet;
    }

    public function okTest2(int $price): array
    {
        $conn = $this->foobar();
        $sql = "SELECT * FROM users WHERE username = ?";
        // ok: doctrine-dbal-dangerous-query
        $stmt = $conn->prepare($sql);
        $stmt->bindValue(1, $_GET['username']);
        $resultSet = $stmt->executeQuery();
        return $resultSet;
    }

}
