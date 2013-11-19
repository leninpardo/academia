<?php if (isset($this->datos) && count($this->datos)) { ?>
<div class="navbar-inner text-center">
<p><h3>Administra caja</h3></p>
    <p>
        <!--
        <select class="list" id="filtro">
            <option value="0">Alumno</option>
            <option value="1">dni</option>
        </select>-->
        
        <input type="text" class="input-xlarge" id="buscar">
        <button type="button" class="btn btn-inverse" id="btn_buscar"><i class="icon-search icon-white"></i></button>
        <a href="<?php echo BASE_URL?>caja/aperturar" class="btn btn-inverse">Aperturar caja</a>
    </p>
    <div id="grilla">
    <table id="table" class="table table-striped table-bordered table-hover sortable">
        <thead>
        <tr>
            <th>Nro Caja</th>
         <th>Empleado</th>
            <th>Fecha</th>
            <th>Saldo</th>
            <th>Estado</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach  ($this->datos as $k) { ?>
            <tr>
                <td><?php echo $k[0] ?></td>
                <td><?php echo $k[1] ?></td>
                <td><?php echo $k[2] ?></td>
                <td><?php echo $k[3] ?></td>
                <td><?php if($k[4]==2){ echo '::::::::'; } elseif($k[4]==1){echo "<a href='javascript:void(0)' onclick='cerrar($k[0])'>Cerrar</a>"; } ?></td>

               
            </tr>
        <?php  } ?>
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
        <p>No hay cajas</p>
        <a href="<?php echo BASE_URL?>caja/aperturar" class="btn btn-primary">Aperturar</a>
    <?php } ?>

        <!-- Modal -->
    