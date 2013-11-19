<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of caja_controlador
 *
 * @author lenin
 */
class caja_controlador extends controller {
    //put your code here
    
    private $_caja;
    public function __construct() {
        if (!$this->acceso()) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
        $this->_caja=$this->cargar_modelo("caja");

    }

      public function index() {
       $this->_vista->datos =$this->_caja->getQuery("SELECT c.caja_ID,CONCAT(e.nombre,' ',e.apellido) as nombres,c.fecha, c.monto,c.estado,CURDATE() from caja c INNER JOIN empleado e on(c.id_empleado=e.id_empleado) order by c.caja_id desc");
        $this->_vista->setJs(array('funcion'));
        $this->_vista->setJs_Foot(array('scriptgrilla'));
        //$this->_vista->setJs(array('funciones_form','jquery-ui.min'));
        $this->_vista->renderizar('index');
    }
      public function buscador(){

        $buscar=$_POST['cadena'];
        $data=$this->_caja->getQuery(" SELECT c.caja_ID,CONCAT(e.nombre,' ',e.apellido) as nombres,c.fecha, c.monto,c.estado,CURDATE()
from caja c INNER JOIN empleado e on(c.id_empleado=e.id_empleado)
WHERE caja_ID LIKE '%$buscar%' or (nombre LIKE '%$buscar%' or apellido like '% %$buscar%') or fecha LIKE '%$buscar%' or  monto LIKE '%$buscar%' order by c.caja_id desc");
        echo json_encode($data);
    }
    public  function cerrar()
    {
      $idc=$_POST['caja'];
        $datos = array(2,$idc,0);
        $r = $this->_caja->get_consulta("usp_caja", $datos);
            $stmt = $r[0];
             $data=$stmt->fetchall();
        

        echo json_encode($data[0][0]);
    }
        public  function reaperturar()
    {
      $idc=$_POST['caja'];
        $datos = array(3,$idc,0);
        $r = $this->_caja->get_consulta("usp_caja", $datos);
            $stmt = $r[0];
             $data=$stmt->fetchall();
             echo json_encode($data[0][0]);
           
    }
 public  function aperturar(){

     $datos = array(1,0,session::get("idempleado"));
      $r = $this->_caja->get_consulta("usp_caja", $datos);
      $stmt = $r[0];
      $data=$stmt->fetchall();
      echo json_encode($data[0][0]);
 }
  
}
?>
