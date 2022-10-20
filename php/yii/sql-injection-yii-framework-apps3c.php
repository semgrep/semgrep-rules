<?php    


class TestCasePHPSQL
{


	 public function test1(string $type, string $name)
     {
    

        $a = $name;
        
        $query->select("BBBB");

        $query->select("AAAA").where("NNNN");

        $query->aaa().select("AAAA").where("NNNN");

        $db.select("BBBB");



    } 

    # Detected only with rules with many false positives
    public function test2(string $type, string $name)
     {
    

        $a = $name;
        
        $query->select($a);

        $query->select("AAAA").where($name);

        $query->aaa().select($type).where("NNNN");

        $db.select($name);



    }     



    public function test3(string $type, string $name)
     {
    
        $query->select(["aa" . $name . "bb"]);






    }    

    public function test4(string $type, string $name)
     {

        $query = new Query();
        $query->select([
            'id AS qid',
            'test',
            "('".$name."') AS group",
            'CASE WHEN 1>2 THEN 1 ELSE 2 END AS name',
            'type',
        ])->from('test_table')->orderBy('default_sort');


    }


    public function test5(string $type, string $name)
     {
    

        $a = $b;
        
        select("WHERE Name LIKE '{$name->ssss}%'");
        

    }



}

?>