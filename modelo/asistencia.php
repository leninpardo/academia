<?php

class asistencia extends Main {

    public $idasistencia;
    public $cursos;
    public $alumno;
    public $idmatricula;
    public $idcurso;
    public $idhorario;
    public $fecha;
    public $justificacion;

    public function selecciona() {
        if (is_null($this->idasistencia)) {
            $this->idasistencia = 0;
        }
        if (is_null($this->cursos)) {
            $this->cursos = '';
        }
        if (is_null($this->alumno)) {
            $this->alumno = '';
        }
        
        $datos = array($this->idasistencia, $this->cursos, $this->alumno);
        $r = $this->get_consulta("sel_asistencia", $datos);
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
        $datos = array($this->idmatricula,$this->idcurso,$this->idhorario,$this->fecha,$this->justificacion);
        $r = $this->get_consulta("ins_asistencia", $datos);
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
