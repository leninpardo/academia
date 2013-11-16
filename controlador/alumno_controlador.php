<?php

class alumno_controlador extends controller{

    private $_alumno;
    private $_regiones;
    private $_provincias;
    private $_ubigeos;
    private $_institucioneducativa;
    
    public function __construct() {
        if (!$this->acceso()) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
        // declaramos aqi cargar_modelo PARA EL CONTROLDOR  COMPleto
        $this->_alumno=  $this->cargar_modelo('alumno');
        $this->_regiones = $this->cargar_modelo('regiones'); //
        $this->_provincias = $this->cargar_modelo('provincias');//
        $this->_ubigeos = $this->cargar_modelo('ubigeos');
        $this->_institucioneducativa = $this->cargar_modelo('institucioneducativa');
    }

    public function index() {
        $this->_vista->datos = $this->_alumno->selecciona();
        $this->_vista->setJs(array('funcion'));
        $this->_vista->setJs_Foot(array('scriptgrilla'));
        $this->_vista->renderizar('index');
    }
    
    public function buscador(){
        if($_POST['filtro']==0){
            $this->_alumno->nombresrs=$_POST['cadena'];
        }
        if($_POST['filtro']==1){
            $this->_cliente->dniruc=$_POST['cadena'];
        }
        if($_POST['filtro']==2){
            $this->_cliente->dniyruc=$_POST['cadena'];
        }
        echo json_encode($this->_cliente->selecciona());
    }

    public function nuevo() {
        $fecha = '';
        /*
        if ($_POST['guardar'] == 1) {
            $this->_alumno->nombre = $_POST['nombre'];
            if(isset ($_POST['apellido_paterno'])){
                $this->_alumno->apellido_paterno = $_POST['apellido_paterno'];
            }else{
                $this->_alumno->apellido_paterno = null;
            }
              if(isset ($_POST['apellido_materno'])){
                $this->_alumno->apellido_materno = $_POST['apellido_materno'];
            }else{
                $this->_alumno->apellido_materno = null;
            }
            $this->_alumno->dni=$_POST['dni'];
            
             if(isset ($_POST['sexo'])){
                $this->_alumno->sexo = $_POST['sexo'];
            }else{
                $this->_alumno->sexo = 1;
            }
            $this->_alumno->telefono_movil=$_POST['telefono_movil'];
             $this->_alumno->email= $_POST['email'];
            
            if(isset ($_POST['fecha_nacimiento']) && $_POST['fecha_nacimiento']!=""){
                $fecha = substr($_POST['fecha_nacimiento'], 6, 4) . '-';
                $fecha .= substr($_POST['fecha_nacimiento'], 3, 2) . '-';
                $fecha .= substr($_POST['fecha_nacimiento'], 0, 2);
                $this->_alumno->fecha_nacimiento = $fecha;
            }else{
                $this->_alumno->fecha_nacimiento = '1990-01-01';
            }
            $this->_alumno->grado = $_POST['grado'];
      
            if(isset ($_POST['ubigeo']) && $_POST['ubigeo']!=""){
                $this->_alumno->idubigeo = $_POST['ubigeo'];
            }else{
                $this->_alumno->idubigeo = 0;
            }
             if(isset ($_POST['institucion'])){
                $this->_alumno->idinstitucioneducativa = $_POST['institucion'];
            }else{
                $this->_alumno->idinstitucioneducativa = 6;
            }
          
            $this->_alumno->inserta();
            $this->redireccionar('alumno');
        }*/
        $this->_regiones->idpais = 193;
        $this->_vista->datos_regiones = $this->_regiones->selecciona();
        
        $this->_provincias->codigo_region = 1901;
        $this->_vista->datos_provincias = $this->_provincias->selecciona();
        
        $this->_ubigeos->codigo_provincia = 1968;
        $this->_vista->datos_ubigeos = $this->_ubigeos->selecciona();
      //  $this->_vista->datos_institucion = $this->_->selecciona();
       
        
        $this->_vista->titulo = 'Registrar alumno';
        $this->_vista->action = BASE_URL . 'alumno/nuevo';
        $this->_vista->setJs(array('funciones_form','jquery-ui'));
        $this->_vista->setCss(array('jquery-ui'));
        $this->_vista->renderizar('form');
    }

    
    
    
    
    
    
    
    
    
    public function editar($id) {
        $fecha = '';
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('cliente');
        }

