<div class="navbar-inner text-center">
<h3>Reportes Disponibles</h3>
<form method="post" action="<?php echo BASE_URL ?>reportes/cursos_x_alumnos" target="_blank" id="form_ventas_x_producto">
    <table width="70%" class="tablaok" cellpadding='10'>
        <caption>Reporte de alumno por Curso</caption>
        <tr>
            <td>Cursos.:
                  <select name="cursos_id" id="cursos_id">
                                <option></option>
                                <?php for($i=0;$i<count($this->datos_cursos);$i++){ ?>
                                    <?php if( $this->datos_cursos[0]['CURSOS_ID'] == $this->datos_cursos[$i]['CURSOS_ID'] ){ ?>
                                <option value="<?php echo $this->datos_cursos[$i]['CURSOS_ID'] ?>" selected="selected"><?php echo utf8_encode($this->datos_cursos[$i]['NOMBRE_CURSO']) ?></option>
                                    <?php } else { ?>
                                <option value="<?php echo $this->datos_cursos[$i]['CURSOS_ID'] ?>"><?php echo utf8_encode($this->datos_cursos[$i]['NOMBRE_CURSO']) ?></option>
                                    <?php } ?>
                               <?php } ?>
                   </select>
            </td>
            <td width="15%" align="center">
                <input type="submit" value="Generar"  class="btn btn-warning"/>
            </td>
        </tr>
    </table>
</form>

<form method="post" action="<?php echo BASE_URL ?>reportes/turno_x_asistencia" target="_blank" id="form_ventas_x_producto">
    <table width="70%" class="tablaok" cellpadding='10'>
        <caption>Reporte de Turno por Asistencia</caption>
        <tr>
            <td> Turno.:
                 <select name="horario_id" id="horario_id">
                                <option></option>
                                <?php for($i=0;$i<count($this->datos_horario);$i++){ ?>
                                    <?php if( $this->datos_horario[0]['HORARIO_ID'] == $this->datos_horario[$i]['HORARIO_ID'] ){ ?>
                                <option value="<?php echo $this->datos_horario[$i]['HORARIO_ID'] ?>" selected="selected"><?php echo utf8_encode($this->datos_horario[$i]['TURNO']) ?></option>
                                    <?php } else { ?>
                                <option value="<?php echo $this->datos_horario[$i]['HORARIO_ID'] ?>"><?php echo utf8_encode($this->datos_horario[$i]['TURNO']) ?></option>
                                    <?php } ?>
                               <?php } ?>
                   </select> 
            </td>
            <td width="15%" align="center">
                <input type="submit" value="Generar" class="btn btn-warning"/>
            </td>
        </tr>
    </table>
</form>


<div id="fondooscuro"></div>
<br><br>