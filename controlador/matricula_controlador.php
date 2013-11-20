<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of matricula_controller
 *
 * @author lenin
 */
class matricula_controlador extends controller{

 
    private $_matricula;
    private $_alumno;
    private $_regiones;
    private $_provincias;
    private $_ubigeos;
    private $_institucioneducativa;
    private $_apoderado;
    public function __construct() {
        if (!$this->acceso()) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
        $this->_matricula=$this->cargar_modelo("matricula");
        $this->_alumno=  $this->cargar_modelo('alumno');
        $this->_regiones = $this->cargar_modelo('regiones'); //
        $this->_provincias = $this->cargar_modelo('provincias');//
        $this->_ubigeos = $this->cargar_modelo('ubigeos');
        $this->_institucioneducativa = $this->cargar_modelo('institucioneducativa');
        $this->_apoderado = $this->cargar_modelo('apoderado');
        
     
    }

    public function index() {
       $this->_vista->datos =$this->_matricula->getQuery("select *from vista_matricula");
        $this->_vista->setJs(array('funcion'));
        $this->_vista->setJs_Foot(array('scriptgrilla'));
        $this->_vista->renderizar('index');
    }

    public function inserta_alu() {
        $fecha = '';
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
            if(isset ($_POST['grado'])){
                $this->_alumno->grado = $_POST['grado'];
            }else{
                $this->_alumno->grado = null;
            }
      
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
           echo json_encode(array('x_idcliente'=>$datos[0]['X_IDCLIENTE'])); 
    }

      public function inserta_apo() {
            $this->_apoderado->nombre = $_POST['nombre'];
            $this->_apoderado->apellido_paterno = $_POST['apellido_paterno'];
            $this->_apoderado->apellido_materno = $_POST['apellido_materno'];
            $this->_apoderado->direccion = $_POST['direccion'];
            $this->_apoderado->ocupacion = $_POST['ocupacion'];
            $this->_apoderado->fecha_nacimiento = $_POST['fecha_nacimiento'];
            $this->_apoderado->dni = $_POST['dni'];
            $this->_apoderado->inserta();
           echo json_encode(array('x_idcliente'=>$datos[0]['X_IDCLIENTE'])); 
          
      }
    
    public function ver(){
        $idm=$_POST['id'];

       $dat=$this->_matricula->getQuery("SELECT *from vista_matricula WHERE matricula_id=$idm");
        $data=$dat->fetchall();
        echo json_encode($data);
    }

