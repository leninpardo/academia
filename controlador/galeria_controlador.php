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
        $this->_vista->li_menu = "li_galeria";
        $this->_vista->renderizar('galeria');
    }
    

 
      public function album($id,$name){
//        $this->_vista->datos = $this->_productos->selecciona();
        $this->_vista->setCss(array('estilos_web'));
        $this->_vista->li_menu = "li_album";
         $this->_vista->idfb = $id;
          $this->_vista->nombre = $name;
        $this->_vista->renderizar('album');
    }
   
 
    
}

?>
