<?php
class cursos extends Main{

    public $idcursos;
    public $nombre_cursos;

    public function selecciona() {
        if(is_null($this->idcursos)){
            $this->idcursos=0;
        }
        if(is_null($this->nombre_cursos)){
            $this->nombre_cursos='';
        }
        $datos = array($this->idcursos,$this->nombre_cursos);
        $r = $this->get_consulta("sel_cursos", $datos);
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
        $datos = array(0,$this->nombre_cursos);
        $r = $this->get_consulta("ins_act_cursos", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function elimina() {
        $datos = array($this->idcursos);
        $r = $this->get_consulta("elim_cursos", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

   

 public function actualiza() {
        $datos = array($this->idcursos, $this->nombre_cursos);
        $r = $this->get_consulta("ins_act_cursos", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

}

?>