    public function buscador(){

        $buscar=$_POST['cadena'];
        $data=$this->_matricula->getQuery("SELECT *
                from vista_matricula WHERE nombres like '%$buscar%' or Matricula_ID like '%$buscar%' or fecha_matricula LIKE '%$buscar%' or dni like '%$buscar%'
or email LIKE'%$buscar%'");
        echo json_encode($data);
    }

    public function nuevo() {
//        echo '<pre>';print_r($_POST);exit;
      
        if ($_POST['guardar'] == 1) {
            //guadar la matricula
              
            $estudiante = $_POST['estudiante'];
             $apoderado = $_POST['apoderado'];
             $monto_incial = $_POST['pago'];
             $reserva = $_POST['reserva'];
             $total = $_POST['total'];
             $obs = $_POST['obs'];
             $empleado=session::get("idempleado");
                 if($reserva==null)
                         {
                        $res=2;
                         }
                         else{
                              $res=1;
                         }
            
             $datos = array(1,$estudiante, $apoderado,$empleado, $res,$monto_incial, $total,$obs);
        $r = $this->_matricula->get_consulta("usp_matricula", $datos);
         if ($r[1] == '') {
            $stmt = $r[0];
             $data=$stmt->fetchall();
             $idm=$data[0][0];
           
                //guardar detalle cursos
              for($i=0;$i<count($_POST['cursos_id']);$i++){
               
                  $c=$_POST['cursos_id'][$i];
                  $datos = array($idm,$c,' cursos matriculados',$empleado);
                  
               $r = $this->_matricula->get_consulta("usp_cursos_matricula",$datos);
              }
              //guardar los horarios
                 for($i=0;$i<count($_POST['horario_id']);$i++){

                  $h=$_POST['horario_id'][$i];
                 // $datos = array($idm,$c,' cursos matriculados',$empleado);
                 $this->_matricula->getQuery("insert into detalle_horario values($idm,$h)");
               //$r = $this->_matricula->get_consulta("usp_cursos_matricula",$datos);
              }
              //guardar los cronogramas de pagos
               if($reserva!=null)
                {


                   for($i=0;$i<count($_POST['monto']);$i++){

                  $m=$_POST['monto'][$i];
                  //op int,fecha date, monto decimal(10,2),matricula int
                  $datos = array(1,$_POST['fecha_'.$m],$m,$idm);

               $r = $this->_matricula->get_consulta("usp_cronograma_pago",$datos);
              }
              
               }
               

               $this->redireccionar('matricula');
        } else {
            die($r[1]);
        }                  
        }
       //para iniciar el frm
        $verif_caja=$this->_matricula->getQuery("SELECT * from caja where id_empleado=1 and estado=1 and fecha=CURRENT_DATE() ");
      
       foreach ($verif_caja as $vfc)
            {
            $flag=true;
            }
       if($flag)
            {
        $this->_vista->data_alumnos=$this->_matricula->getQuery("SELECT Alumno_ID,CONCAT(nombre,' ',apellido_paterno,' ',apellido_materno) as nombres
from alumno");
        $this->_vista->data_apoderados=$this->_matricula->getQuery("SELECT Apoderado_ID,CONCAT(nombre,' ',apellido_paterno,' ',apellido_materno) as nombres from apoderado");
        $this->_vista->data_cursos=$this->_matricula->getQuery("select * from cursos");
        $this->_vista->data_horarios=$this->_matricula->getQuery("select * from horario");
      
        
          
        $this->_regiones->idpais = 193;
        $this->_vista->datos_regiones = $this->_regiones->selecciona();
        
        $this->_provincias->codigo_region = 1901;
        $this->_vista->datos_provincias = $this->_provincias->selecciona();
        
        $this->_ubigeos->codigo_provincia = 1968;
        $this->_vista->datos_ubigeos = $this->_ubigeos->selecciona();
        $this->_vista->datos_institucion = $this->_institucioneducativa->selecciona();    
        
        $this->_vista->titulo = 'Registrar Matriculas';
        $this->_vista->action = BASE_URL . 'matricula/nuevo';
        $this->_vista->setJs(array('funciones_form','jquery-ui.min'));
        $this->_vista->renderizar('form');
            }
            else {
                 $this->_vista->renderizar('form_msg');
            }
    }

    public function editar($id) {
        
       if ($_POST['guardar'] == 1) {
            //guadar la matricula

            $estudiante = $_POST['estudiante'];
             $apoderado = $_POST['apoderado'];
             $monto_incial = $_POST['pago'];
             $reserva = $_POST['reserva'];
             $total = $_POST['total'];
             $obs = $_POST['obs'];
             $empleado=session::get("idempleado");
                 if($reserva==null)
                         {
                        $res=2;
                         }
                         else{
                              $res=1;
                         }
             $datos = array(1,$estudiante, $apoderado,$empleado, $res,$monto_incial, $total,$obs);
        $r = $this->_matricula->get_consulta("usp_matricula", $datos);
         if ($r[1] == '') {
            $stmt = $r[0];
             $data=$stmt->fetchall();
             $idm=$data[0][0];

                //guardar detalle cursos
              for($i=0;$i<count($_POST['cursos_id']);$i++){

                  $c=$_POST['cursos_id'][$i];
                  $datos = array($idm,$c,' cursos matriculados',$empleado);

               $r = $this->_matricula->get_consulta("usp_cursos_matricula",$datos);
              }
              //guardar los horarios
                 for($i=0;$i<count($_POST['horario_id']);$i++){

                  $h=$_POST['horario_id'][$i];
                 // $datos = array($idm,$c,' cursos matriculados',$empleado);
                 $this->_matricula->getQuery("insert into detalle_horario values($idm,$h)");
               //$r = $this->_matricula->get_consulta("usp_cursos_matricula",$datos);
              }
              //guardar los cronogramas de pagos
               if($reserva!=null)
                {


                   for($i=0;$i<count($_POST['monto']);$i++){

                  $m=$_POST['monto'][$i];
                  //op int,fecha date, monto decimal(10,2),matricula int
                  $datos = array(1,$_POST['fecha_'.$m],$m,$idm);

               $r = $this->_matricula->get_consulta("usp_cronograma_pago",$datos);
              }

               }
                $this->redireccionar('matricula');
        } else {
            die($r[1]);
        }
        }
       //para iniciar el frm
        $verif_caja=$this->_matricula->getQuery("SELECT * from caja where id_empleado=1 and estado=1 and fecha=CURRENT_DATE() ");

       foreach ($verif_caja as $vfc)
            {
            $flag=true;
            }
       if($flag)
            {
         $this->_vista->data=$this->_matricula->getQuery("select *from matricula where matricula_id=$id");
         $this->_vista->data_curso_sel=$this->_matricula->getQuery("SELECT m.Cursos_ID,c.nombre_curso
FROM cursos_matricula m  INNER JOIN cursos c on(m.Cursos_ID=c.Cursos_ID)
WHERE Matricula_ID=$id");
         $this->_vista->data_cronograma=$this->_matricula->getQuery("select *from cronograma_pago where matricula_id=$id");
        $this->_vista->data_alumnos=$this->_matricula->getQuery("SELECT Alumno_ID,CONCAT(nombre,' ',apellido_paterno,' ',apellido_materno) as nombres
from alumno");
        $this->_vista->data_apoderados=$this->_matricula->getQuery("SELECT Apoderado_ID,CONCAT(nombre,' ',apellido_paterno,' ',apellido_materno) as nombres from apoderado");
        $this->_vista->data_cursos=$this->_matricula->getQuery("select * from cursos");
        $this->_vista->data_horarios=$this->_matricula->getQuery("select * from horario");

        $this->_vista->titulo = 'Registrar Matriculas';
        $this->_vista->action = BASE_URL . 'matricula/nuevo';
        $this->_vista->setJs(array('funciones_form','jquery-ui.min'));
        $this->_vista->renderizar('form');
            }
            else {
                 $this->_vista->renderizar('form_msg');
            }
    }

    public function eliminar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('matricula');
        }
       /// $this->_empleado->id_empleado¿ = $this->filtrarInt($id);
       // $this->_empleado->elimina();
        $this->redireccionar('matricula');
    }

}
?>
