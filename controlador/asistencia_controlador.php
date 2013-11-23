<?php

class asistencia_controlador extends controller{

    private $_asistencia;
    private $_alumnomatriculados;
    private $_cursos;
    private $_horario;
    public $datosx; 
    public function __construct() {
        if (!$this->acceso()) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
       $this->_asistencia = $this->cargar_modelo('asistencia');
       $this->_alumnomatriculados = $this->cargar_modelo('alumnomatriculados'); 
       $this->_cursos = $this->cargar_modelo('cursos'); 
       $this->_horario= $this->cargar_modelo('horario'); 
    }

    public function index() {
        
        $this->_vista->setJs(array('funcion'));
        $this->_vista->setJs_Foot(array('scriptgrilla'));
        $this->_vista->renderizar('index');
    }
   
    public function buscador(){

        $buscar=$_POST['cadena'];
        $data=$this->_cursos->getQuery("SELECT *
                from alumno WHERE estado='1' AND (nombre like '%$buscar%' or apellido_paterno like '%$buscar%')");
       // $data=$dat->fetchall();  
        echo json_encode($data);
    }
    
       public function buscardatos(){
           
       $this->_asistencia->turno=$_POST['horario'];
 
        echo json_encode($this->_asistencia->selecciona());
       
       }
    

    public function nuevo() {
        //$this->_asistencia->idcurso=$_POST['codigo_curso'];
        //$datos= $this->_alumnomatriculados->selecciona();
        $this->_vista->setJs(array('funcion'));
        $horario=$_POST['codigo_horario'];
        
        //$datosasistencis= $this->_asistencia->selecciona();
    
        if ($_POST['guardar'] == 1) {
            $this->_asistencia->elimina();
           // die(var_dump($_POST['codigo_matricula']));
            for($i=0;$i<count($_POST['codigo_matricula']);$i++){ 
               $this->_asistencia->idmatricula=    $_POST['codigo_matricula'][$i];     
               $this->_asistencia->idhorario = $horario;    
               $this->_asistencia->fecha =         date("Y-m-d"); 
               
               
              if(isset ($_POST['justificacion'][$i])){
                $this->_asistencia->justificacion=  $_POST['justificacion'][$i];
              }else{
                $this->_asistencia->justificacion=  null;
              }
            
               $this->_asistencia->inserta();
               
            }
            $this->redireccionar('asistencia');
                
         }
       
        
        $this->_vista->datos_alumnomatriculados = $this->_alumnomatriculados->selecciona();
       // $this->_vista->datos_cursos = $this->_cursos->selecciona();
        $this->_vista->datos_horario = $this->_horario->selecciona(); 
        $this->_vista->titulo = 'Registrar Asistencia';
        $this->_vista->action = BASE_URL . 'asistencia/nuevo';
        $this->_vista->setJs(array('funciones_form','jquery-ui.min'));
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
    public function ver(){
        $this->_alumno->idalumno=$_POST['idalumno'];
        echo json_encode($this->_alumno->selecciona());
    }
    
    
    
}

?>








