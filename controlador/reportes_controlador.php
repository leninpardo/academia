<?php

class reportes_controlador extends controller {

    private $_reportes;
    private $_fpdf;

    public function __construct() {
        if (!$this->acceso(47)) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
        $this->get_Libreria('fpdf' . DS . 'fpdf');
        $this->_fpdf = new FPDF('P','mm','A4');
        //$this->_reportes = $this->cargar_modelo('reportes');
        //$this->_productos = $this->cargar_modelo('productos');
    }
    
    public function index() {
        //$this->_vista->datos_productos=$this->_productos->selecciona();
        $this->_vista->setJs(array('funciones_index'));
        $this->_vista->setCss(array('estilos_index'));
        $this->_vista->renderizar('index');
    }
       
 
    public function obtener_ventas_x_producto($datos){
        $datos = $this->_reportes->selecciona_ventas_x_producto($datos);
        $cabeceras = array('IDPRODUCTO', 'FECHA_VENTA','TIPO_COMPROBANTE', 'NRO_DOCUMENTO', 'CLIENTE', 'DOCUMENTO','ABREVIATURA','CANTIDAD','PRECIO_VENTA',
            'SUB_TOTAL', 'CONFIRMACION');
        $datos = $this->get_matriz($datos, $cabeceras);
        return $datos;
    }
    
    public function obtener_productos_vendidos($datos){
        $datos = $this->_reportes->selecciona_productos_vendidos($datos);
        $cabeceras = array('IDPRODUCTO', 'DESCRIPCION');
        $datos = $this->get_matriz($datos, $cabeceras);
        return $datos;
    }
   
    public function obtener_compras_x_producto($datos){
        $datos = $this->_reportes->selecciona_compras_x_producto($datos);
        $cabeceras = array('IDPRODUCTO', 'FECHA_VENTA','NRO_COMPROBANTE', 'PROVEEDOR', 'RUC','ABREVIATURA','CANTIDAD','PRECIO','SUB_TOTAL');
        $datos = $this->get_matriz($datos, $cabeceras);
        return $datos;
    }
    

    
    
    public function ventas_x_producto(){
        $producto=$_POST['idproducto'];
        $fecha_inicio = $_POST['fecha_inicio'];
        $fecha_fin = $_POST['fecha_fin'];
        if($producto=="" || $fecha_inicio=="" || $fecha_fin==""){
            echo "<script>alert('No se puede generar el reporte debido a datos erroneos o faltantes'); window.close();</script>";
            die();
        }
        $Y_table_position = 41;
        /*OBTENER LOS PRODUCTOS*/
        if($producto=='*'){
            $productos = $this->obtener_productos_vendidos(array(0, $fecha_inicio, $fecha_fin));
        } else {
            $productos = $this->obtener_productos_vendidos(array($producto, $fecha_inicio, $fecha_fin));
        }
        $n_productos = count($productos);
        
        /*Objetos Por pagina (opp)*/$opp = 47;
        $contapag = 1;
        $abs = 1;
            for ($x = 0; $x < $n_productos; $x++) {
                $datos = $this->obtener_ventas_x_producto(array($productos[$x]['IDPRODUCTO'], $fecha_inicio, $fecha_fin));
                $datacount = count($datos);
                $contaobj = 0;
                $contador[$contapag] = "";
                $c_fecha_venta[$contapag] = "";
                $c_nro_documento[$contapag] = "";
                $c_cliente[$contapag] = "";
                $c_documento[$contapag] = "";
                $c_abreviatura[$contapag] = "";
                $c_cantidad[$contapag] = "";
                $c_precio_venta[$contapag] = "";
                $c_sub_total[$contapag] = "";
                
                $total_cantidad = 0;
                $total_sub_total = 0;
                /*$horafecha = array(
            
            substr($datos[0]['fecha_venta'],11,2),
            substr($datos[0]['fecha_venta'],14,2),
            substr($datos[0]['fecha_venta'],17,2)
            );*/
                for ($i = 0; $i < $datacount; $i++) {
                    $contador[$contapag] = $contador[$contapag] . substr((($i+1)*$contapag),0,4)."\n";
                    $c_fecha_venta[$contapag] = $c_fecha_venta[$contapag] . substr($datos[0]['FECHA_VENTA'],8,2).'/'.substr($datos[0]['FECHA_VENTA'],5,2).
                            '/'.substr($datos[0]['FECHA_VENTA'],0,4) . "\n";
                    $c_nro_documento[$contapag] = $c_nro_documento[$contapag] .substr($datos[$i]['TIPO_COMPROBANTE'],0,2).'/' . 
                            substr($datos[$i]['NRO_DOCUMENTO'], 0, 8) . "\n";
                    $c_cliente[$contapag] = $c_cliente[$contapag] . substr(utf8_decode($datos[$i]['CLIENTE']), 0, 24) . "\n";
                    $c_documento[$contapag] = $c_documento[$contapag] . substr($datos[$i]['DOCUMENTO'], 0, 11) . "\n";
                    $c_abreviatura[$contapag] = $c_abreviatura[$contapag] . substr($datos[$i]['ABREVIATURA'],0,4) . "\n";
                    $c_cantidad[$contapag] = $c_cantidad[$contapag] . substr(number_format($datos[$i]['CANTIDAD'],3),0,9) . "\n";
                    /*contar total cantidades*/$total_cantidad = $total_cantidad + $datos[$i]['CANTIDAD'];
                    $c_precio_venta[$contapag] = $c_precio_venta[$contapag] . substr(number_format($datos[$i]['PRECIO_VENTA'],3),0,9) . "\n";
                    $c_sub_total[$contapag] = $c_sub_total[$contapag] . substr(number_format($datos[$i]['SUB_TOTAL'],2),0,9) . "\n";
                    /*contar total sub totales*/$total_sub_total = $total_sub_total + $datos[$i]['SUB_TOTAL'];
                    $contaobj = $contaobj + 1;
                    if ($contaobj == $opp) {
                        $contaobj = 0;
                        $contapag = $contapag + 1;
                    }
                }
                if ($contaobj == 0) {
                    $contapag = $contapag - 1;
                }
                for ($i = $abs; $i <= $contapag; $i++) {
                    $this->_fpdf->AddPage();
                    //ENCABEZADO TITULO DE REPORTE
                    $this->_fpdf->SetFont('Arial','B',12);
                    $this->_fpdf->SetY(24);
                    $this->_fpdf->SetX(0);
                    $this->_fpdf->Cell(210,5, utf8_decode('REGISTRO DE VENTAS DETALLADAS POR PRODUCTO'),0,0,'C');
                    $this->_fpdf->SetFillColor(232,232,232);
                    $this->_fpdf->SetFont('Courier','B',9);
                    $this->_fpdf->SetY(35);
                    $this->_fpdf->SetX(5);
                    $this->_fpdf->Cell(10,6,utf8_decode('Nro.'),'BT',0,'L',1);
                    $this->_fpdf->SetX(15);
                    $this->_fpdf->Cell(22,6,utf8_decode('Fec.Emis.'),'BT',0,'C',1);
                    $this->_fpdf->SetX(37);
                    $this->_fpdf->Cell(28,6,utf8_decode('Comprobante'),'BT',0,'L',1);
                    $this->_fpdf->SetX(65);
                    $this->_fpdf->Cell(49,6,utf8_decode('Cliente Ref.'),'BT',0,'L',1);
                    $this->_fpdf->SetX(114);
                    $this->_fpdf->Cell(23,6,utf8_decode('DNI/RUC'),'BT',0,'C',1);
                    $this->_fpdf->SetX(137);
                    $this->_fpdf->Cell(10,6,utf8_decode('U.M.'),'BT',0,'C',1);
                    $this->_fpdf->SetX(147);
                    $this->_fpdf->Cell(20,6,utf8_decode('Cantidad'),'BT',0,'C',1);
                    $this->_fpdf->SetX(167);
                    $this->_fpdf->Cell(20,6,utf8_decode('Precio'),'BT',0,'C',1);
                    $this->_fpdf->SetX(187);
                    $this->_fpdf->Cell(18,6,utf8_decode('SubTotal'),'BT',0,'R',1);
                    //MARGEN TOTAL: HASTA=195 (ULTIMO SETX + ANCHO DE ULTIMO CELL)
                    //UBICACIÓN:
                    $this->_fpdf->SetFont('Courier', '', 11);
                    $this->_fpdf->SetFillColor(255, 255, 255);
                    $this->_fpdf->SetY(29);
                    $this->_fpdf->SetX(15);
                    $this->_fpdf->Cell(30, 5, utf8_decode('Producto :   ' . $productos[$x]['DESCRIPCION'] . '     /   Código:  ' .
                            $productos[$x]['IDPRODUCTO']), '', 0, 'L', 1);
                    $this->_fpdf->SetFont('Courier', '', 9);
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(5);
                    $this->_fpdf->MultiCell(10, 5, $contador[$i], 1);
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(15);
                    $this->_fpdf->MultiCell(22, 5, $c_fecha_venta[$i], 1);
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(37);
                    $this->_fpdf->MultiCell(28, 5, $c_nro_documento[$i], 1);
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(65);
                    $this->_fpdf->MultiCell(49, 5, $c_cliente[$i], 1);
                    /*$this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(164);
                    $this->_fpdf->MultiCell(23, 5, $c_documento[$i], 1, 'C');
                     */
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(114);
                    $this->_fpdf->MultiCell(23, 5, $c_documento[$i], 1, 'C');
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(137);
                    $this->_fpdf->MultiCell(10, 5, $c_abreviatura[$i], 1, 'C');
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(147);
                    $this->_fpdf->MultiCell(20, 5, $c_cantidad[$i], 1, 'R');
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(167);
                    $this->_fpdf->MultiCell(20, 5, $c_precio_venta[$i], 1, 'R');
                    /*(---)*/
                    $this->_fpdf->SetFont('Courier', '', 8);
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(187);
                    $this->_fpdf->MultiCell(18, 5, $c_sub_total[$i], 1, 'R');
                    if($i==$contapag){
                        $this->_fpdf->SetFont('Courier', 'B', 10);
                        $this->_fpdf->SetY((5*$contaobj)+$Y_table_position+2);
                        $this->_fpdf->SetX(105);
                        $this->_fpdf->Cell(18,8,utf8_decode('TOTALES'),'BT',0,'L',1);
                        $this->_fpdf->SetX(123);
                        $this->_fpdf->Cell(44,8,substr(number_format($total_cantidad,3),0,15).' '.$datos[0]['ABREVIATURA'],'BTR',0,'R',1);
                        $this->_fpdf->SetFont('Courier', '', 9);
                        $this->_fpdf->SetX(167);
                        $this->_fpdf->Cell(9,8,utf8_decode('S/.'),'LBT',0,'R',1);
                        $this->_fpdf->SetFont('Courier', 'B', 10);
                        $this->_fpdf->SetX(176);
                        $this->_fpdf->Cell(29,8,substr(number_format($total_sub_total,2),0,13),'BT',0,'R',1);
                    }
                    
                    $abs = $abs + 1;
                }
                $abs = 1;
                $contapag = 1;
            }
        
        $this->_fpdf->Output();
    }
    
