<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of view
 *
 * @author pedro
 */
class view {

    //put your code here
    private $_controlador;
    private $_menu;
    private $_modulo_padre;
    private $_js;
    private $_css;
    private $_js_foot;

    //parametro request = es el parametro del ccontrolador
    public function __construct(request $peticion, $menu, $modulo_padre) {
        //guardamos el nombre del controlador
        $this->_controlador = $peticion->get_controlador();
        $this->_menu = $menu;
        $this->_modulo_padre = $modulo_padre;
        $this->_js = array();
        $this->_css = array();
        $this->_js_foot = array();
    }

    public function renderizar($vista, $item = false) {
        //aqui podemos poner el menu
        //creamos la ruta de la vista

        $ruta_vista = ROOT . 'vista' . DS . $this->_controlador . DS . $vista . '.php';

        $js = array();
        $css = array();

        if (count($this->_js)) {
            $js = $this->_js;
        }
        if (count($this->_css)) {
            $css = $this->_css;
        }
        if (count($this->_js_foot)) {
            $js_foot = $this->_js_foot;
        }

        $_params = array(
            'ruta_css' => BASE_URL . 'lib/css/',
            'ruta_js' => BASE_URL . 'lib/js/',
            'ruta_img' => BASE_URL . 'lib/img/',
            'js' => $js,
            'css' => $css,
            'js_foot' => $js_foot
        );

        //die($ruta_vista);
        //comprobamos si el archivo existe y es legible
        //die($ruta_vista);
        if (is_readable($ruta_vista)) {
            //enviamos parametros como css, js
            //archivos propios del template
            //incluimos los layout
            include_once ROOT . DS . 'cabecera.php';
            if(session::get('autenticado')){
                include_once ROOT . DS . 'menu.php';
                new menu($this->_menu, $this->_modulo_padre);
            }
            if(!isset($this->vermenu) && session::get('autenticado')){
                echo "<div class='navbar-inner'><div class='container-fluid'>";
                echo "<div class='container-fluid'><div class='container-fluid' id='cont-sistema'>";
            }
            include_once $ruta_vista;
            include_once ROOT . DS . 'pie.php';
            //incluimos la vista
        } else {
            throw new Exception('Error de vistaaa ');
        }
    }

    public function renderizar_webservice($vista, $item = false) {
        //aqui podemos poner el menu
        //creamos la ruta de la vista

        $ruta_vista = $ruta_vista = ROOT . 'vista' . DS . $this->_controlador . DS . $vista . '.php';
        //comprobamos si el archivo existe y es legible

        if (is_readable($ruta_vista)) {
            //incluimos los layout
            require_once ROOT . 'lib'.DS.'nusoap'.DS.'nusoap.php';
            include_once $ruta_vista;
            //incluimos la vista
        } else {
            throw new Exception('Error de vistasss');
        }
    }

    public function setJs(array $js) {
        if (is_array($js) && count($js)) {
            for ($i = 0; $i < count($js); $i++) {
                $this->_js[] = BASE_URL . 'vista/' . $this->_controlador . "/js/" . $js[$i] . '.js';
            }
        } else {
            throw new Exception('Error de js');
        }
    }

    public function setCss(array $css) {
        if (is_array($css) && count($css)) {
            for ($i = 0; $i < count($css); $i++) {
                $this->_css[] = BASE_URL . 'vista/' . $this->_controlador . "/css/" . $css[$i] . '.css';
            }
        } else {
            throw new Exception('Error de css');
        }
    }
    
    public function setJs_Foot(array $js_foot) {
        if (is_array($js_foot) && count($js_foot)) {
            for ($i = 0; $i < count($js_foot); $i++) {
                $this->_js_foot[] = BASE_URL . 'vista/web/js/' . $js_foot[$i] . '.js';
            }
        } else {
            throw new Exception('Error de js');
        }
    }

    public function renderizar_reporte($vista, $item = false) {
        //aqui podemos poner el menu
        //creamos la ruta de la vista

        $ruta_vista = ROOT . 'vista' . DS . $this->_controlador . DS . $vista . '.php';
        //comprobamos si el archivo existe y es legible

        if (is_readable($ruta_vista)) {
            //incluimos los layout
            include_once $ruta_vista;
            //incluimos la vista
        } else {
            throw new Exception('Error de vista');
        }
    }

}

?>