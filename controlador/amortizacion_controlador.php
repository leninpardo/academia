<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of amortizacion_controlador
 *
 * @author lenin
 */
class amortizacion_controlador extends controller {
    //put your code here
       private $amortizar;
    public function __construct() {
        if (!$this->acceso()) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
        $this->amortizar=$this->cargar_modelo("amortizacion");

    }

      public function index() {
       $this->_vista->datos =$this->amortizar->getQuery("SELECT cr.cronograma_pago_id,concat(a.nombre,' ',a.apellido_paterno,' ',a.apellido_materno) as nombres,a.sexo,cr.fecha,cr.monto
from matricula m INNER JOIN alumno a on(a.Alumno_ID=m.Alumno_ID)
INNER JOIN cronograma_pago cr on(cr.Matricula_ID=m.Matricula_ID) where cr.estado=1");
        $this->_vista->setJs(array('funcion'));
        $this->_vista->setJs_Foot(array('scriptgrilla'));
        $this->_vista->renderizar('index');
    }
      public function buscador(){

        $buscar=$_POST['cadena'];
        $data=$this->amortizar->getQuery("SELECT cr.cronograma_pago_id,concat(a.nombre,' ',a.apellido_paterno,' ',a.apellido_materno) as nombres,a.sexo,cr.fecha,cr.monto
from matricula m INNER JOIN alumno a on(a.Alumno_ID=m.Alumno_ID)
INNER JOIN cronograma_pago cr on(cr.Matricula_ID=m.Matricula_ID)
WHERE  cr.estado=1 and (nombre LIKE '%$buscar%' or apellido_paterno LIKE '%$buscar%' or apellido_materno like '%$buscar%' or sexo LIKE '%$buscar%' or fecha LIKE '%$buscar%' or monto LIKE '%$buscar%')");
        echo json_encode($data);
    }
     public function editar($id) {

         if ($_POST['guardar'] == 1)
             {
             
              $fecha=$_POST['fecha'];
              $monto=$_POST['monto'];
              $r=$this->amortizar->get_consulta("usp_cronograma",array(1,$fecha,$monto,$id));
             
               if ($r[1] == '') {
                  $stmt = $r[0];
             $data=$stmt->fetchall();
               $e=$data[0][0];
               $this->redireccionar('amortizacion');
               }
               else{
                   die ($r[1]);
               }
             }
           $this->_vista->data=$this->amortizar->getQuery("select * from cronograma_pago where cronograma_pago_id=$id");

        $this->_vista->titulo = 'Editar Cronograma de pagos';
        $this->_vista->action = BASE_URL . 'amortizacion/editar/'.$id;
        $this->_vista->setJs(array('funciones_form','jquery-ui.min'));
        $this->_vista->renderizar('form');
     }
       public function eliminar($id) {
               
              $r=$this->amortizar->get_consulta("usp_cronograma",array(2,'2013-12-02',0,$id));
            
               if ($r[1] == '') {
                  $stmt = $r[0];
             $data=$stmt->fetchall();
               $e=$data[0][0];
               $this->redireccionar('amortizacion');
               }
               else{
                   die ($r[1]);
               }
       }
          public function amortizar($id) {

              $r=$this->amortizar->get_consulta("usp_amortizacion",array(session::get("idempleado"),$id));

               if ($r[1] == '') {
                  $stmt = $r[0];
             $data=$stmt->fetchall();
               $e=$data[0][0];
               $this->redireccionar('amortizacion');
               }
               else{
                   die ($r[1]);
               }
       }

    
}
?>
