<?php

class apoderado extends Main{

    public $idapoderado;
    public $nombre;
    public $apellido_paterno;
    public $apellido_materno;
    public $direccion;
    public $ocupacion;  
    public $fecha_nacimiento;
    public $dni;

    public function selecciona() {
        if(is_null($this->idapoderado)){
            $this->idapoderado=0;
        }
        if(is_null($this->nombre)){
            $this->nombre='';
        }
         if(is_null($this->apellido_paterno)){
            $this->nombre='';
        }
          if(is_null($this->apellido_materno)){
            $this->nombre='';
        }
        $datos = array($this->idapoderado, $this->nombre,  $this->apellido_paterno, $this->apellido_materno);
        $r = $this->get_consulta("sel_apoderado", $datos);
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
        $datos = array(0,$this->nombre,  $this->apellido_paterno,$this->apellido_materno, $this->direccion,  $this->ocupacion
                       ,$this->fecha_nacimiento,  $this->dni);
        $r = $this->get_consulta("ins_act_apoderado", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function elimina() {
        $datos = array($this->idapoderado);
        $r = $this->get_consulta("elim_apoderado", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

   

   public function actualiza() {
        $datos = array($this->idapoderado,$this->nombre,  $this->apellido_paterno,$this->apellido_materno, $this->direccion,  $this->ocupacion
                       ,$this->fecha_nacimiento,  $this->dni);
        $r = $this->get_consulta("ins_act_apoderado", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }


}

?>