    public function compras_x_producto(){
        $producto=$_POST['idproducto'];
        $fecha_inicio = $_POST['fecha_inicio'];
        $fecha_fin = $_POST['fecha_fin'];
        if($producto=="" || $fecha_inicio=="" || $fecha_fin==""){
            echo "<script>alert('No se puede generar el reporte debido a datos erroneos o faltantes'); window.close();</script>";
            die();
        }
        $Y_table_position = 41;
        /*OBTENER LOS PRODUCTOS*/
        if($producto=='*'){
            $productos = $this->obtener_productos_comprados(array(0, $fecha_inicio, $fecha_fin));
        } else {
            $productos = $this->obtener_productos_comprados(array($producto, $fecha_inicio, $fecha_fin));
        }
        $n_productos = count($productos);
        
        /*Objetos Por pagina (opp)*/$opp = 47;
        $contapag = 1;
        $abs = 1;
            for ($x = 0; $x < $n_productos; $x++) {
                $datos = $this->obtener_compras_x_producto(array($productos[$x]['IDPRODUCTO'], $fecha_inicio, $fecha_fin));
                $datacount = count($datos);
                $contaobj = 0;
                $contador[$contapag] = "";
                $c_fecha_venta[$contapag] = "";
                $c_nro_comprobante[$contapag] = "";
                $c_proveedor[$contapag] = "";
                $c_ruc[$contapag] = "";
                $c_abreviatura[$contapag] = "";
                $c_cantidad[$contapag] = "";
                $c_precio[$contapag] = "";
                $c_sub_total[$contapag] = "";
                $c_confirmacion[$contapag] = "";
                
                $total_cantidad = 0;
                $total_sub_total = 0;
                /*$horafecha = array(
            
            substr($datos[0]['fecha_venta'],11,2),
            substr($datos[0]['fecha_venta'],14,2),
            substr($datos[0]['fecha_venta'],17,2)
            );*/
                for ($i = 0; $i < $datacount; $i++) {
                    $contador[$contapag] = $contador[$contapag] . substr((($i+1)*$contapag),0,4)."\n";
                    $c_fecha_venta[$contapag] = $c_fecha_venta[$contapag] . substr($datos[0]['FECHA_VENTA'],8,2).'/'.substr($datos[0]['FECHA_VENTA'],5,2).
                            '/'.substr($datos[0]['FECHA_VENTA'],0,4) . "\n";
                    $c_nro_comprobante[$contapag] = $c_nro_comprobante[$contapag] .'FC/' . substr($datos[$i]['NRO_COMPROBANTE'], 0, 8) . "\n";
                    $c_proveedor[$contapag] = $c_proveedor[$contapag] . substr(utf8_decode($datos[$i]['PROVEEDOR']), 0, 24) . "\n";
                    $c_ruc[$contapag] = $c_ruc[$contapag] . substr($datos[$i]['RUC'], 0, 11) . "\n";
                    $c_abreviatura[$contapag] = $c_abreviatura[$contapag] . substr($datos[$i]['ABREVIATURA'],0,4) . "\n";
                    $c_cantidad[$contapag] = $c_cantidad[$contapag] . substr(number_format($datos[$i]['CANTIDAD'],3),0,9) . "\n";
                    /*contar total cantidades*/$total_cantidad = $total_cantidad + $datos[$i]['CANTIDAD'];
                    $c_precio[$contapag] = $c_precio[$contapag] . substr(number_format($datos[$i]['PRECIO'],3),0,9) . "\n";
                    $c_sub_total[$contapag] = $c_sub_total[$contapag] . substr(number_format($datos[$i]['SUB_TOTAL'],2),0,9) . "\n";
                    $c_confirmacion[$contapag] = $c_confirmacion[$contapag] . $datos[$i]['CONFIRMACION'] . "\n";
                    /*contar total sub totales*/$total_sub_total = $total_sub_total + $datos[$i]['SUB_TOTAL'];
                    $contaobj = $contaobj + 1;
                    if ($contaobj == $opp) {
                        $contaobj = 0;
                        $contapag = $contapag + 1;
                    }
                }
                if ($contaobj == 0) {
                    $contapag = $contapag - 1;
                }
                for ($i = $abs; $i <= $contapag; $i++) {
                    $this->_fpdf->AddPage();
                    //ENCABEZADO TITULO DE REPORTE
                    $this->_fpdf->SetFont('Arial','B',12);
                    $this->_fpdf->SetY(24);
                    $this->_fpdf->SetX(0);
                    $this->_fpdf->Cell(210,5, utf8_decode('REGISTRO DE COMPRAS DETALLADAS POR PRODUCTO'),0,0,'C');
                    $this->_fpdf->SetFillColor(232,232,232);
                    $this->_fpdf->SetFont('Courier','B',9);
                    $this->_fpdf->SetY(35);
                    $this->_fpdf->SetX(5);
                    $this->_fpdf->Cell(10,6,utf8_decode('Nro.'),'BT',0,'L',1);
                    $this->_fpdf->SetX(15);
                    $this->_fpdf->Cell(22,6,utf8_decode('Fec.Fact.'),'BT',0,'C',1);
                    $this->_fpdf->SetX(37);
                    $this->_fpdf->Cell(28,6,utf8_decode('Factura'),'BT',0,'L',1);
                    $this->_fpdf->SetX(65);
                    $this->_fpdf->Cell(49,6,utf8_decode('Cliente Ref.'),'BT',0,'L',1);
                    $this->_fpdf->SetX(114);
                    $this->_fpdf->Cell(23,6,utf8_decode('DNI/RUC'),'BT',0,'C',1);
                    $this->_fpdf->SetX(137);
                    $this->_fpdf->Cell(10,6,utf8_decode('U.M.'),'BT',0,'C',1);
                    $this->_fpdf->SetX(147);
                    $this->_fpdf->Cell(20,6,utf8_decode('Cantidad'),'BT',0,'C',1);
                    $this->_fpdf->SetX(167);
                    $this->_fpdf->Cell(20,6,utf8_decode('Precio'),'BT',0,'C',1);
                    $this->_fpdf->SetX(187);
                    $this->_fpdf->Cell(18,6,utf8_decode('SubTotal'),'BT',0,'R',1);
                    //MARGEN TOTAL: HASTA=195 (ULTIMO SETX + ANCHO DE ULTIMO CELL)
                    //UBICACIÓN:
                    $this->_fpdf->SetFont('Courier', '', 11);
                    $this->_fpdf->SetFillColor(255, 255, 255);
                    $this->_fpdf->SetY(29);
                    $this->_fpdf->SetX(15);
                    $this->_fpdf->Cell(30, 5, utf8_decode('Producto :   ' . $productos[$x]['DESCRIPCION'] . '     /   Código:  ' .
                            $productos[$x]['IDPRODUCTO']), '', 0, 'L', 1);
                    $this->_fpdf->SetFont('Courier', '', 9);
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(5);
                    $this->_fpdf->MultiCell(10, 5, $contador[$i], 1);
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(15);
                    $this->_fpdf->MultiCell(22, 5, $c_fecha_venta[$i], 1);
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(37);
                    $this->_fpdf->MultiCell(28, 5, $c_nro_comprobante[$i], 1);
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(65);
                    $this->_fpdf->MultiCell(49, 5, $c_proveedor[$i], 1);
                    /*$this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(164);
                    $this->_fpdf->MultiCell(23, 5, $c_documento[$i], 1, 'C');
                     */
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(114);
                    $this->_fpdf->MultiCell(23, 5, $c_ruc[$i], 1, 'C');
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(137);
                    $this->_fpdf->MultiCell(10, 5, $c_abreviatura[$i], 1, 'C');
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(147);
                    $this->_fpdf->MultiCell(20, 5, $c_cantidad[$i], 1, 'R');
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(167);
                    $this->_fpdf->MultiCell(20, 5, $c_precio[$i], 1, 'R');
                    /*(---)*/
                    $this->_fpdf->SetFont('Courier', '', 8);
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(187);
                    $this->_fpdf->MultiCell(18, 5, $c_sub_total[$i], 1, 'R');
                    if($i==$contapag){
                        $this->_fpdf->SetFont('Courier', 'B', 10);
                        $this->_fpdf->SetY((5*$contaobj)+$Y_table_position+2);
                        $this->_fpdf->SetX(105);
                        $this->_fpdf->Cell(18,8,utf8_decode('TOTALES'),'BT',0,'L',1);
                        $this->_fpdf->SetX(123);
                        $this->_fpdf->Cell(44,8,substr(number_format($total_cantidad,3),0,15).' '.$datos[0]['ABREVIATURA'],'BTR',0,'R',1);
                        $this->_fpdf->SetFont('Courier', '', 9);
                        $this->_fpdf->SetX(167);
                        $this->_fpdf->Cell(9,8,utf8_decode('S/.'),'LBT',0,'R',1);
                        $this->_fpdf->SetFont('Courier', 'B', 10);
                        $this->_fpdf->SetX(176);
                        $this->_fpdf->Cell(29,8,substr(number_format($total_sub_total,2),0,13),'BT',0,'R',1);
                    }
                    
                    $abs = $abs + 1;
                }
                $abs = 1;
                $contapag = 1;
            }
        
        $this->_fpdf->Output();
    }
    
