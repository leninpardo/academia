
<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of matricula_controller
 *
 * @author lenin
 */
class contabilidad_controlador extends controller {
    //put your code here
    
    private $_conta;
    public function __construct() {
        if (!$this->acceso()) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
        $this->_conta=$this->cargar_modelo("contabilidad");

    }

      public function index() {
       
     
       $this->_vista->datos =$this->_conta->getQuery("SELECT *from planilla_movimiento");
        $this->_vista->setJs(array('funcion'));
        $this->_vista->setJs_Foot(array('scriptgrilla'));
        //$this->_vista->setJs(array('funciones_form','jquery-ui.min'));
        $this->_vista->renderizar('index');
    }

        public function buscador(){

        $buscar=$_POST['cadena'];
        $data=$this->_conta->getQuery("select *from planilla_movimiento where Planilla_movimiento_ID like '%$buscar%' or descripcion like '%$buscar%' ");
        echo json_encode($data);
    }
    public  function libro()
    {
        
        
         $this->_vista->renderizar('generate');
        
    }
   

}

?>