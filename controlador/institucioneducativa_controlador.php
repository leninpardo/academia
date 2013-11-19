<?php

class institucioneducativa_controlador extends controller {

    private $_institucioneducativa;

    public function __construct() {
        if (!$this->acceso()) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
        $this->_institucioneducativa = $this->cargar_modelo('institucioneducativa');
    }

    public function index() {
        $this->_vista->datos = $this->_institucioneducativa->selecciona();
        $this->_vista->setJs(array('funcion'));
        $this->_vista->setJs_Foot(array('scriptgrilla'));
        $this->_vista->renderizar('index');
    }
    
   public function buscador(){

        $buscar=$_POST['cadena'];
        $data=$this->_institucioneducativa->getQuery("SELECT *
                from institucioneducativa WHERE estado='1' AND (nombre like '%$buscar%' or Institucioneducativa_ID like '%$buscar%')");
       // $data=$dat->fetchall();  
        echo json_encode($data);
    }
    
    public function nuevo() {
        if ($_POST['guardar'] == 1) {
            $this->_institucioneducativa->nombre = $_POST['nombre'];
            $this->_institucioneducativa->curricula = $_POST['curricula'];
            $this->_institucioneducativa->telefono_fijo = $_POST['telefono_fijo'];
            $this->_institucioneducativa->direccion = $_POST['direccion'];
            $this->_institucioneducativa->inserta();
            $this->redireccionar('institucioneducativa');
        }
        $this->_vista->titulo = 'Registrar Institucion Educativa';
        $this->_vista->action = BASE_URL . 'institucioneducativa/nuevo';
        $this->_vista->setJs(array('funciones_form'));
        $this->_vista->renderizar('form');
    }

    public function editar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('institucioneducativa');
        }

        $this->_institucioneducativa->idinstitucioneducativa = $this->filtrarInt($id);
        $this->_vista->datos = $this->_institucioneducativa->selecciona();

        if ($_POST['guardar'] == 1) {
            $this->_institucioneducativa->idinstitucioneducativa = $_POST['codigo'];
            $this->_institucioneducativa->nombre = $_POST['nombre'];
            $this->_institucioneducativa->curricula = $_POST['curricula'];
            $this->_institucioneducativa->telefono_fijo = $_POST['telefono_fijo'];
            $this->_institucioneducativa->direccion = $_POST['direccion'];
            $this->_institucioneducativa->actualiza();
            $this->redireccionar('institucioneducativa');
        }
        $this->_vista->titulo = 'Actualizar Institucion Educativa';
        $this->_vista->setJs(array('funciones_form'));
        $this->_vista->renderizar('form');
    }

    public function eliminar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('institucioneducativa');
        }
        $this->_institucioneducativa->idinstitucioneducativa = $this->filtrarInt($id);
        $this->_institucioneducativa->elimina();
        $this->redireccionar('institucioneducativa');
    }

}

?>

