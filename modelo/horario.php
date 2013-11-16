<?php

class horario extends Main{

    public $idhorario;
    public $turno;
    public $dia;
    public $hora_inicio;
    public $hora_fin;

    public function selecciona() {
        if(is_null($this->idhorario)){
            $this->idhorario=0;
        }
        if(is_null($this->turno)){
            $this->turno='';
        }
        $datos = array($this->idhorario,$this->turno);
        $r = $this->get_consulta("sel_horario", $datos);
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
        $datos = array(0,$this->turno,  $this->dia,  $this->hora_inicio, $this->hora_fin);
        $r = $this->get_consulta("ins_act_horario", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function elimina() {
        $datos = array($this->idhorario);
        $r = $this->get_consulta("elim_horario", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

   

 public function actualiza() {
        $datos = array($this->idhorario, $this->turno,  $this->dia,  $this->hora_inicio, $this->hora_fin);
        $r = $this->get_consulta("ins_act_horario", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

}

?>
