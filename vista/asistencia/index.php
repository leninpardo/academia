<?php if (isset($this->datos) && count($this->datos)) { ?>
    <div class="navbar-inner text-center">
        <p><h3>Lista de Asistencia</h3></p>
    <p>
        <select class="list" id="filtro">
            <option value="0">Matricula</option>
            <option value="2">Alumno</option>
            <option value="2">Curso</option>
        </select>
        <input type="text" class="input-xlarge" id="buscar">
        <button type="button" class="btn btn-primary" id="btn_buscar"><i class="icon-search icon-white"></i></button>
        <a href="<?php echo BASE_URL ?>asistencia/nuevo" class="btn btn-primary">GenerarRegistro</a>
    </p>
    <div id="grilla">
        <table id="table" class="table table-striped table-bordered table-hover table-condensed">
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Fecha.</th>
                    <th>Alumno</th>
                    <th>Justificacion</th>
                </tr>
            </thead>
            <tbody>
                <?php for ($i = 0; $i < count($this->datos); $i++) { ?>
                    <tr>
                        <td><?php echo ($i+1) ?></td>
                        <td><?php echo $this->datos[$i]['FECHA'] ?></td>
                        <td><?php echo $this->datos[$i]['NOMBRE'].' '.$this->datos[$i]['APELLIDO_PATERNO'].' '.$this->datos[$i]['APELLIDO_MATERNO'] ?></td>
                <?php if($this->datos[$i]['JUSTIFICACION']==1){ ?>  
                        <td>Presente</td>       
                <?php } else{?>
                        <td>Ausente</td>
                <?php }?>        
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
    <div class="navbar-inner text-center">
        <br/>
        <p>No hay Asistencia</p>
        <a href="<?php echo BASE_URL ?>asistencia/nuevo" class="btn btn-success">Nuevo</a>
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
