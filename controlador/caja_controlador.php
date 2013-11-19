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
       $this->_vista->datos =$this->_caja->getQuery("SELECT c.caja_ID,CONCAT(e.nombre,' ',e.apellido) as nombres,c.fecha, c.monto,c.estado
from caja c INNER JOIN empleado e on(c.id_empleado=e.id_empleado)");
        $this->_vista->setJs(array('funcion'));
        $this->_vista->setJs_Foot(array('scriptgrilla'));
        $this->_vista->renderizar('index');
    }
      public function buscador(){

        $buscar=$_POST['cadena'];
        $data=$this->_caja->getQuery(" SELECT c.caja_ID,CONCAT(e.nombre,' ',e.apellido) as nombres,c.fecha, c.monto,c.estado
from caja c INNER JOIN empleado e on(c.id_empleado=e.id_empleado)
WHERE caja_ID LIKE '%$buscar%' or (nombre LIKE '%$buscar%' or apellido like '% %$buscar%') or fecha LIKE '%$buscar%' or  monto LIKE '%$buscar%'");
        echo json_encode($data);
    }
    public  function cerrar()
    {
      $idc=$_POST['caja'];
        $datos = array(2,$idc,0);
        $r = $this->_caja->get_consulta("usp_caja", $datos);
            $stmt = $r[0][0];
             $data=$stmt->fetchall();
            /* if($data[0][0]==1)
                 {
                 $this->redireccionar("caja");
                 }
                 else {
                     echo json_encode("error");
                 }*/
             //$this->redireccionar("caja");

        //echo json_encode();
    }
   public  function aperturar(){

     $datos = array(1,0,session::get("idempleado"));
        $r = $this->_caja->get_consulta("usp_caja", $datos);
            $stmt = $r[0][0];
             $data=$stmt->fetchall();
    }
}
?>
