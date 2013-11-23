<?php

class reportes_controlador extends controller {

    private $_reportes;
    private $_cursos;
    private $_horario;
    private $_matricula;
    private $_fpdf;

    public function __construct() {
        if (!$this->acceso(47)) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
        $this->get_Libreria('fpdf' . DS . 'fpdf');
        $this->_fpdf = new FPDF('P','mm','A4');
        $this->_reportes = $this->cargar_modelo('reportes');
        $this->_cursos = $this->cargar_modelo('cursos');
        $this->_horario = $this->cargar_modelo('horario');
        $this->_matricula= $this->cargar_modelo('matricula');
    }
    
    
    
    public function index() {
        $this->_vista->datos_cursos=$this->_cursos->selecciona();
        $this->_vista->datos_horario=$this->_horario->selecciona();
        $this->_vista->setJs(array('funciones_index'));
        $this->_vista->setCss(array('estilos_index'));
        $this->_vista->renderizar('index');
    }
       
    
    /* public function cursos_x_alumnos($datos){/// OBTENEMOS DE LA BD
        $datos = $this->_reportes->selecciona_cursos_x_alumnos($datos);
        $cabeceras = array('NOMBRE', 'MATRICULA_ID');
        $datos = $this->get_matriz($datos, $cabeceras);
        return $datos;
    }*/
    
 ///////////////////////REPORTE CURSO X ALUMNO 
    public function cursos_x_alumnos($id_curso){
       
        $Y_table_position = 46;

         $opp = 47;
         $contapag = 1;
         $contaobj = 0;
                 
         $id_curso=     $_POST['cursos_id'];
         if($id_curso==""){
            echo "<script>alert('No se puede generar el reporte debido a datos erroneos o faltantes'); window.close();</script>";
            die();
        }  
         $cursos=       $this->_reportes->selecciona_cursos($id_curso);
         $alumnos=      $this->_reportes->selecciona_cursos_x_alumnos($id_curso);
          //$totalalumnos=  $this->_reportes->selecciona_total_alumnos($id_curso);
          
            for ($i = 0; $i <3; $i++) {
            $c_codigo[$contapag] = $c_codigo[$contapag] . $alumnos[$i]['MATRICULA_ID'] . "\n";
            $c_nombre[$contapag] = $c_nombre[$contapag] . $alumnos[$i]['NOMBRE'] . "\n";
            
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
            //ENCABEZADO DE REGISTRO
            $this->_fpdf->SetFont('Arial', 'B', 15);
            $this->_fpdf->SetY(25);
            $this->_fpdf->SetX(0);
            $this->_fpdf->Cell(210, 5, utf8_decode('REGISTRO DE ALUMNOS'), 0, 0, 'C');
            
            $this->_fpdf->SetFont('Arial', 'B', 10);
            $this->_fpdf->SetY(34);
            $this->_fpdf->SetX(0);
            $this->_fpdf->Cell(87, 5, utf8_decode('Curso :   ' . $cursos[0]['NOMBRE_CURSO']), 0, 0, 'C');
            
            $this->_fpdf->SetFillColor(232, 232, 232);
            $this->_fpdf->SetFont('Courier', 'B', 15);
            $this->_fpdf->SetY(40);
            $this->_fpdf->SetX(15);
            $this->_fpdf->Cell(25, 6, utf8_decode('Código'), 'BT', 0, 'L', 1);
            $this->_fpdf->SetX(40);
            $this->_fpdf->Cell(105, 6, utf8_decode('Nombres'), 'BT', 0, 'L', 1);

            //DATOS DE TABLA
            $this->_fpdf->SetFont('Courier', '', 12);
            $this->_fpdf->SetY($Y_table_position);
            $this->_fpdf->SetX(15);
            $this->_fpdf->MultiCell(25, 5, $c_codigo[$i], 1);
            $this->_fpdf->SetY($Y_table_position);
            $this->_fpdf->SetX(40);
            $this->_fpdf->MultiCell(105, 5, $c_nombre[$i], 1);
        }
        $this->_fpdf->Output(); 
        
        
           
    }
    
    
    
  
     public function turno_x_asistencia($id_curso){
       
        $Y_table_position = 46;

         $opp = 47;
         $contapag = 1;
         $contaobj = 0;
                 
         $id_curso=     $_POST['horario_id'];
          if($id_curso==""){
            echo "<script>alert('No se puede generar el reporte debido a datos erroneos o faltantes'); window.close();</script>";
            die();
        }
        
         $turno=       $this->_reportes->selecciona_horario($id_curso);
         $alumnos=      $this->_reportes->selecciona_turno_x_asistencia($id_curso);

            for ($i = 0; $i <  count($alumnos); $i++) {
            $c_codigo[$contapag] = $c_codigo[$contapag] . $alumnos[$i]['ALUMNO_ID'] . "\n";
            $c_nombre[$contapag] = $c_nombre[$contapag] . $alumnos[$i]['NOMBRE'] . "\n";
            $c_asistencia[$contapag] = $c_asistencia[$contapag] . $alumnos[$i]['JUSTIFICACION'] . "\n";
            
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
            //ENCABEZADO DE REGISTRO
            $this->_fpdf->SetFont('Arial', 'B', 15);
            $this->_fpdf->SetY(25);
            $this->_fpdf->SetX(0);
            $this->_fpdf->Cell(210, 5, utf8_decode('REGISTRO DE ASISTENCIA'), 0, 0, 'C');
            
            $this->_fpdf->SetFont('Arial', 'B', 10);
            $this->_fpdf->SetY(34);
            $this->_fpdf->SetX(0);
            $this->_fpdf->Cell(87, 5, utf8_decode('turno :   ' . $turno[0]['TURNO']), 0, 0, 'C');
            
            $this->_fpdf->SetFillColor(232, 232, 232);
            $this->_fpdf->SetFont('Courier', 'B', 15);
            $this->_fpdf->SetY(40);
            $this->_fpdf->SetX(15);
            $this->_fpdf->Cell(25, 6, utf8_decode('Código'), 'BT', 0, 'L', 1);
            $this->_fpdf->SetX(40);
            $this->_fpdf->Cell(105, 6, utf8_decode('Nombres'), 'BT', 0, 'L', 1);
            //DATOS DE TABLA
            $this->_fpdf->SetFont('Courier', '', 12);
            $this->_fpdf->SetY($Y_table_position);
            $this->_fpdf->SetX(15);
            $this->_fpdf->MultiCell(25, 5, $c_codigo[$i], 1);
            $this->_fpdf->SetY($Y_table_position);
            $this->_fpdf->SetX(40);
            $this->_fpdf->MultiCell(105, 5, $c_nombre[$i], 1);
        }
        $this->_fpdf->Output(); 
        
        
           
    }
    
