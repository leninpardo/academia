<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of matricula
 *
 * @author lenin
 */
class matricula extends Main{
    //put your code here
     public function selecciona() {
        if (is_null($this->matricula)) {
            $this->matricula = 0;
        }
        if (is_null($this->fecha)) {
            $this->fecha = date("Y-m-d");
        }
        if (is_null($this->nombres)) {
            $this->nombres = '';
        }
        if(is_null($this->dni)){
            $this->dni=='';
        }
        if(is_null($this->mail)){
            $this->mail=='';
        }
        $datos = array($this->matricula, $this->fecha, $this->nombres,$this->dni,$this->mail);
//        echo '<pre>';print_r($datos);exit;
        $r = $this->get_consulta("sel_matricula", $datos);

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

     /*public function inserta() {
        $datos = array($this->nombre, $this->apellido, $this->direccion, $this->telefono, $this->dni, $this->fechanacimiento,
            $this->estadocivil, $this->usuario, $this->clave, $this->id_perfil);
        $r = $this->get_consulta("ins_empleado", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }*/
}
?>
