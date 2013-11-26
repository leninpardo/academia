<?php

Class menu {

//cargarmenu("0"); // Donde 0 es el Idpadre principal
    protected $_id;
    protected $_datos;
    protected $_id_modulopadre;
    private $_c = 0;

    public function __construct($datos, $id_modulopadre) {
        $this->_datos = $datos;
        $this->_id_modulopadre = $id_modulopadre;
        $this->unemenu();
    }

    function unemenu() {
        echo "<section id='menu_sistema' class='menu-inner'>
                    <div class='navbar'>
                            <div class='pull-left'>
                                <button type='button' class='btn btn-navbar' data-toggle='collapse' data-target='.nav-collapse3'>
                                    <span class='icon-bar'></span>
                                    <span class='icon-bar'></span>
                                    <span class='icon-bar'></span>
                                </button>
                            </div>";
        echo "<ul class='nav'>";
        $this->cargarmenu();
        echo "<li><a href='" . BASE_URL . "'>Web</a></li>";
        echo "</ul>  
      <ul class='nav pull-right'><li><a href='".BASE_URL."login/cerrar'>Cerrar Sesión</a></li></ul>";
        echo "</div></section>";
           
    
    }

    function cargarmenu() {
        if(isset($this->_datos) && count($this->_datos)){
            for($i=0; $i< count($this->_datos); $i++){
                if($this->_c==0){
                    $descripcion= ucwords(strtolower($this->_datos[$i]['XMODULOS']));
                    if($this->_datos[$i]['IDMODULO']==$this->_id_modulopadre){
                        echo "<li  class='dropdown active'><a href='javascript:void' class='dropdown-toggle' data-toggle='dropdown'>$descripcion <i style='margin-top:-1px' class='icon icon-chevron-down icon-white'></i></a>
    <ul class='dropdown-menu'>";
                    }else{
                        echo "<li  class='dropdown'><a href='javascript:void' class='dropdown-toggle' data-toggle='dropdown'>$descripcion <i style='margin-top:-1px' class='icon icon-chevron-down icon-white'></i></a>
    <ul class='dropdown-menu'>";
                    }
                    $this->_c = 1;
                }
                if (strtoupper($descripcion) == $this->_datos[$i]['XMODULOS']){
                    $url = BASE_URL . strtolower($this->_datos[$i]['URL']);
                    echo "<li><a href='$url'>" . ucwords(strtolower($this->_datos[$i]['MODULOS_HIJOS'])) . "</a></li>";
                } else {
                    echo "</ul></li>";
                    $this->_c = 0;
                    $i = $i -1;
                }
            }
            echo "</ul></li>";
        }
    }
}
?>
<!--FIn menu-->