<?php

class apoderado_controlador extends controller{

    private $_apoderado;

    public function __construct() {
        if (!$this->acceso()) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
       $this->_apoderado = $this->cargar_modelo('apoderado');
    }

    public function index() {
        $this->_vista->datos = $this->_apoderado->selecciona();
        $this->_vista->setJs(array('funcion'));
        $this->_vista->setJs_Foot(array('scriptgrilla'));
        $this->_vista->renderizar('index');
    }
   
    public function buscador(){
        if($_POST['filtro']==0){
            $this->_horario->descripcion=$_POST['cadena'];
            $this->_horario->modulo_padre='';
        }else{
            $this->_horario->descripcion='';
            $this->_horario->modulo_padre=$_POST['cadena'];
        }
        
        echo json_encode($this->_modulos->selecciona());
    }

    public function nuevo() {
        if ($_POST['guardar'] == 1) {
            $this->_apoderado->nombre = $_POST['nombre'];
            $this->_apoderado->apellido_paterno = $_POST['apellido_paterno'];
            $this->_apoderado->apellido_materno = $_POST['apellido_materno'];
            $this->_apoderado->direccion = $_POST['direccion'];
            $this->_apoderado->ocupacion = $_POST['ocupacion'];
            $this->_apoderado->fecha_nacimiento = $_POST['fecha_nacimiento'];
            $this->_apoderado->dni = $_POST['dni'];
            $this->_apoderado->inserta();
            $this->redireccionar('apoderado');
        }
        
        $this->_vista->titulo = 'Registrar Apoderado';
        $this->_vista->action = BASE_URL . 'apoderado/nuevo';
        $this->_vista->setJs(array('funciones_form','jquery-ui.min'));
        $this->_vista->renderizar('form');
    }

    public function editar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('apoderado');
        }

        $this->_apoderado->idapoderado= $this->filtrarInt($id);
        $this->_vista->datos = $this->_apoderado->selecciona();

         if ($_POST['guardar'] == 1) {
            $this->_apoderado->idapoderado = $_POST['codigo'];
            $this->_apoderado->nombre = $_POST['nombre'];
            $this->_apoderado->apellido_paterno = $_POST['apellido_paterno'];
            $this->_apoderado->apellido_materno = $_POST['apellido_materno'];
            $this->_apoderado->direccion = $_POST['direccion'];
            $this->_apoderado->ocupacion = $_POST['ocupacion'];
            $this->_apoderado->fecha_nacimiento = $_POST['fecha_nacimiento'];
            $this->_apoderado->dni = $_POST['dni'];
            $this->_apoderado->actualiza();
            $this->redireccionar('apoderado');
         }
        $this->_vista->titulo = 'Actualizar Apoderado.';
        $this->_vista->setJs(array('funciones_form','jquery-ui.min'));
        $this->_vista->renderizar('form');
    }

    public function eliminar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('apoderado');
        }
        $this->_apoderado->idapoderado = $this->filtrarInt($id);
        $this->_apoderado->elimina();
       
        $this->redireccionar('apoderado');
    }
   
}

?>

