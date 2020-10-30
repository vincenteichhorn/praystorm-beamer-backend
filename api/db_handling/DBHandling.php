<?php

trait DBHandling {
    protected function selectFromDB(string $table,string $columns,array $condition=array(),string $filter=""){
        require DB_CONFIG_FILE;
        $pdo = new PDO($dns,$user,$psw);
        $sqlstatement = "SELECT ".$columns." FROM ".$table;
        $input=array();
        if(count($condition)!=0){
            $sqlstatement = $sqlstatement." WHERE";
            foreach($condition as $element){
                $sqlstatement = $sqlstatement." ".$element[0]."=? AND";
                $input[] = $element[1];
            }
            $sqlstatement = substr($sqlstatement,0,-4);
        }
        $sqlstatement = $sqlstatement." ".$filter;
        $statement = $pdo->prepare($sqlstatement);
        $statement->execute($input);
        $erg=array();
        while($row = $statement->fetch()) {
            $erg[]=$row;
        }
        return $erg;
    }

    public function countElements($table, $filter = array()){
        require DB_CONFIG_FILE;
        $pdo = new PDO($dns,$user,$psw);
        $sqlfilter="";
        $sqlinput=array();
        if(count($filter)!=0){
            $sqlfilter=" WHERE";
            foreach($filter as $element){
                $sqlfilter = $sqlfilter." ".$element[0]."=? AND";
                $sqlinput[] = $element[1];
            }
            $sqlfilter = substr($sqlfilter, 0, -4);
        }
        $sql = "SELECT COUNT(id) AS number FROM ".$table.$sqlfilter;
        $statement = $pdo->prepare($sql);
        $statement->execute($sqlinput);
        $data = $statement->fetch();
        return $data['number'];
    }

    protected function writeInDB(string $table,array $data){          //(Tabellenname,array(array(0=>"spalte",1=>"Daten")))
        require DB_CONFIG_FILE;
        $sql = "INSERT INTO ".$table." (";
        $sqlvalue="(";
        $sqlinput=array();
        foreach($data as $element){
            $sql = $sql.$element[0].", ";
            $sqlvalue=$sqlvalue."?, ";
            $sqlinput[]=$element[1];
        }
        $sqlvalue=substr($sqlvalue,0,-2).")";
        $sql=substr($sql,0,-2).") VALUES ".$sqlvalue;
        $pdo = new PDO($dns,$user,$psw);
        $statement = $pdo->prepare($sql);
        $statement->execute($sqlinput);
    }

    protected function deleteFromDB(string $table,array $condition){  //(Tabellenname, array(array("spalte","text")))
        require DB_CONFIG_FILE;
        $pdo = new PDO($dns,$user,$psw);
        $sql = "DELETE FROM ".$table." WHERE ";
        $sqlinput=array();
        foreach($condition as $element){
            $sql = $sql.$element[0]."=? AND ";
            $sqlinput[]=$element[1];
        }
        $sql = substr($sql,0,-5);
        $statement = $pdo->prepare($sql);
        $statement->execute($sqlinput);
    }

    protected function updateDB(string $table, array $data, array $condition){
        require DB_CONFIG_FILE;
        $pdo = new PDO($dns,$user,$psw);
        $sql = "UPDATE ".$table." SET ";
        $sqlinput=array();
        foreach($data as $element){
            $sql = $sql.$element[0]."=?, ";
            $sqlinput[]=$element[1];
        }
        $sql = substr($sql,0,-2)." WHERE ";
        foreach($condition as $element){
            $sql = $sql.$element[0]."=? AND ";
            $sqlinput[]=$element[1];
        }
        $sql = substr($sql,0,-5);
        $statement = $pdo->prepare($sql);
        $statement->execute($sqlinput);
    }

}

?>