     public function ticket_pago($idmatricula){
        $this->_matricula->idmatricula = $idmatricula;
        $venta = $this->_matricula->re_tiket();
        
        $ancho_celda_datos = 3.8;
        $alto = 80 + ($ancho_celda_datos);
        $ancho = 73;
        $espac = 1;
        $this->_pdf = new FPDF('P', 'mm', array($ancho, $alto));
        $this->_pdf->SetAutoPageBreak(false);
        $this->_pdf->AddPage();
        $this->_pdf->SetFont('Courier', '', 9);
        $this->_pdf->SetFillColor(255, 255, 255);
        $this->_pdf->SetY($espac);
        $this->_pdf->SetX(0);
        $this->_pdf->Cell($ancho,$ancho_celda_datos,utf8_decode(''),0,0,'C',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_pdf->SetY($espac);
        $this->_pdf->SetX(0);
        $this->_pdf->Cell($ancho,$ancho_celda_datos,utf8_decode('*** ACADEMIA AULA ABIERTA ***'),0,0,'C',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_pdf->SetY($espac);
        $this->_pdf->SetX(0);
        $this->_pdf->Cell($ancho,$ancho_celda_datos,utf8_decode('jr: Gregorio Delgado 443'),0,0,'C',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_pdf->SetY($espac);
        $this->_pdf->SetX(0);
        $this->_pdf->Cell($ancho,$ancho_celda_datos,utf8_decode('RPM:#988418909- #990872650'),0,0,'C',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_pdf->SetY($espac);
        $this->_pdf->SetX(0);
        $this->_pdf->Cell($ancho,$ancho_celda_datos,utf8_decode('R.U.C. 10123453456 S/N:FF9F014776'),0,0,'C',1);
        $espac = $espac + $ancho_celda_datos;
        
        $this->_matricula->idmatricula = $idmatricula;
        $datos = $this->_matricula->re_tiket();
        $horafecha = array(
            substr(date("Y-m-d H:i:s"),8,2),
            substr(date("Y-m-d H:i:s"),5,2),
            substr(date("Y-m-d H:i:s"),0,4),
            substr(date("Y-m-d H:i:s"),11,2),
            substr(date("Y-m-d H:i:s"),14,2),
            substr(date("Y-m-d H:i:s"),17,2)
            );
        
        $this->_pdf->SetY($espac);
        $this->_pdf->SetX(0);
        $this->_pdf->Cell($ancho,$ancho_celda_datos,utf8_decode('  FECHA:'.$horafecha[0].'/'.$horafecha[1].'/'.$horafecha[2].'    '.'HORA:'.
                $horafecha[3].':'.$horafecha[4].':'.$horafecha[5]),0,0,'L',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_pdf->SetY($espac);
        $this->_pdf->SetX(0);
        $this->_pdf->Cell($ancho, $ancho_celda_datos, utf8_decode('  CLIENTE:           ' .$datos[0]['NRODOC']), 0, 0, 'L', 1);
        $espac = $espac + $ancho_celda_datos;
        $this->_pdf->SetY($espac);
        $this->_pdf->SetX(0);
        $this->_pdf->Cell($ancho, $ancho_celda_datos, substr(utf8_decode('  ' . $datos[0]['NOMBRE']), 0, 36), 0, 0, 'L', 1);

      
        $espac = $espac + $ancho_celda_datos + 2;
        $this->_pdf->SetY($espac);
        $this->_pdf->SetX(0);
        $this->_pdf->Cell($ancho,1,utf8_decode('  ----------------------------------'),0,0,'L',1);
        $espac = $espac  + 1;
        for($i=0; $i<count($datos); $i++){
        $this->_pdf->SetY($espac);
        $this->_pdf->SetX(55);
        $this->_pdf->Cell(15.5,$ancho_celda_datos,utf8_decode($datos[$i]['NOMBRE_CURSO']),0,0,'R',1);
        $espac = $espac + $ancho_celda_datos;
       }
     
        $this->_pdf->SetY($espac);
        $this->_pdf->SetX(5);
        $this->_pdf->Cell($ancho,$ancho_celda_datos,substr(utf8_decode('MONTO TOTAL'),0,25),0,0,'L',1);
        $this->_pdf->SetY($espac);
        $this->_pdf->SetX(50);
        $this->_pdf->Cell(10,$ancho_celda_datos,utf8_decode('S/.'),0,0,'L',1);
        //PARSEAR OBJETO NUMERIC HACIA DOUBLE CON 2 DECIMALES
        $prec = number_format(($datos[0]['TOTAL']), 2);
        $this->_pdf->SetY($espac);
        $this->_pdf->SetX(55);
        $this->_pdf->Cell(15.5,$ancho_celda_datos,utf8_decode(''.$prec),0,0,'R',1);

        $espac = $espac + $ancho_celda_datos;
        $this->_pdf->SetY($espac);
        $this->_pdf->SetX(0);
        $this->_pdf->Cell($ancho,1,utf8_decode('  ----------------------------------'),0,0,'L',1);
        $this->_pdf->SetY($espac);
        $this->_pdf->SetX(0);
        $espac = $espac + $ancho_celda_datos;
        $this->_pdf->SetY($espac);
        $this->_pdf->SetX(0);
        $this->_pdf->Cell($ancho,$ancho_celda_datos,substr(utf8_decode(' ADMINISTRADOR: '.$venta[0]['EMPLEADO']),0,36),0,0,'C',1);
        $this->_pdf->SetY($espac);
        $this->_pdf->SetX(0);
        $espac = $espac + $ancho_celda_datos;
        
        $espac = $espac + 1;
        
        //PIE DE PÁGINA
        $this->_pdf->SetY($espac);
        $this->_pdf->SetX(0);
        $this->_pdf->Cell($ancho,$ancho_celda_datos,utf8_decode('ACADEMIA AULA ABIERTA'),0,0,'C',1);
        $espac = $espac + $ancho_celda_datos;
        $this->_pdf->SetY($espac);
        $this->_pdf->SetX(0);
        $this->_pdf->Cell($ancho,$ancho_celda_datos,utf8_decode('AL SERVCIO DEL PUEBLO'),0,0,'C',1);
        $espac = $espac + $ancho_celda_datos;
        
        $this->_pdf->Output();
    }
    

    
    
   
   
}

?>
