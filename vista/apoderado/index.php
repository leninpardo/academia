<?php if (isset($this->datos) && count($this->datos)) { ?>
<div class="navbar-inner text-center">
<p><h3>Lista de Apoderados</h3></p>
    <p>
        
        <input type="text" class="input-xlarge" id="buscar">
        <button type="button" class="btn btn-inverse" id="btn_buscar"><i class="icon-search icon-white"></i></button>
        <a href="<?php echo BASE_URL?>apoderado/nuevo" class="btn btn-inverse">Nuevo</a>
    </p>
    <div id="grilla">
    <table id="table" class="table table-striped table-bordered table-hover sortable">
        <thead>
        <tr>
            <th>Item</th>
            <th>Nombre</th>
            <th>Apellido_paterno</th>
            <th>Apellido_materno</th>
            <th>Direccion</th>
            <th>Ocupacion</th>
            <th>Fecha_nacimiento</th>
            <th>DNI</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <?php for ($i = 0; $i < count($this->datos); $i++) { ?>
            <tr>
                <td><?php echo $i+1 ?></td>
                <td><?php echo $this->datos[$i]['NOMBRE'] ?></td>
               <td><?php echo $this->datos[$i]['APELLIDO_PATERNO'] ?></td>
                <td><?php echo $this->datos[$i]['APELLIDO_MATERNO'] ?></td>
                <td><?php echo $this->datos[$i]['DIRECCION'] ?></td>
                <td><?php echo $this->datos[$i]['OCUPACION'] ?></td>
                <td><?php echo $this->datos[$i]['FECHA_NACIMIENTO'] ?></td>
                <td><?php echo $this->datos[$i]['DNI'] ?></td>
                <td>
                    <a href="javascript:void(0)" onclick="editar('<?php echo BASE_URL?>apoderado/editar/<?php echo $this->datos[$i]['APODERADO_ID'] ?>')" class="btn btn-warning"><i class="icon-pencil icon-white"></i> Editar</a>
                    <a href="javascript:void(0)" onclick="eliminar('<?php echo BASE_URL?>apoderado/eliminar/<?php echo $this->datos[$i]['APODERADO_ID'] ?>')" class="btn btn-danger"><i class="icon-remove icon-white"></i> Eliminar</a>
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
<div class="navbar-inner">
        <p>No hay Horario</p>
        <a href="<?php echo BASE_URL?>horario/nuevo" class="btn btn-primary">Nuevo</a>
    <?php } ?>