        $this->_cliente->idcliente = $this->filtrarInt($id);
        $datos = $this->_cliente->selecciona();

        if ($_POST['guardar'] == 1) {
            $this->_cliente->nombres = $_POST['nombres'];
            if(isset ($_POST['apellidos'])){
                $this->_cliente->apellidos = $_POST['apellidos'];
            }else{
                $this->_cliente->apellidos = null;
            }
            $this->_cliente->documento = $_POST['documento'];
            if(isset ($_POST['fecha_nacimiento']) && $_POST['fecha_nacimiento']!=""){
                $fecha = substr($_POST['fecha_nacimiento'], 6, 4) . '-';
                $fecha .= substr($_POST['fecha_nacimiento'], 3, 2) . '-';
                $fecha .= substr($_POST['fecha_nacimiento'], 0, 2);
                $this->_cliente->fecha_nacimiento = $fecha;
            }else{
                $this->_cliente->fecha_nacimiento = '1990-01-01';
            }
            if(isset ($_POST['sexo'])){
                $this->_cliente->sexo = $_POST['sexo'];
            }else{
                $this->_cliente->sexo = 1;
            }
            $this->_cliente->telefono=$_POST['telefono'];
            $this->_cliente->email= $_POST['email'];
            if(isset ($_POST['estado_civil'])){
                $this->_cliente->estado_civil = $_POST['estado_civil'];
            }else{
                $this->_cliente->estado_civil = null;
            }
            if(isset ($_POST['profesion'])){
                $this->_cliente->idprofesion = $_POST['profesion'];
            }else{
                $this->_cliente->idprofesion = 67;
            }
            if(isset ($_POST['ubigeo']) && $_POST['ubigeo']!=""){
                $this->_cliente->idubigeo = $_POST['ubigeo'];
            }else{
                $this->_cliente->idubigeo = 0;
            }
            $this->_cliente->direccion = $_POST['direccion'];
            $this->_cliente->tipo = $_POST['tipo_cliente'];
            $this->_cliente->actualiza();
            $this->redireccionar('cliente');
        }
        //obtenemos todas las regiones que pertenecen al pais del proveedor
        $this->_regiones->idpais = 193;
        $this->_vista->datos_regiones = $this->_regiones->selecciona();
        //obtenemos todas las provincias que pertenecen a la región del proveedor
        $this->_provincias->codigo_region = $datos[0]['IDREGION'];
        $this->_vista->datos_provincias = $this->_provincias->selecciona();
        //obtenemos todas las ciudades que pertenecen a la provincia del proveedor
        $this->_ubigeos->codigo_provincia = $datos[0]['IDPROVINCIA'];
        $this->_vista->datos_ubigeos = $this->_ubigeos->selecciona();
        
        $this->_vista->datos_profesiones = $this->_profesiones->selecciona();
        
        $this->_vista->datos = $datos;
        $this->_vista->titulo = 'Actualizar Cliente';
        $this->_vista->setJs(array('funciones_form','jquery-ui'));
        $this->_vista->setCss(array('jquery-ui'));
        $this->_vista->renderizar('form');
    }
    
    public function ver(){
        $this->_cliente->idcliente=$_POST['idcliente'];
        echo json_encode($this->_cliente->selecciona());
    }
    
    public function get_provincias() {
        $this->_provincias->codigo_provincia = 0;
        $this->_provincias->codigo_region = $_POST['idregion'];
        echo json_encode($this->_provincias->selecciona());
    }

    public function get_ciudades() {
        $this->_ubigeos->idubigeo = 0;
        $this->_ubigeos->codigo_provincia = $_POST['idprovincia'];
        echo json_encode($this->_ubigeos->selecciona());
    }
    
}

?>
