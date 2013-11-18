<?php

class alumnomatriculados extends Main {

    public $idmatricula;
    public $nombre;
    public function selecciona() {
        if (is_null($this->idmatricula)) {
            $this->idmatricula = 0;
        }
        if (is_null($this->nombre)) {
            $this->nombre = '';
        }
 
        
        $datos = array($this->idmatricula, $this->nombre);
        $r = $this->get_consulta("sel_alumnosmatriculado", $datos);
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
        }
    }

    public function inserta() {
        $datos = array(0,$this->idubigeo,$this->idinstitucioneducativa,$this->nombre,  $this->apellido_paterno,
            $this->apellido_materno,$this->dni, $this->sexo,$this->telefono_movil, $this->email, $this->fecha_nacimiento, $this->grado);
        $r = $this->get_consulta("ins_act_alumno", $datos);
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
        }
    }

    public function actualiza() {
       $datos = array($this->idalumno,$this->idubigeo,$this->idinstitucioneducativa,$this->nombre,  $this->apellido_paterno,
                   $this->apellido_materno,$this->dni, $this->sexo,$this->telefono_movil, $this->email, $this->fecha_nacimiento, $this->grado);
        $r = $this->get_consulta("ins_act_alumno", $datos);
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
        }
    }

}

?>
