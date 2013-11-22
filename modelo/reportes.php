<?php
/*NUEVO
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of reportes
 *
 * @author doraliza santa cruz
 */
class reportes extends Main{
    public $idpromocion;
    public $datos;
    public $id;
    public $curso_id;
    
    public function selecciona() {
        $datos = null;
        $r = $this->get_consulta("pa_promociones_todo", $datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
         if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    public function selecciona_datos_empresa() {
        if(is_null($this->id)){
            $this->id=1;
        }
        $datos = array($this->id);
        $r = $this->get_consulta("pa_selecciona_datos_empresa", $datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
         if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }

    public function selecciona_cursos_x_alumnos($datos) {
        //$datos=array($this->curso_id);
        $r = $this->get_consulta("pa_reportealumnoxcurso",$datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
         if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    
       public function selecciona_turno_x_asistencia($datos) {
        //$datos=array($this->curso_id);
        $r = $this->get_consulta("re_turnoxasistencia",$datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
         if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    
    
     public function selecciona_cursos($datos) {
        //$datos=array($this->curso_id);
        $r = $this->get_consulta("re_cursos",$datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
         if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
      public function selecciona_horario($datos) {
        //$datos=array($this->curso_id);
        $r = $this->get_consulta("re_horario",$datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
         if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    
//    public function index() {
//        //$this->_membresias->idreportes = 0;
//        //$this->_vista->datos = $this->_reportes->selecciona();
//        //$this->_reportes->idpromocion = 0;
//        $datos = $this->selecciona();
//        $cabeceras = array ('idpromocion','descripcion', 'descuento', 'fecha_inicio', 'fecha_final');
//        $this->_vista->datos = $this->get_matriz($datos, $cabeceras);
//        //$this->_vista->renderizar('index');
//    }
    
//    public function promociones(){
//        $n_promociones = count($this->datos);
//        for ($i = 0; $i < count($this->datos); $i++) {
//            $c_codigo=$c_codigo.$this->datos[$i]['idpromocion']."\n";
//            $c_descripcion=$c_descripcion.$this->datos[$i]['descripcion']."\n";
//        }
//        
//    }

}
?>