    public function compras(){
        $fecha_inicio = $_POST['fecha_inicio'];
        $fecha_fin = $_POST['fecha_fin'];
        if( $fecha_inicio=="" || $fecha_fin==""){
            echo "<script>alert('No se puede generar el reporte debido a datos erroneos o faltantes'); window.close();</script>";
            die();
        }
        $datos = $this->obtener_compras_x_intervalo_fechas(array($fecha_inicio, $fecha_fin));
        $datacount = count($datos);
        
        $Y_table_position = 41;
        $opp = 47;
        $contapag = 1;
        $contaobj = 0;

        for ($i = 0; $i < $datacount; $i++) {
            $contador[$contapag] = $contador[$contapag] . substr((($i+1)*$contapag),0,4)."\n";
            $c_fecha_compra[$contapag] = $c_fecha_compra[$contapag] . substr($datos[0]['FECHA_COMPRA'],8,2).'/'.substr($datos[0]['FECHA_COMPRA'],5,2).
                    '/'.substr($datos[0]['FECHA_COMPRA'],0,4) . "\n";
            if($datos[0]['FECHA']){
                $c_fecha_almacen[$contapag] = $c_fecha_almacen[$contapag] . substr($datos[0]['FECHA'],8,2).'/'.substr($datos[0]['FECHA'],5,2).
                     '/'.substr($datos[0]['FECHA'],0,4) . "\n";
            } else {
                $c_fecha_almacen[$contapag] = $c_fecha_almacen[$contapag] . "NO REGISTR" ."\n";
            }
            $c_nro_comprobante[$contapag] = $c_nro_comprobante[$contapag] .'FC/' . substr($datos[$i]['NRO_COMPROBANTE'], 0, 8) . "\n";
            $c_proveedor[$contapag] = $c_proveedor[$contapag] . substr(utf8_decode($datos[$i]['PROVEEDOR']), 0, 24) . "\n";
            $c_ruc[$contapag] = $c_ruc[$contapag] . substr($datos[$i]['ruc'], 0, 11) . "\n";
            $c_importe[$contapag] = $c_importe[$contapag] . substr(number_format($datos[$i]['IMPORTE'],3),0,9) . "\n";
            /*contar total importe*/$total_importe = $total_importe + $datos[$i]['IMPORTE'];
            $c_igv[$contapag] = $c_igv[$contapag] . substr(number_format($datos[$i]['IGV'],3),0,9) . "\n";
            $c_total[$contapag] = $c_total[$contapag] . substr(number_format($datos[$i]['IMPORTE']+$datos[$i]['IGV'],2),0,10) . "\n";
            /*contar total total*/$total_total = $total_total + $c_total[$contapag];
            $contaobj = $contaobj + 1;
            if ($contaobj == $opp) {
                $contaobj = 0;
                $contapag = $contapag + 1;
            }
        }
        if ($contaobj == 0) {
            $contapag = $contapag - 1;
        }
        for ($i = 1; $i <= $contapag; $i++) {
            $this->_fpdf->AddPage();
                    //ENCABEZADO TITULO DE REPORTE
                    $this->_fpdf->SetFont('Arial','B',12);
                    $this->_fpdf->SetY(24);
                    $this->_fpdf->SetX(0);
                    $this->_fpdf->Cell(210,5, utf8_decode('RESUMEN DE COMPRAS DESDE '.$fecha_inicio.' HASTA '.$fecha_fin),0,0,'C');
                    $this->_fpdf->SetFillColor(232,232,232);
                    $this->_fpdf->SetFont('Courier','B',9);
                    $this->_fpdf->SetY(35);
                    $this->_fpdf->SetX(5);
                    $this->_fpdf->Cell(10,6,utf8_decode('Nro.'),'BT',0,'L',1);
                    $this->_fpdf->SetX(15);
                    $this->_fpdf->Cell(19,6,utf8_decode('Fec.Fact.'),'BT',0,'C',1);
                    $this->_fpdf->SetX(34);
                    $this->_fpdf->Cell(19,6,utf8_decode('Fec.Almc.'),'BT',0,'L',1);
                    $this->_fpdf->SetX(53);
                    $this->_fpdf->Cell(24,6,utf8_decode('Comprobante'),'BT',0,'L',1);
                    $this->_fpdf->SetX(77);
                    $this->_fpdf->Cell(49,6,utf8_decode('Cliente Ref.'),'BT',0,'C',1);
                    $this->_fpdf->SetX(126);
                    $this->_fpdf->Cell(21,6,utf8_decode('U.M.'),'BT',0,'C',1);
                    $this->_fpdf->SetX(147);
                    $this->_fpdf->Cell(20,6,utf8_decode('Importe'),'BT',0,'C',1);
                    $this->_fpdf->SetX(167);
                    $this->_fpdf->Cell(20,6,utf8_decode('IGV'),'BT',0,'C',1);
                    $this->_fpdf->SetX(187);
                    $this->_fpdf->Cell(18,6,utf8_decode('Total'),'BT',0,'R',1);
                    //MARGEN TOTAL: HASTA=195 (ULTIMO SETX + ANCHO DE ULTIMO CELL)
                    $this->_fpdf->SetFillColor(255, 255, 255);
                    $this->_fpdf->SetFont('Courier', '', 8);
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(5);
                    $this->_fpdf->MultiCell(10, 5, $contador[$i], 1);
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(15);
                    $this->_fpdf->MultiCell(19, 5, $c_fecha_compra[$i], 1);
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(34);
                    $this->_fpdf->MultiCell(19, 5, $c_fecha_almacen[$i], 1);
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(53);
                    $this->_fpdf->MultiCell(24, 5, $c_nro_comprobante[$i], 1);
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(77);
                    $this->_fpdf->MultiCell(49, 5, $c_proveedor[$i], 1);
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(126);
                    $this->_fpdf->MultiCell(21, 5, $c_ruc[$i], 1, 'C');
                    $this->_fpdf->SetFont('Courier', '', 7);
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(147);
                    $this->_fpdf->MultiCell(20, 5, $c_importe[$i], 1, 'R');
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(167);
                    $this->_fpdf->MultiCell(20, 5, $c_igv[$i], 1, 'R');
                    /*(---)*/
                    $this->_fpdf->SetY($Y_table_position);
                    $this->_fpdf->SetX(187);
                    $this->_fpdf->MultiCell(18, 5, $c_total[$i], 1, 'R');
                    if($i==$contapag){
                        $this->_fpdf->SetFont('Courier', 'B', 10);
                        $this->_fpdf->SetY((5*$contaobj)+$Y_table_position+2);
                        $this->_fpdf->SetX(105);
                        $this->_fpdf->Cell(18,8,utf8_decode('TOTALES'),'BT',0,'L',1);
                        $this->_fpdf->SetX(123);
                        $this->_fpdf->Cell(44,8,substr(number_format($total_importe,3),0,15).' '.$datos[0]['ABREVIATURA'],'BTR',0,'R',1);
                        $this->_fpdf->SetFont('Courier', '', 9);
                        $this->_fpdf->SetX(167);
                        $this->_fpdf->Cell(9,8,utf8_decode('S/.'),'LBT',0,'R',1);
                        $this->_fpdf->SetFont('Courier', 'B', 10);
                        $this->_fpdf->SetX(176);
                        $this->_fpdf->Cell(29,8,substr(number_format($total_total,2),0,13),'BT',0,'R',1);
                    }
        }
        $this->_fpdf->Output();
    }

