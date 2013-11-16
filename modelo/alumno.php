<?php

class alumno extends Main {

    public $idalumno;
    public $idubigeo;
    public $idinstitucioneducativa;
    public $nombres;
    public $apellido_paterno;
    public $apellido_materno;
    public $dni;
    public $sexo;
    public $telefono_movil;
    public $email;
    public $fecha_nacimiento;
    public $grado;  
   
    public $nombresyapellidos;
    
    public function selecciona() {
        if (is_null($this->idalumno)) {
            $this->idalumno = 0;
        }
        if (is_null($this->nombres)) {
            $this->nombres = '';
        }
        if (is_null($this->dni)) {
            $this->dni = '';
        }
        
        $datos = array($this->idalumno, $this->nombres, $this->dni);
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
        $datos = array(0, $this->nombres, $this->apellidos, $this->documento, $this->fecha_nacimiento,
            $this->sexo, $this->telefono, $this->email, $this->estado_civil, $this->idprofesion, $this->idubigeo,
            $this->direccion, $this->tipo);
        $r = $this->get_consulta("ins_act_cliente", $datos);
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
        $datos = array($this->idcliente, $this->nombres, $this->apellidos, $this->documento, $this->fecha_nacimiento,
            $this->sexo, $this->telefono, $this->email, $this->estado_civil, $this->idprofesion, $this->idubigeo,
            $this->direccion, $this->tipo);

        $r = $this->get_consulta("ins_act_cliente", $datos);
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
