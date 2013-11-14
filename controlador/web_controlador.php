<?php

class web_controlador extends controller {
    
    private $_informacion;
    private $_productos;

    public function __construct() {
        parent::__construct();
        $this->_vista->vermenu = '1';
       //$this->_informacion = $this->cargar_modelo('informacion');
       //$this->_productos = $this->cargar_modelo('productos');
       //$this->_cliente = $this->cargar_modelo('cliente');
    }
    
    public function index() {
      //$this->_vista->datos = $this->_cliente->selecciona();
        $this->_vista->setCss(array('estilos_web'));
        $this->_vista->setJs(array('jquery.easing','script','buttons'));
        $this->_vista->li_menu = "li_inicio";
        $this->_vista->renderizar('index');
    }
    
  /* public function ver(){
        $this->_productos->id=$_POST['id'];
       echo json_encode($this->_productos->selecciona());
    }
    */
    public function nosotros(){
//        $this->_vista->datos = $this->_informacion->selecciona();
        $this->_vista->setCss(array('estilos_web'));
        $this->_vista->li_menu = "li_nosotros";
        $this->_vista->renderizar('nosotros');
    }
    
    public function servicios(){
//        $this->_vista->datos = $this->_productos->selecciona();
        $this->_vista->setCss(array('estilos_web'));
        $this->_vista->li_menu = "li_servicios";
        $this->_vista->renderizar('servicios');
    }
      public function destino(){
//        $this->_vista->datos = $this->_productos->selecciona();
        $this->_vista->setCss(array('estilos_web'));
        $this->_vista->li_menu = "li_destino";
        $this->_vista->renderizar('destino');
    }
      public function galeria(){
//        $this->_vista->datos = $this->_productos->selecciona();
        $this->_vista->setCss(array('estilos_web'));
        $this->_vista->li_menu = "li_galeria";
        $this->_vista->renderizar('galeria');
    }
   
    public function contactenos(){
        $this->_vista->setCss(array('estilos_web'));
        $this->_vista->li_menu = "li_contactenos";
        $this->_vista->renderizar('contacto');
    }
    
}

?>