    public function ticket_boleta_venta($idventa){
        // DATOS QUE DEBE RECIBIR ESTE REPORTE: IDVENTA
        
        $estadias = $this->obtener_habitaciones_detalle_estadia($idventa);
        $itemsestadia = count($estadias);
        
        $igvdescuento = $this->obtener_descuento_venta($idventa);
        
        $idventa = array($idventa);
        //PRIMERO SE OBTIENE LA CANTIDAD DE ITEMS EN EL DETALLE PARA DETERMINAR EL ALTO DE PAGINA DEL TICKET
        $detalle = $this->obtener_datos_detalle_comprobante_venta($idventa);
        $items = count($detalle);
        // EL TAMAÑO INICIAL, ESDECIR, SIN ITEMS REGISTRADOS, ES DE VALOR: $alto=95;
        
        $ancho_celda_datos = 3.8;
        $alto = 92 + ($ancho_celda_datos*($items+$itemsestadia));
        $ancho = 73;
        $espac = 8;
        $this->_fpdf = new FPDF('P', 'mm', array($ancho, $alto));
        $this->_fpdf->SetAutoPageBreak(false);
        $this->_fpdf->AddPage();
        $this->_fpdf->SetFont('Courier', '', 9);
        $this->_fpdf->SetFillColor(255, 255, 255);
        // <editor-fold defaultstate="collapsed" desc="DATOS DE CABECERA DE EMPRESA Y CLIENTE ABAJO ->">
        $datos = $this->obtener_datos_empresa();

        
        $rep_venta = array('', $datos[0]['REP_VENTA_1'], $datos[0]['REP_VENTA_2'],
            $datos[0]['REP_VENTA_3'], $datos[0]['REP_VENTA_4'],
            $datos[0]['REP_VENTA_5'], $datos[0]['REP_VENTA_6'],
            $datos[0]['REP_VENTA_7']);
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho, $ancho_celda_datos, utf8_decode($rep_venta[1]), 0, 0, 'C', 1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho, $ancho_celda_datos, utf8_decode($rep_venta[2]), 0, 0, 'C', 1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho, $ancho_celda_datos, utf8_decode($rep_venta[3]), 0, 0, 'C', 1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho, $ancho_celda_datos, utf8_decode($rep_venta[4]), 0, 0, 'C', 1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho, $ancho_celda_datos, utf8_decode($rep_venta[5]), 0, 0, 'L', 1);
        $espac = $espac + $ancho_celda_datos;


