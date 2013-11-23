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
    public $turno;

    public function selecciona() {
        if (is_null($this->turno)) {
            $this->turno =0;
        }
          
        $datos = array($this->turno);
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
        $datos = array($this->idmatricula,$this->idhorario,$this->fecha,$this->justificacion);
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
    
     public function elimina() {
        $datos ='';
        $r = $this->get_consulta("elim_asistencia", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }


}

?>
