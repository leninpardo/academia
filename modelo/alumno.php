<?php

class alumno extends Main {

    public $idalumno;
    public $idubigeo;
    public $idinstitucioneducativa;
    public $nombre;
    public $apellido_paterno;
    public $apellido_materno;
    public $dni;
    public $sexo;
    public $telefono_movil;
    public $email;
    public $fecha_nacimiento;
    public $grado;  
    
    public function selecciona() {
        if (is_null($this->idalumno)) {
            $this->idalumno = 0;
        }
        if (is_null($this->nombre)) {
            $this->nombre = '';
        }
        if (is_null($this->dni)) {
            $this->dni = '';
        }
        
        $datos = array($this->idalumno, $this->nombre, $this->dni);
        $r = $this->get_consulta("sel_alumno", $datos);
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