        $datos = $this->obtener_datos_comprobante_venta($idventa);
        $horafecha = array(
            substr($datos[0]['FECHA_VENTA'], 8, 2),
            substr($datos[0]['FECHA_VENTA'], 5, 2),
            substr($datos[0]['FECHA_VENTA'], 0, 4),
            substr($datos[0]['FECHA_VENTA'], 11, 2),
            substr($datos[0]['FECHA_VENTA'], 14, 2),
            substr($datos[0]['FECHA_VENTA'], 17, 2)
        );


        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho, $ancho_celda_datos, utf8_decode('  FECHA:' . $horafecha[0] . '/' . $horafecha[1] . '/' . $horafecha[2] . '    ' .
                        'HORA:' . $horafecha[3] . ':' . $horafecha[4] . ':' . $horafecha[5]), 0, 0, 'L', 1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho, $ancho_celda_datos, utf8_decode('  CLIENTE:           ' . $datos[0]['ABREVIATURA'] . '/' .
                        $datos[0]['NRO_DOCUMENTO']), 0, 0, 'L', 1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho, $ancho_celda_datos, substr(utf8_decode('  ' . $datos[0]['NOMBRES_CLIENTE'] . ' ' .
                                $datos[0]['APELLIDOS_CLIENTE']), 0, 36), 0, 0, 'L', 1);


        $espac = $espac + $ancho_celda_datos + 2;


        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho, 1, utf8_decode('  ----------------------------------'), 0, 0, 'L', 1);
        $espac = $espac + $ancho_celda_datos - 2;
        $this->_fpdf->SetY($espac - 1);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho, $ancho_celda_datos, utf8_decode('  PRODUCTO                   IMPORTE'), 0, 0, 'L', 1);
        $espac = $espac + $ancho_celda_datos - 1;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho, 1, utf8_decode('  ----------------------------------'), 0, 0, 'L', 1);
        $espac = $espac + 1; // </editor-fold>


        $sbtotal = 0;
        for($i=0;$i<$itemsestadia;$i++){
            $this->_fpdf->SetY($espac);
            $this->_fpdf->SetX(0);
            /*RESTAR DIAS*/
                    $datetime1 = new DateTime($estadias[$i]['FECHA_INGRESO']);
                    $datetime2 = new DateTime(date('d-m-Y'));
                    $intervalo = $datetime1->diff($datetime2);
                    $diasocupados = $intervalo->format('%d%');
            
            $this->_fpdf->Cell($ancho,$ancho_celda_datos,substr(utf8_decode('  '.$diasocupados.' DIAS HAB'.' '.$estadias[$i]['HABITACION'].' '.
                    $estadias[$i]['TIPO']),0,25),0,0,'L',1);
            $this->_fpdf->SetY($espac);
            $this->_fpdf->SetX(50);
            $this->_fpdf->Cell(10,$ancho_celda_datos,utf8_decode('S/.'),0,0,'L',1);
            //PARSEAR OBJETO NUMERIC HACIA DOUBLE CON 2 DECIMALES
            $prec = number_format($estadias[$i]['COSTO']*$diasocupados, 2);
            $this->_fpdf->SetY($espac);
            $this->_fpdf->SetX(55);
            $this->_fpdf->Cell(15.5,$ancho_celda_datos,utf8_decode(''.$prec),0,0,'R',1);
            //SUMAR LOS VALORES DEL PRECIO PARA OBTENER EL TOTAL:
            $sbtotal = $sbtotal + $prec;
            
            $espac = $espac + $ancho_celda_datos;
        }
        
        for($i=0;$i<$items;$i++){
            $this->_fpdf->SetY($espac);
            $this->_fpdf->SetX(0);
            if($detalle[$i]['IDPAQUETE']==0){//NO ES UN PAQUETE
                $this->_fpdf->Cell($ancho,$ancho_celda_datos,substr(utf8_decode('  '.$detalle[$i]['CANTIDAD'].$detalle[$i]['ABREVIATURA'].' '.
                        $detalle[$i]['DESCRIPCION']),0,25),0,0,'L',1);
            }
            if($detalle[$i]['IDPRODUCTO']==0){
                $this->_fpdf->Cell($ancho,$ancho_celda_datos,substr(utf8_decode('  '.$detalle[$i]['CANTIDAD'].'PQT'.' '.
                        $detalle[$i]['DESCRIPCION']),0,25),0,0,'L',1);
            }
            $this->_fpdf->SetY($espac);
            $this->_fpdf->SetX(50);
            $this->_fpdf->Cell(10,$ancho_celda_datos,utf8_decode('S/.'),0,0,'L',1);
            //PARSEAR OBJETO NUMERIC HACIA DOUBLE CON 2 DECIMALES
            $prec = number_format($detalle[$i]['PRECIO_VENTA']*$detalle[$i]['CANTIDAD'], 2);
            $this->_fpdf->SetY($espac);
            $this->_fpdf->SetX(55);
            $this->_fpdf->Cell(15.5,$ancho_celda_datos,utf8_decode(''.$prec),0,0,'R',1);
            //SUMAR LOS VALORES DEL PRECIO PARA OBTENER EL TOTAL:
            $sbtotal = $sbtotal + $prec;
            
            $espac = $espac + $ancho_celda_datos;
        }
        
        
        
        if($items==0 && $itemsestadia==0){
            $this->_fpdf->SetY($espac+1.2);
            $this->_fpdf->SetX(0);
            $this->_fpdf->Cell($ancho,1,utf8_decode('  >>NO SE REGISTRARON ITEMS'),0,0,'L',1);
            $espac = $espac + $ancho_celda_datos;
        }
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,1,utf8_decode('  ----------------------------------'),0,0,'L',1);
        $espac = $espac + $ancho_celda_datos;
        
        $espac = $espac - 3;
        //IGV (CERO POR DEFECTO Y SIEMPRE)
        
         $igv = $igvdescuento[0]['IGV'];
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode('          *    V.VENTA  S/.'),0,0,'L',1);
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(55);
        $this->_fpdf->Cell(15.5,$ancho_celda_datos,utf8_decode(''.  number_format($sbtotal, 2)),0,0,'R',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode("          **   IGV(".  number_format($igv*100, 0)."%) S/."),0,0,'L',1);
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(55);
        //CALCULAR TOTAL SUMADO EL IGV:
        
        
        $this->_fpdf->Cell(15.5,$ancho_celda_datos,utf8_decode(''.  number_format(($igvdescuento[0]['IGV']*$sbtotal), 2)),0,0,'R',1);
        $espac = $espac + $ancho_celda_datos;
        $sbtotal = $sbtotal + ($igvdescuento[0]['IGV']*$sbtotal);
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode('          ***  DSCTO.   S/.'),0,0,'L',1);
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(55);
        $this->_fpdf->Cell(15.5,$ancho_celda_datos,utf8_decode(''.  number_format($igvdescuento[0]['DESCUENTO'], 2)),0,0,'R',1);
        $total = $sbtotal - $igvdescuento[0]['DESCUENTO'];
        $espac = $espac + $ancho_celda_datos;
        
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode('          **** TOTAL    S/.'),0,0,'L',1);
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(55);
        $this->_fpdf->Cell(15.5,$ancho_celda_datos,utf8_decode(''.  number_format($total, 2)),0,0,'R',1);
        $espac = $espac + $ancho_celda_datos;
        
        $espac = $espac + $ancho_celda_datos - 3;
        //necesito: vendedor, items, condicion (contado, credito), campo obsrevaciones (si estado = 0: observacion = anulado)
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode(' ITEMS: '.($items+$itemsestadia)),0,0,'L',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,substr(utf8_decode(' VENDEDOR: '.$datos[0]['IDEMPLEADO'].'/'.$datos[0]['NOMBRES_EMPLEADO'].' '.
                $datos[0]['APELLIDOS_EMPLEADO']),0,36),0,0,'L',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        /*DETERMINAR EL TIPO DE TRANSACCION*/
        if($datos[0]['IDTIPO_TRANSACCION']==1){
            $datos[0]['IDTIPO_TRANSACCION']='CONTADO';
        } else{
            if($datos[0]['ESTADO_PAGO']==0){
                $datos[0]['IDTIPO_TRANSACCION']='CREDITO, * SIN PAGAR *';
            } else{
                $datos[0]['IDTIPO_TRANSACCION']='CREDITO, * CANCELADO *';
            }
            
        }
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,substr(utf8_decode(' CONDICION: '.$datos[0]['IDTIPO_TRANSACCION']),0,36),0,0,'L',1);
        $espac = $espac + $ancho_celda_datos;
        /*DETERMINAR LA OBSERVACION O SI ESTUVIERA VENTA ANULADA*/
        if($datos[0]['ESTADO']==0){
            $this->_fpdf->SetY($espac);
            $this->_fpdf->SetX(0);
            $this->_fpdf->Cell($ancho,$ancho_celda_datos,substr(utf8_decode('*** ANULADO ***'),0,36),0,0,'L',1);
            $espac = $espac + $ancho_celda_datos;
        }
        
        $espac = $espac + 3;
        
        //PIE DE PÁGINA
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode($rep_venta[6]),0,0,'C',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode($rep_venta[7]),0,0,'C',1);
        $espac = $espac + $ancho_celda_datos;
        
        $this->_fpdf->Output();
    }
    
    public function ticket_factura_venta($idventa){
        $estadias = $this->obtener_habitaciones_detalle_estadia($idventa);
        $itemsestadia = count($estadias);
        
        $igvdescuento = $this->obtener_descuento_venta($idventa);
        // DATOS QUE DEBE RECIBIR ESTE REPORTE: IDVENTA 
        $idventa = array($idventa);
        
        //PRIMERO SE OBTIENE LA CANTIDAD DE ITEMS EN EL DETALLE PARA DETERMINAR EL ALTO DE PAGINA DEL TICKET
        $detalle = $this->obtener_datos_detalle_comprobante_venta($idventa);
        $items = count($detalle);
        // EL TAMAÑO INICIAL, ESDECIR, SIN ITEMS REGISTRADOS, ES DE VALOR: $alto=112;
        
        $ancho_celda_datos = 3.8;
        $alto = 112 + ($ancho_celda_datos*($items+$itemsestadia));
        $ancho = 73;
        $espac = 8;
        $this->_fpdf = new FPDF('P', 'mm', array($ancho, $alto));
        $this->_fpdf->SetAutoPageBreak(false);
        $this->_fpdf->AddPage();
        $this->_fpdf->SetFont('Courier', '', 9);
        $this->_fpdf->SetFillColor(255, 255, 255);
        $datos = $this->obtener_datos_empresa();
        $rep_venta = array('',$datos[0]['REP_VENTA_1'], $datos[0]['REP_VENTA_2'],
            $datos[0]['REP_VENTA_3'],$datos[0]['REP_VENTA_4'],
            $datos[0]['REP_VENTA_5'],$datos[0]['REP_VENTA_6'],
            $datos[0]['REP_VENTA_7']);
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode($rep_venta[1]),0,0,'C',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode($rep_venta[2]),0,0,'C',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode($rep_venta[3]),0,0,'C',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode($rep_venta[4]),0,0,'C',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode($rep_venta[5]),0,0,'L',1);
        $espac = $espac + $ancho_celda_datos;
        
        $datos = $this->obtener_datos_comprobante_venta($idventa);
        $horafecha = array(
            substr($datos[0]['FECHA_VENTA'],8,2),
            substr($datos[0]['FECHA_VENTA'],5,2),
            substr($datos[0]['FECHA_VENTA'],0,4),
            substr($datos[0]['FECHA_VENTA'],11,2),
            substr($datos[0]['FECHA_VENTA'],14,2),
            substr($datos[0]['FECHA_VENTA'],17,2)
            );
        
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode('  FECHA:'.$horafecha[0].'/'.$horafecha[1].'/'.$horafecha[2].'    '.'HORA:'.
                $horafecha[3].':'.$horafecha[4].':'.$horafecha[5]),0,0,'L',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode('*** TICKET FACTURA ***'),0,0,'C',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        //$this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode('  CLIENTE:           '.$datos[0]['abreviatura'].'/'.$datos[0]['serie'].'-'.$datos[0]['nro_documento']),0,0,'L',1);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode($datos[0]['ABREVIATURA'].'/'.$datos[0]['NRO_DOCUMENTO']),0,0,'C',1);
        $espac = $espac + $ancho_celda_datos + 2;
        
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,1,utf8_decode('  ----------------------------------'),0,0,'L',1);
        $espac = $espac + $ancho_celda_datos-2;
        $this->_fpdf->SetY($espac-1);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode('  PRODUCTO                   IMPORTE'),0,0,'L',1);
        $espac = $espac + $ancho_celda_datos-1;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,1,utf8_decode('  ----------------------------------'),0,0,'L',1);
        $espac = $espac  + 1;
        
        $sbtotal = 0;
        for($i=0;$i<$itemsestadia;$i++){
            $this->_fpdf->SetY($espac);
            $this->_fpdf->SetX(0);
            /*RESTAR DIAS*/
                    $datetime1 = new DateTime($estadias[$i]['FECHA_INGRESO']);
                    $datetime2 = new DateTime(date('d-m-Y'));
                    $intervalo = $datetime1->diff($datetime2);
                    $diasocupados = $intervalo->format('%d%');
            
            $this->_fpdf->Cell($ancho,$ancho_celda_datos,substr(utf8_decode('  '.$diasocupados.' DIAS HAB'.' '.$estadias[$i]['HABITACION'].' '.
                    $estadias[$i]['TIPO']),0,25),0,0,'L',1);
            $this->_fpdf->SetY($espac);
            $this->_fpdf->SetX(50);
            $this->_fpdf->Cell(10,$ancho_celda_datos,utf8_decode('S/.'),0,0,'L',1);
            //PARSEAR OBJETO NUMERIC HACIA DOUBLE CON 2 DECIMALES
            $prec = number_format($estadias[$i]['COSTO']*$diasocupados, 2);
            $this->_fpdf->SetY($espac);
            $this->_fpdf->SetX(55);
            $this->_fpdf->Cell(15.5,$ancho_celda_datos,utf8_decode(''.$prec),0,0,'R',1);
            //SUMAR LOS VALORES DEL PRECIO PARA OBTENER EL TOTAL:
            $sbtotal = $sbtotal + $prec;
            
            $espac = $espac + $ancho_celda_datos;
        }
        
        for($i=0;$i<$items;$i++){
            $this->_fpdf->SetY($espac);
            $this->_fpdf->SetX(0);
            if($detalle[$i]['IDPAQUETE']==0){//NO ES UN PAQUETE
                $this->_fpdf->Cell($ancho,$ancho_celda_datos,substr(utf8_decode('  '.$detalle[$i]['CANTIDAD'].$detalle[$i]['ABREVIATURA'].' '.
                        $detalle[$i]['DESCRIPCION']),0,25),0,0,'L',1);
            }
            if($detalle[$i]['IDPRODUCTO']==0){
                $this->_fpdf->Cell($ancho,$ancho_celda_datos,substr(utf8_decode('  '.$detalle[$i]['CANTIDAD'].'PQT'.' '.
                        $detalle[$i]['DESCRIPCION']),0,25),0,0,'L',1);
            }
            $this->_fpdf->SetY($espac);
            $this->_fpdf->SetX(50);
            $this->_fpdf->Cell(10,$ancho_celda_datos,utf8_decode('S/.'),0,0,'L',1);
            //PARSEAR OBJETO NUMERIC HACIA DOUBLE CON 2 DECIMALES
            $prec = number_format($detalle[$i]['PRECIO_VENTA']*$detalle[$i]['CANTIDAD'], 2);
            $this->_fpdf->SetY($espac);
            $this->_fpdf->SetX(55);
            $this->_fpdf->Cell(15.5,$ancho_celda_datos,utf8_decode(''.$prec),0,0,'R',1);
            //SUMAR LOS VALORES DEL PRECIO PARA OBTENER EL TOTAL:
            $sbtotal = $sbtotal + $prec;
            
            $espac = $espac + $ancho_celda_datos;
        }
        
        if($items==0 && $itemsestadia==0){
            $this->_fpdf->SetY($espac+1.2);
            $this->_fpdf->SetX(0);
            $this->_fpdf->Cell($ancho,1,utf8_decode('  >>NO SE REGISTRARON ITEMS'),0,0,'L',1);
            $espac = $espac + $ancho_celda_datos;
        }
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,1,utf8_decode('  ----------------------------------'),0,0,'L',1);
        $espac = $espac + $ancho_celda_datos;
        
        $espac = $espac - 3;
        //IGV (CERO POR DEFECTO Y SIEMPRE)
        $igv = $igvdescuento[0]['IGV'];
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode('          *    V.VENTA  S/.'),0,0,'L',1);
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(55);
        $this->_fpdf->Cell(15.5,$ancho_celda_datos,utf8_decode(''.  number_format($sbtotal, 2)),0,0,'R',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode("          **   IGV(".  number_format($igv*100, 0)."%) S/."),0,0,'L',1);
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(55);
        //CALCULAR TOTAL SUMADO EL IGV:
        
        
        $this->_fpdf->Cell(15.5,$ancho_celda_datos,utf8_decode(''.  number_format(($igvdescuento[0]['IGV']*$sbtotal), 2)),0,0,'R',1);
        $espac = $espac + $ancho_celda_datos;
        $sbtotal = $sbtotal + ($igvdescuento[0]['IGV']*$sbtotal);
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode('          ***  DSCTO.   S/.'),0,0,'L',1);
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(55);
        $this->_fpdf->Cell(15.5,$ancho_celda_datos,utf8_decode(''.  number_format($igvdescuento[0]['DESCUENTO'], 2)),0,0,'R',1);
        $total = $sbtotal - $igvdescuento[0]['DESCUENTO'];
        $espac = $espac + $ancho_celda_datos;
        
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode('          **** TOTAL    S/.'),0,0,'L',1);
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(55);
        $this->_fpdf->Cell(15.5,$ancho_celda_datos,utf8_decode(''.  number_format($total, 2)),0,0,'R',1);
        $espac = $espac + $ancho_celda_datos;
        
        $espac = $espac + $ancho_celda_datos - 3;
        //necesito: vendedor, items, condicion (contado, credito), campo obsrevaciones (si estado = 0: observacion = anulado)
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode(' ITEMS: '.($items+$itemsestadia)),0,0,'L',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,substr(utf8_decode(' RAZON SOCIAL: '),0,36),0,0,'L',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,substr(utf8_decode(' '.$datos[0]['NOMBRES_CLIENTE']),0,36),0,0,'L',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,substr(utf8_decode(' DIRECCION: '),0,36),0,0,'L',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,substr(utf8_decode(' '.$datos[0]['DIRECCION_CLIENTE']),0,36),0,0,'L',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,substr(utf8_decode(' RUC: '.$datos[0]['DOCUMENTO']),0,36),0,0,'L',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,substr(utf8_decode(' VENDEDOR: '.$datos[0]['IDEMPLEADO'].'/'.$datos[0]['NOMBRES_EMPLEADO'].' '.
                $datos[0]['APELLIDOS_EMPLEADO']),0,36),0,0,'L',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        /*DETERMINAR EL TIPO DE TRANSACCION*/
        if($datos[0]['IDTIPO_TRANSACCION']==1){
            $datos[0]['IDTIPO_TRANSACCION']='CONTADO';
        } else{
            if($datos[0]['ESTADO_PAGO']==0){
                $datos[0]['IDTIPO_TRANSACCION']='CREDITO, * SIN PAGAR *';
            } else{
                $datos[0]['IDTIPO_TRANSACCION']='CREDITO, * CANCELADO *';
            }
            
        }
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,substr(utf8_decode(' CONDICION: '.$datos[0]['IDTIPO_TRANSACCION']),0,36),0,0,'L',1);
        $espac = $espac + $ancho_celda_datos;
        /*DETERMINAR LA OBSERVACION O SI ESTUVIERA VENTA ANULADA*/
        if($datos[0]['ESTADO'] == 0){
            $this->_fpdf->SetY($espac);
            $this->_fpdf->SetX(0);
            $this->_fpdf->Cell($ancho,$ancho_celda_datos,substr(utf8_decode('*** ANULADO ***'),0,36),0,0,'C',1);
            $espac = $espac + $ancho_celda_datos;
        }
        
        $espac = $espac + 3;
        
        //PIE DE PÁGINA
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode($rep_venta[6]),0,0,'C',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_fpdf->SetY($espac);
        $this->_fpdf->SetX(0);
        $this->_fpdf->Cell($ancho,$ancho_celda_datos,utf8_decode($rep_venta[7]),0,0,'C',1);
        $espac = $espac + $ancho_celda_datos;
        
        $this->_fpdf->Output();
    }
    
    public function detalle_estadia($idventa){
        // DATOS QUE DEBE RECIBIR ESTE REPORTE: IDVENTA 
        $datos = $this->obtener_detalle_estadia_x_huesped($idventa);
        $datacount = count($datos);
        
        $idventa = array($idventa);
        //PRIMERO SE OBTIENE LA CANTIDAD DE ITEMS EN EL DETALLE PARA DETERMINAR EL ALTO DE PAGINA DEL TICKET
        //$detalle = $this->obtener_datos_detalle_comprobante_venta($idventa);
        //$items = count($detalle);
        // EL TAMAÑO INICIAL, ESDECIR, SIN ITEMS REGISTRADOS, ES DE VALOR: $alto=112;
        
        $ancho_celda_datos = 5;
        $alto = 122;
        $ancho = 182;
        $espac = 8;
        $this->_fpdf = new FPDF('L', 'mm', array($ancho, $alto));
        $this->_fpdf->SetAutoPageBreak(false);
        
        for($i = 0; $i<$datacount;$i++){
            $this->_fpdf->AddPage();

            //$this->_fpdf->Image(ROOT . 'vista' . DS . 'reportes' . DS . 'img' . DS . '7.png', 0, 0, 182, 120, 'PNG');
            $this->_fpdf->SetFillColor(255, 255, 255);

            $this->_fpdf->SetY(0);
            $this->_fpdf->SetX(0);
            $this->_fpdf->Cell(182, 120,"", 0, 0, "", 1);


            $this->_fpdf->Image(ROOT . 'vista' . DS . 'reportes' . DS . 'img' . DS . 'log.png', 5, 5, 47.008, 11.196, 'PNG');

            $this->_fpdf->SetFont('Arial', '', 7);
            //LLEGADA ARRIVAL
            $this->_fpdf->SetY(18);
            $this->_fpdf->SetX(56);
            $this->_fpdf->MultiCell(9,$ancho_celda_datos/2,"Fecha\nDate",'0',0,'L',0);
            $this->_fpdf->SetY(18);
            $this->_fpdf->SetX(93);
            $this->_fpdf->MultiCell(17,$ancho_celda_datos/2,"Procedencia\nComing From",'0',0,'L',0);
            $this->_fpdf->SetY(18);
            $this->_fpdf->SetX(141.5);
            $this->_fpdf->MultiCell(18,$ancho_celda_datos/2,"Hora llegada\nTime Arrival",'0',0,'L',0);
            //TITULOS
            $this->_fpdf->SetFont('Arial', 'B', 13);
            $this->_fpdf->SetY(5.5);
            $this->_fpdf->SetX(100);
            $this->_fpdf->Cell(36,$ancho_celda_datos,  utf8_decode("INGRESO"),'0',0,'C',0);
            $this->_fpdf->SetFont('Arial', 'BU', 9);
            $this->_fpdf->SetY(13);
            $this->_fpdf->SetX(100);
            $this->_fpdf->Cell(36,$ancho_celda_datos,  utf8_decode("LLEGADA / ARRIVAL"),'0',0,'C',0);
            $this->_fpdf->SetY(24.5);
            $this->_fpdf->SetX(100);
            $this->_fpdf->Cell(36,$ancho_celda_datos,  utf8_decode("SALIDA / DEPARTURE"),'0',0,'C',0);
            $this->_fpdf->SetY(35.6);
            $this->_fpdf->SetX(71.3);
            $this->_fpdf->Cell(36,$ancho_celda_datos,  utf8_decode("HOSPEDAJE / LODGING"),'0',0,'C',0);

            //SALIDA DEPARTURE
            $this->_fpdf->SetFont('Arial', '', 7);

            $this->_fpdf->SetY(29.3);
            $this->_fpdf->SetX(56);
            $this->_fpdf->MultiCell(9,$ancho_celda_datos/2,"Fecha\nDate",'0',0,'L',0);
            $this->_fpdf->SetY(29.3);
            $this->_fpdf->SetX(93);
            $this->_fpdf->MultiCell(17,$ancho_celda_datos/2,"Destino\nDestination",'0',0,'L',0);
            $this->_fpdf->SetY(29.3);
            $this->_fpdf->SetX(139.5);
            $this->_fpdf->MultiCell(20,$ancho_celda_datos/2,"Hora partida\nTime Departure",'0',0,'L',0);
            //HOSPEDAJE LODGING
            $this->_fpdf->SetY(40.6);
            $this->_fpdf->SetX(37);
            $this->_fpdf->MultiCell(18,$ancho_celda_datos/2, utf8_decode('Habitación(es)')."\n".utf8_decode('Room(s)'),'0',0,'L',0);
            $this->_fpdf->SetY(40.6);
            $this->_fpdf->SetX(88.8);
            $this->_fpdf->MultiCell(18,$ancho_celda_datos/2, "Tarifa\nTariff",'0',0,'L',0);
            $this->_fpdf->SetY(48);
            $this->_fpdf->SetX(0);
            $this->_fpdf->Cell($ancho,$ancho_celda_datos/2, "--------------------------------------------------------------------------------------------".
                    "--------------------------------------------------------------------------------------------------------------------",'0',0,'C',0);
            //DATOS
            $this->_fpdf->SetY(51.6);
            $this->_fpdf->SetX(2);
            $this->_fpdf->MultiCell(14,$ancho_celda_datos/2, "Nombre\nName",'0',0,'L',0);
            $this->_fpdf->SetY(51.6);
            $this->_fpdf->SetX(104);
            $this->_fpdf->MultiCell(14,$ancho_celda_datos/2, "Edad\nAge",'0',0,'L',0);
            $this->_fpdf->SetY(51.6);
            $this->_fpdf->SetX(134);
            $this->_fpdf->MultiCell(17,$ancho_celda_datos/2, "FechaNacim.\nDateOfBirth",'0',0,'L',0);
            $this->_fpdf->SetY(60.2);
            $this->_fpdf->SetX(2);
            $this->_fpdf->MultiCell(14,$ancho_celda_datos/2, "Domicilio\nAddress",'0',0,'L',0);
            $this->_fpdf->SetY(60.2);
            $this->_fpdf->SetX(109.4);
            $this->_fpdf->MultiCell(14,$ancho_celda_datos/2, utf8_decode("Teléfonos")."\n".("Phones"),'0',0,'L',0);
            $this->_fpdf->SetY(70.4);
            $this->_fpdf->SetX(1.9);
            $this->_fpdf->MultiCell(23,$ancho_celda_datos/2, utf8_decode("Correo Electrónico")."\n".utf8_decode("e-mail"),'0',0,'L',0);
            $this->_fpdf->SetY(80.5);
            $this->_fpdf->SetX(1);
            $this->_fpdf->MultiCell(15,$ancho_celda_datos/2, utf8_decode("Profesión")."\n".utf8_decode("Ocupación"),'0',0,'L',0);
            $this->_fpdf->SetY(80.5);
            $this->_fpdf->SetX(56);
            $this->_fpdf->MultiCell(20,$ancho_celda_datos/2, utf8_decode("Estado Civil")."\n".utf8_decode("Marital Status"),'0',0,'L',0);
            $this->_fpdf->SetFont('Arial', '', 6);
            $this->_fpdf->SetY(80.5);
            $this->_fpdf->SetX(95);
            $this->_fpdf->MultiCell(17,$ancho_celda_datos/2, utf8_decode("Nacionalidad")."\n".utf8_decode("Nacionality"),'0',0,'L',0);
            $this->_fpdf->SetY(80.5);
            $this->_fpdf->SetX(132);
            $this->_fpdf->MultiCell(18,$ancho_celda_datos/2, utf8_decode("Doc.Identidad")."\n".utf8_decode("Id.Card"),'0',0,'L',0);
            $this->_fpdf->SetFont('Arial', '', 7);
            $this->_fpdf->SetY(87);
            $this->_fpdf->SetX(0);
            $this->_fpdf->Cell($ancho,$ancho_celda_datos/2, "--------------------------------------------------------------------------------------------".
                    "--------------------------------------------------------------------------------------------------------------------",'0',0,'C',0);
            $this->_fpdf->SetY(98);
            $this->_fpdf->SetX(0);
            $this->_fpdf->Cell($ancho,$ancho_celda_datos/2, "--------------------------------------------------------------------------------------------".
                    "--------------------------------------------------------------------------------------------------------------------",'0',0,'C',0);
            $this->_fpdf->SetY(101);
            $this->_fpdf->SetX(0);
            $this->_fpdf->MultiCell($ancho,$ancho_celda_datos/2, utf8_decode("PARA SU CONVENIENCIA Y PROTECCIÓN, FAVOR DEPOSITAR SUS VALORES EN LAS CAJAS DE SEGURIDAD UBICADAS EN RECEPCIÓN")."\n". 
            utf8_decode("EL ALBERGUE NO SE RESPONSABILIZA POR PÉRDIDAS EN LAS HABITACIONES U OTRAS DEPENDENCIAS")."\n"."\n".
            utf8_decode("FOR YOUR CONVENIENCE AND PROTECTION, PLEASE DEPOSIT YOUR VALUES IN THE LOCATED BOXES OF SECURITY IN RECEPTION")."\n".
                    utf8_decode("THE HOTEL DOESN'T TAKE THE RESPONSABILITY HAD LOST IN THE ROOMS OR OTHER DEPENDENCES"),0,'C',0);
            $this->_fpdf->SetFont('Arial', '', 7);
            $this->_fpdf->SetY(114.5);
            $this->_fpdf->SetX(0);
            $this->_fpdf->MultiCell($ancho,$ancho_celda_datos/2, utf8_decode("Este documento constituye el contrado de hospedaje reglamentado por D.S. 006 73 IC/DS de 29-3-73")."\n".
                    utf8_decode("This document constitutes the Contract of Lodging regulation for D.S 006 79 IC/DS de 29-3-73"),0,'C',0);

            $this->_fpdf->SetFont('Arial', '', 9);
            
            //LLEGADA ARRIVAL
            $horafecha = array(
                substr($datos[$i]['FECHA_INGRESO'], 8, 2),
                substr($datos[$i]['FECHA_INGRESO'], 5, 2),
                substr($datos[$i]['FECHA_INGRESO'], 0, 4),
                substr($datos[$i]['FECHA_INGRESO'], 11, 2),
                substr($datos[$i]['FECHA_INGRESO'], 14, 2),
                substr($datos[$i]['FECHA_INGRESO'], 17, 2)
            );
            $this->_fpdf->SetY(18.2);
            $this->_fpdf->SetX(65);
            $this->_fpdf->Cell(18,$ancho_celda_datos,utf8_decode($horafecha[0] . '/' . $horafecha[1] . '/' . $horafecha[2]),'1',0,'C',0);
            $this->_fpdf->SetY(18.2);
            $this->_fpdf->SetX(110.1);
            $this->_fpdf->Cell(22,$ancho_celda_datos, substr(utf8_decode($datos[$i]['PROCEDENCIA']),0,12),'1',0,'C',0);
            $this->_fpdf->SetY(18.2);
            $this->_fpdf->SetX(159.6);
            $this->_fpdf->Cell(18,$ancho_celda_datos,utf8_decode($horafecha[3] . ':' . $horafecha[4]),'1',0,'C',0);
            //SALIDA DEPARTURE
            $horafecha = array(
                substr($datos[$i]['FECHA_SALIDA'], 8, 2),
                substr($datos[$i]['FECHA_SALIDA'], 5, 2),
                substr($datos[$i]['FECHA_SALIDA'], 0, 4),
                substr($datos[$i]['FECHA_SALIDA'], 11, 2),
                substr($datos[$i]['FECHA_SALIDA'], 14, 2),
                substr($datos[$i]['FECHA_SALIDA'], 17, 2)
            );
            $this->_fpdf->SetY(29.5);
            $this->_fpdf->SetX(65);
            $this->_fpdf->Cell(18,$ancho_celda_datos,utf8_decode($horafecha[0] . '/' . $horafecha[1] . '/' . $horafecha[2]),'1',0,'C',0);
            $this->_fpdf->SetY(29.5);
            $this->_fpdf->SetX(110.1);
            $this->_fpdf->Cell(22,$ancho_celda_datos, substr(utf8_decode($datos[$i]['DESTINO']),0,12),'1',0,'C',0);
            $this->_fpdf->SetY(29.5);
            $this->_fpdf->SetX(159.6);
            $this->_fpdf->Cell(18,$ancho_celda_datos,utf8_decode($horafecha[3] . ':' . $horafecha[4]),'1',0,'C',0);
            //HOSPEDAJE LODGING
            $this->_fpdf->SetY(40.8);
            $this->_fpdf->SetX(54.8);
            $this->_fpdf->Cell(41,$ancho_celda_datos,utf8_decode($datos[$i]['NRO_HABITACION']),'1',0,'C',0);
            $this->_fpdf->SetY(40.8);
            $this->_fpdf->SetX(106.8);
            $this->_fpdf->Cell(41,$ancho_celda_datos, substr(utf8_decode(number_format($datos[$i]['COSTO'], 2)),0,27),'1',0,'C',0);
            //DATOS
            $this->_fpdf->SetY(51.6);
            $this->_fpdf->SetX(16.1);
            $this->_fpdf->Cell(90,$ancho_celda_datos,substr(utf8_decode($datos[$i]['NOMBRES_APELLIDOS']),0,60),'1',0,'L',0);
            $horafecha = array(
                substr($datos[$i]['FECHA_NACIMIENTO'], 8, 2),
                substr($datos[$i]['FECHA_NACIMIENTO'], 5, 2),
                substr($datos[$i]['FECHA_NACIMIENTO'], 0, 4),
                substr($datos[$i]['FECHA_NACIMIENTO'], 11, 2),
                substr($datos[$i]['FECHA_NACIMIENTO'], 14, 2),
                substr($datos[$i]['FECHA_NACIMIENTO'], 17, 2)
            );
            $datetime2 = date('Y');
            $this->_fpdf->SetY(51.6);
            $this->_fpdf->SetX(118);
            $this->_fpdf->Cell(14.4,$ancho_celda_datos,substr(utf8_decode($datetime2 - $horafecha[2]),0,60),'1',0,'C',0);
            $this->_fpdf->SetY(51.6);
            $this->_fpdf->SetX(151);
            $this->_fpdf->Cell(24.3,$ancho_celda_datos,substr(utf8_decode($horafecha[0] . '/' . $horafecha[1] . '/' . $horafecha[2]),0,60),'1',0,'C',0);
            $this->_fpdf->SetY(60.2);
            $this->_fpdf->SetX(16.1);
            $this->_fpdf->Cell(90,$ancho_celda_datos, substr(utf8_decode($datos[$i]['DIRECCION']),0,60),'1',0,'L',0);
            $this->_fpdf->SetY(60.2);
            $this->_fpdf->SetX(123.4);
            $this->_fpdf->Cell(51.9,$ancho_celda_datos, substr(utf8_decode($datos[$i]['TELEFONO']),0,60),'1',0,'L',0);
            $this->_fpdf->SetY(70.4);
            $this->_fpdf->SetX(24.9);
            $this->_fpdf->Cell(150.4,$ancho_celda_datos, substr(utf8_decode($datos[$i]['EMAIL']),0,75),'1',0,'L',0);
            $this->_fpdf->SetY(80.5);
            $this->_fpdf->SetX(16.1);
            $this->_fpdf->Cell(43,$ancho_celda_datos, substr(utf8_decode($datos[$i]['XPROFESION']),0,25),'1',0,'L',0);
            $this->_fpdf->SetY(80.5);
            $this->_fpdf->SetX(76);
            $this->_fpdf->Cell(21,$ancho_celda_datos, substr(utf8_decode($datos[$i]['ESTADO_CIVIL']),0,14),'1',0,'L',0);
            $this->_fpdf->SetY(80.5);
            $this->_fpdf->SetX(111.4);
            $this->_fpdf->Cell(22,$ancho_celda_datos, substr(utf8_decode($datos[$i]['XPAIS']),0,10),'1',0,'L',0);
            $this->_fpdf->SetY(80.5);
            $this->_fpdf->SetX(150.3);
            $this->_fpdf->Cell(25,$ancho_celda_datos, substr(utf8_decode($datos[$i]['DOCUMENTO']),0,11),'1',0,'C',0);

            $this->_fpdf->SetFont('Arial', '', 7);        
            $this->_fpdf->SetY(95);
            $this->_fpdf->SetX(0);
            $this->_fpdf->Cell($ancho,$ancho_celda_datos, substr(utf8_decode('FIRMA'),0,11),'0',0,'C',0);
            $this->_fpdf->SetY(19);
            $this->_fpdf->SetX(0);
            $this->_fpdf->MultiCell(60,$ancho_celda_datos-2.4,utf8_decode('Psje. Abelardo Ramírez 263')."\n".
                    utf8_decode('La Banda de Shilcayo - San Martín')."\n".utf8_decode('e-mail: lajungla_convenciones@hotmail.com')."\n".
                    utf8_decode('fb.com/lajungla.tarapoto'),0,'C',0);
            $this->_fpdf->SetFont('Arial', '', 6);        
            $this->_fpdf->SetY(31);
            $this->_fpdf->SetX(0);
            $this->_fpdf->MultiCell(60,$ancho_celda_datos-2.4,utf8_decode('Cómodas habitaciones con agua caliente,')."\n".
                    utf8_decode('circuito cerrado, frigobar, bebidas exóticas, piscina, restaurante, sauna, telefono y fax.'),0,'C',0);

        
        
        
        }
        $this->_fpdf->Output();
        
    }
}

?>
