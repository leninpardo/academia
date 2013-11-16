<?php

class institucioneducativa extends Main{

    public $idinstitucioneducativa;
    public $nombre;
    public $curricula;
    public $telefono_fijo;
    public $direccion;

    public function selecciona() {
        if(is_null($this->idinstitucioneducativa)){
            $this->idinstitucioneducativa=0;
        }
        if(is_null($this->nombre)){
            $this->nombre='';
        }
        $datos = array($this->idinstitucioneducativa,$this->nombre);
        $r = $this->get_consulta("sel_institucioneducativa", $datos);
        if ($r[1] == '') {
            $stmt = $r[0];
        } else {
            die($r[1]);
        }
        $r = null;
         if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    
    
     public function inserta() {
        $datos = array(0,$this->nombre,  $this->curricula,  $this->telefono_fijo, $this->direccion);
        $r = $this->get_consulta("ins_act_institucioneducativa", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function elimina() {
        $datos = array($this->idinstitucioneducativa);
        $r = $this->get_consulta("elim_institucioneducativa", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

   

 public function actualiza() {
        $datos = array($this->idinstitucioneducativa, $this->nombre,  $this->curricula,  $this->telefono_fijo, $this->direccion);
        $r = $this->get_consulta("ins_act_institucioneducativa", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

}

?>

