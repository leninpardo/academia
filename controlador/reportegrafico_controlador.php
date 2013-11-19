<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of reportes_graf
 *
 * @author eveR
 */
class reportegrafico_controlador extends controller {

    private $_reportes_graficos;

    //put your code here
    public function __construct() {
        if (!$this->acceso()) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
        $this->get_Libreria('highchart' . DS . 'Highchart');
        $this->_vista->setJs(array('funciones'));
        $this->_reportes_graficos = $this->cargar_modelo('reportes_graficos');
    }

    public function index() {
        $this->_vista->renderizar('index');
    }

    public function r_matricula() {
        $this->_reportes_graficos->anio=2013;
        $this->_vista->datos= $this->_reportes_graficos->reporte_matricula();
        $this->_vista->renderizar_reporte('r_matricula');
    }
    
    public function r_turno() {
        $this->_vista->datos= $this->_reportes_graficos->reporte_turno();
        $this->_vista->renderizar_reporte('r_turno');
    }

}

?>
