<div class="navbar-inner text-center">
 <form  method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm">   
     <input type="hidden" name="guardar" id="guardar" value="1"/> 
 <?php if (isset($this->datos_alumnomatriculados) && count($this->datos_alumnomatriculados)) { ?>
<h3>Registrar Asistencia</h3>
   <p>
       Turno
       <select name="codigo_horario" id="codigo_horario">
           <option value="" selected="selected">seleccione..</option>
                                <?php for($i=0;$i<count($this->datos_horario);$i++){ ?>
                                    <?php if( $this->datos_horario[0]['HORARIO_ID'] == $this->datos_horario[$i]['HORARIO_ID'] ){ ?>
                                <option value="<?php echo $this->datos_horario[$i]['HORARIO_ID'] ?>" ><?php echo utf8_encode($this->datos_horario[$i]['TURNO']) ?></option>
                                    <?php } else { ?>
                                <option value="<?php echo $this->datos_horario[$i]['HORARIO_ID'] ?>"><?php echo utf8_encode($this->datos_horario[$i]['TURNO']) ?></option>
                                    <?php } ?>
                                <?php } ?>
     </select> 
       Fecha Actual
       <input name="fecha_actual" type="text" id="fecha_actual" value="<?php echo date("d/m/Y"); ?>" size="8" readonly="readonly" />  
   </p>
   
    <p>
 
        <input type="text" class="input-xlarge" id="buscar">
        <button type="button" class="btn btn-inverse" id="btn_buscar"><i class="icon-search icon-white"></i></button>  
        <button type="submit" class="btn btn-inverse" id="save">Guardar</button>
      </p> 
    <div id="grilla">
  
      
    </div>
	<div id="controls">
		<div id="perpage">
			<select onchange="sorter.size(this.value)">
			<option value="5">5</option>
				<option value="10" selected="selected">10</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
			</select>
			<span>Entradas por Página</span>
		</div>
		<div id="navigation">
			<img src="<?php echo BASE_URL ?>lib/img/first.gif" width="16" height="16" alt="Primera Página" onclick="sorter.move(-1,true)" />
			<img src="<?php echo BASE_URL ?>lib/img/previous.gif" width="16" height="16" alt="Página Anterior" onclick="sorter.move(-1)" />
			<img src="<?php echo BASE_URL ?>lib/img/next.gif" width="16" height="16" alt="Página Siguiente" onclick="sorter.move(1)" />
			<img src="<?php echo BASE_URL ?>lib/img/last.gif" width="16" height="16" alt="Última Página" onclick="sorter.move(1,true)" />
		</div>
		<div id="text">Página <span id="currentpage"></span> de <span id="pagelimit"></span></div>
	</div>
    <?php } else { ?>
    <div class="page-header">
        <p>No hay alumnos Matriculados</p>
        <p><a href="<?php echo BASE_URL?>alumno/nuevo" class="btn btn-inverse">Nuevo</a></p>
    </div>
    <?php } ?>
 </form>  