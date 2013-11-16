<?php

class asistencia_controlador extends controller{

    private $_horario;

    public function __construct() {
        if (!$this->acceso()) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
       $this->_horario = $this->cargar_modelo('horario');
    }

    public function index() {
        $this->_vista->datos = $this->_horario->selecciona();
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
            $this->_horario->turno = $_POST['turno'];
            $this->_horario->dia = $_POST['dia'];
            $this->_horario->hora_inicio = $_POST['hora_inicio'];
            $this->_horario->hora_fin = $_POST['hora_fin'];
            $this->_horario->inserta();
            $this->redireccionar('horario');
        }
        
        $this->_vista->titulo = 'Registrar Horario';
        $this->_vista->action = BASE_URL . 'horario/nuevo';
        $this->_vista->setJs(array('funciones_form'));
        $this->_vista->renderizar('form');
    }

    public function editar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('horario');
        }

        $this->_horario->idhorario= $this->filtrarInt($id);
        $this->_vista->datos = $this->_horario->selecciona();

         if ($_POST['guardar'] == 1) {
            $this->_horario->idhorario = $_POST['codigo'];
            $this->_horario->turno = $_POST['turno'];
            $this->_horario->dia = $_POST['dia'];
            $this->_horario->hora_inicio = $_POST['hora_inicio'];
            $this->_horario->hora_fin = $_POST['hora_fin'];
            $this->_horario->actualiza();
            $this->redireccionar('horario');
         }
        $this->_vista->titulo = 'Actualizar Modulo';
        $this->_vista->setJs(array('funciones_form'));
        $this->_vista->renderizar('form');
    }

    public function eliminar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('horario');
        }
        $this->_horario->idhorario = $this->filtrarInt($id);
        $this->_horario->elimina();
       
        $this->redireccionar('horario');
    }
   
}

?>
