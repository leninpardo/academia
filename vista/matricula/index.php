<?php if (isset($this->datos) && count($this->datos)) { ?>
<div class="navbar-inner text-center">
<p><h3>Lista de Alumnos Matriculados</h3></p>
    <p>
        <!--
        <select class="list" id="filtro">
            <option value="0">Alumno</option>
            <option value="1">dni</option>
        </select>-->
        <input type="text" class="input-xlarge" id="buscar">
        <button type="button" class="btn btn-inverse" id="btn_buscar"><i class="icon-search icon-white"></i></button>
        <a href="<?php echo BASE_URL?>matricula/nuevo" class="btn btn-inverse">Nuevo</a>
    </p>
    <div id="grilla">
    <table id="table" class="table table-striped table-bordered table-hover sortable">
        <thead>
        <tr>
            <th>Item </th>
            <th>Fecha Matricula</th>
            <th>Nombres</th>
            <th>Dni</th>
            <th>Correo</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <?php $i=1;foreach  ($this->datos as $k) { ?>
            <tr>
                <td><?php echo $i; ?></td>
                <td><?php echo $k[1] ?></td>
                <td><?php echo $k[2] ?></td>
                <td><?php echo $k[3] ?></td>
                <td><?php echo $k[4] ?></td>
                
                <td>
                    <a href="#myModal" role="button" data-toggle="modal" onclick="ver('<?php echo $k[0]; ?>')" class="btn btn-warning"><i class="icon-eye-open icon-white"></i> Ver</a>
                    <a href="javascript:void(0)" onclick="eliminar('<?php echo BASE_URL?>matricula/eliminar/<?php echo $k[0] ?>')" class="btn btn-danger"><i class="icon-remove icon-white"></i> Eliminar</a>
                </td>
            </tr>
        <?php $i=$i+1; } ?>
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
        <p>No hay Alumnos Matriculados</p>
        <a href="<?php echo BASE_URL?>matricula/nuevo" class="btn btn-primary">Nuevo</a>
    <?php } ?>

        <!-- Modal -->
    <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel"></h3>
        </div>
        <div class="modal-body text-justify">
            <div id="bodymodal">
                <div class="text-center">
                    <img src="<?php echo BASE_URL ?>lib/img/loading.gif" />
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Ok</button>
        </div>
    </div>