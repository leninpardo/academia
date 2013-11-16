<?php

class cursos_controlador extends controller{

    private $_cursos;

    public function __construct() {
        if (!$this->acceso()) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
      $this->_cursos = $this->cargar_modelo('cursos');
    }

    public function index() {
        $this->_vista->datos = $this->_cursos->selecciona();
        $this->_vista->setJs(array('funcion'));
        $this->_vista->setJs_Foot(array('scriptgrilla'));
        $this->_vista->renderizar('index');
    }
   
    public function buscador(){
        if($_POST['filtro']==0){
            $this->_cursos->descripcion=$_POST['cadena'];
            $this->_cursos->modulo_padre='';
        }else{
            $this->_cursos->descripcion='';
            $this->_cursos->modulo_padre=$_POST['cadena'];
        }
        
        echo json_encode($this->_modulos->selecciona());
    }

    public function nuevo() {
        if ($_POST['guardar'] == 1) {
            $this->_cursos->nombre_cursos = $_POST['nombre_curso'];
            $this->_cursos->inserta();
            $this->redireccionar('cursos');
        }
        
        $this->_vista->titulo = 'Registrar Cursos';
        $this->_vista->action = BASE_URL . 'cursos/nuevo';
        $this->_vista->setJs(array('funciones_form'));
        $this->_vista->renderizar('form');
    }

    public function editar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('cursos');
        }

        $this->_cursos->idcursos= $this->filtrarInt($id);
        $this->_vista->datos = $this->_cursos->selecciona();

         if ($_POST['guardar'] == 1) {
            $this->_cursos->idcursos = $_POST['codigo'];
            $this->_cursos->nombre_cursos = $_POST['nombre_curso'];
            $this->_cursos->actualiza();
            $this->redireccionar('cursos');
         }
        $this->_vista->titulo = 'Actualizar Cursos';
        $this->_vista->setJs(array('funciones_form'));
        $this->_vista->renderizar('form');
    }

    public function eliminar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('cursos');
        }
        $this->_cursos->idcursos = $this->filtrarInt($id);
        $this->_cursos->elimina();
       
        $this->redireccionar('cursos');
    }
   
}

?>
