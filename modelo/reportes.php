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
    public function selecciona_numero_arribos_huesped_dia_mes($mesano) {
        $datos=$mesano;
        $r = $this->get_consulta("pa_selecciona_numero_arribos_huesped_dia_mes", $datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
         if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    public function selecciona_cantidad_empleados_x_tipo_x_actividad() {
        $dat=null;
        $r = $this->get_consulta("pa_selecciona_cantidad_empleados_x_tipo_x_actividad", $dat);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
         if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    public function selecciona_numero_arribos_huesped_ubigeo_nacional($mesano) {
        $datos=$mesano;
        $r = $this->get_consulta("pa_selecciona_numero_arribos_huesped_ubigeo_nacional", $datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
         if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    public function selecciona_numero_arribos_huesped_ubigeo_internacional($mesano) {
        $datos=$mesano;
        $r = $this->get_consulta("pa_selecciona_numero_arribos_huesped_ubigeo_internacional", $datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
         if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    public function selecciona_numero_arribos_x_tipo_habitacion($mesano) {
        $datos=$mesano;
        $r = $this->get_consulta("pa_selecciona_numero_arribos_x_tipo_habitacion", $datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
        if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    public function selecciona_stock_total($ubicacion) {
        $datos = array($ubicacion);
        $r = $this->get_consulta("pa_selecciona_stock_total", $datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
         if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    public function selecciona_ubicaciones() {
        $datos = array(0,'','');
        $r = $this->get_consulta("pa_selecciona_ubicaciones", $datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
         if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    public function selecciona_tipo_habitacion_total(){
        $datos = array(0,"");
        $r = $this->get_consulta("pa_selecciona_tipo_habitacion", $datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
         if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    public function selecciona_habitaciones_x_tipo_habitacion(){
        $datos = null;
        $r = $this->get_consulta("pa_selecciona_hab_tip_hab", $datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
         if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    public function selecciona_numero_pernoctaciones_x_tipo_habitacion($mesano){
        $datos = $mesano;
        $r = $this->get_consulta("pa_selecciona_numero_pernoctaciones_x_tipo_habitacion", $datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
         if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    public function selecciona_numero_pernoctaciones_huesped_ubigeo_internacional($mesano){
        $datos = $mesano;
        $r = $this->get_consulta("pa_selecciona_numero_pernoctaciones_huesped_ubigeo_internacional", $datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
        if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    public function selecciona_numero_pernoctaciones_huesped_ubigeo_nacional($mesano){
        $datos = $mesano;
        $r = $this->get_consulta("pa_selecciona_numero_pernoctaciones_huesped_ubigeo_nacional", $datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
         if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    public function selecciona_datos_comprobante_venta($idventa){
        $datos = $idventa;
        $r = $this->get_consulta("pa_selecciona_dat_comp_v", $idventa);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
         if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    public function selecciona_datos_detalle_comprobante_venta($idventa){
        $datos = $idventa;
        $r = $this->get_consulta("pa_selecciona_dat_de_comp_v", $idventa);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
         if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    public function selecciona_ventas_x_producto($idprod_fecha_inicio_fecha_fin){
        $datos = $idprod_fecha_inicio_fecha_fin;
        $r = $this->get_consulta("pa_selecciona_vent_prod", $datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
         if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    public function selecciona_productos_vendidos($fecha_inicio_fecha_fin){
        $datos = $fecha_inicio_fecha_fin;
        $r = $this->get_consulta("pa_selecciona_productos_vendidos", $datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
        if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    public function selecciona_compras_x_producto($idprod_fecha_inicio_fecha_fin){
        $datos = $idprod_fecha_inicio_fecha_fin;
        $r = $this->get_consulta("pa_selecciona_compras_x_producto", $datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
        if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    public function selecciona_productos_comprados($fecha_inicio_fecha_fin){
        $datos = $fecha_inicio_fecha_fin;
        $r = $this->get_consulta("pa_selecciona_productos_comprados", $datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
        if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    public function selecciona_compras_x_intervalo_fechas($fecha_inicio_fecha_fin){
        $datos = $fecha_inicio_fecha_fin;
        $r = $this->get_consulta("pa_selecciona_compras_x_intervalo_fechas", $datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
        if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    public function selecciona_habitaciones_detalle_estadia($idventa){
        $datos = array($idventa);
        $r = $this->get_consulta("pa_selecciona_habitaciones_detalle_estadia", $datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
        if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    public function selecciona_ventas($idventa){
        $datos = array($idventa, '', '', '');
        $r = $this->get_consulta("pa_selecciona_ventas", $datos);
        if ($r[1] == '') {$stmt = $r[0];} else {die($r[1]);}$r = null;
        if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
        };
    }
    public function selecciona_detalle_estadia_x_huesped($idventa){
        $datos = array($idventa);
        $r = $this->get_consulta("pa_selecciona_de_x_h", $datos);
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
