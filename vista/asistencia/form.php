<div class="navbar-inner text-center">
    <?php if (isset($this->datos_alumnomatriculados) && count($this->datos_alumnomatriculados)) { ?>
<h3>Registrar Asistencia</h3>
   <p>
     Curso
      <select name="codigo_curso" id="codigo_curso">
                                <option></option>
                                <?php for($i=0;$i<count($this->datos_cursos);$i++){ ?>
                                    <?php if( $this->datos_cursos[0]['CURSOS_ID'] == $this->datos_cursos[$i]['CURSOS_ID'] ){ ?>
                                <option value="<?php echo $this->datos_cursos[$i]['CURSOS_ID'] ?>" selected="selected"><?php echo utf8_encode($this->datos_cursos[$i]['NOMBRE_CURSO']) ?></option>
                                    <?php } else { ?>
                                <option value="<?php echo $this->datos_cursos[$i]['CURSOS_ID'] ?>"><?php echo utf8_encode($this->datos_cursos[$i]['NOMBRE_CURSO']) ?></option>
                                    <?php } ?>
                                <?php } ?>
     </select>
       Horarios
      <select name="codigo_horario" id="codigo_horario">
                                <option></option>
                                <?php for($i=0;$i<count($this->datos_horario);$i++){ ?>
                                    <?php if( $this->datos_horario[0]['HORARIO_ID'] == $this->datos_horario[$i]['HORARIO_ID'] ){ ?>
                                <option value="<?php echo $this->datos_horario[$i]['HORARIO_ID'] ?>" selected="selected"><?php echo utf8_encode($this->datos_horario[$i]['TURNO']) ?></option>
                                    <?php } else { ?>
                                <option value="<?php echo $this->datos_horario[$i]['HORARIO_ID'] ?>"><?php echo utf8_encode($this->datos_horario[$i]['TURNO']) ?></option>
                                    <?php } ?>
                                <?php } ?>
     </select> 
       Fecha Actual
       <input name="fecha_actual" type="text" id="fecha_actual" value="<?php echo date("d/m/Y"); ?>" size="8" readonly="readonly" />  
   </p>
   
    <p>
        <select style="width:250px" id="filtro">
            <option value="0">Nombre</option>
            <option value="1">DNI</option>
        </select>
        <input type="text" class="input-xlarge" id="buscar">
        <button type="button" class="btn btn-success" id="btn_buscar"><i class="icon-search icon-white"></i></button>  
      <a href="<?php echo BASE_URL?>asistencia" class="btn btn-primary">Registrar</a>
      </p> 
    <div id="grilla">
    <table id="table" class="table table-striped table-bordered table-hover sortable">
        <thead>
        <tr>
            <th>Nombre y Apellidos</th>
            <th>DNI</th>
            <th>Justificacion</th>
        </tr>
        </thead>
        <tbody>
<?php for ($i = 0; $i < count($this->datos_alumnomatriculados); $i++) { ?>
            <tr>
                <td><?php echo $this->datos_alumnomatriculados[$i]['NOMBRE'].' '.$this->datos_alumnomatriculados[$i]['APELLIDO_PATERNO'].' '.$this->datos_alumnomatriculados[$i]['APELLIDO_MATERNO'] ?></td>
                <td>
                    <input type="hidden" id="codigo_matricula" name="codigo_matricula" value="<?php echo $this->datos_alumnomatriculados[$i]['MATRICULA_ID'] ?>">
                    <?php echo $this->datos_alumnomatriculados[$i]['DNI'] ?>
                </td>
                <td>
                    <input type="radio"  name="<?php echo $this->datos_alumnomatriculados[$i]['MATRICULA_ID'] ?>" value="1">Presente 
                    <input type="radio"  name="<?php echo $this->datos_alumnomatriculados[$i]['MATRICULA_ID'] ?>" value="2">Ausente
                </td>
            </tr>
        <?php } ?>
        </tbody>
    </table>
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
        <p><a href="<?php echo BASE_URL?>alumno/nuevo" class="btn btn-primary">Nuevo</a></p>
    </div>
    <?php } ?>
 