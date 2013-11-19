<div class="navbar-inner">
    <form method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm">
    <input type="hidden" name="guardar" id="guardar" value="1"/>
    <input type="hidden" readonly="readonly" name="codigo" id="codigo"
                value="<?php if(isset ($this->datos[0][0]))echo $this->datos[0][0]?>"/>
    <table align="center" cellpadding="10">
        <caption><h3><?php echo $this->titulo ?><span id="msg"></span></h3></caption>
        <tr>
            <td>
        <label>Estudiante</label>
            </td>
                  <td>
                    
                      <select id="estudiante" name="estudiante">
                          <option value="">::Seleccione::</option>
                          <?php
                        foreach ($this->data_alumnos as $k)
                              {
                            $select="";

                               if($this->data[0][0]==$k[0])
                                       {
                                        $select="selected";
                                        }
                           echo "<option value='".$k[0]."' $select>".$k[1]."</option>";
                                       
                              }
                          ?>
                      </select>
                    </td>
                    <td>
                       
                        <input type="button" href="#myModal" class="btn btn-primary" value="nuevo" id="new_alumno" data-toggle="modal" />
                    </td>
        </tr>
        <tr>
            <td>Apoderado            </td>
            <td>
                <select id="apoderado" name="apoderado">
                          <option value="">::Seleccione::</option>
                          <?php 
                            foreach ($this->data_apoderados as $k)
                              {
                           $select="";

                               if($this->data[0][6]==$k[0])
                                       {
                                        $select="selected";
                                        }
                           echo "<option value='".$k[0]."' $select>".$k[1]."</option>";
                              }
                          ?>
                      </select>
            </td>
              <td>
          <input type="button" href="#ventana-apoderado" class="btn btn-primary" value="nuevo" id="new_apoderado" data-toggle="modal" />
              </td>
        </tr>
        
        <tr>
            <td>
                lista de cursos
            </td>
            <td>
               <select id="cursos" name="cursos">
                          <option value="">::Seleccione::</option>
                          <?php 
                            foreach ($this->data_cursos as $k)
                              {
                           echo "<option value='".$k[0]."'>".$k[1]."</option>";
                              }
                          ?>
                      </select>
            </td>
            
        </tr>

        <tr>
            <td></td>
            <td>
                <div class="table-responsive">
                <table id="lista_cursos" name="lista_curso" align="center" class="table">
                    <thead>
                    <tr>
                        <th>
                            Codigo de Curso
                        </th>
                        <th>
                            Nombre
                        </th>
                        <th>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                        <?php
                        foreach ($this->data_curso_sel as $sc)
                                {
                                echo "<tr>";
                                
                                  echo "<td> <input type='hidden' name='cursos_id[]' value='".$sc[0]."'/>".$sc[0]."</td>";
                                  echo "<td>$sc[1]</td>";
                                  echo "<td>eliminar</td>";
                                  echo "</tr>";
                                }
                        ?>
                    </tbody>
                </table>
                </div>
            </td>
        </tr>
        
        <tr>
                        <td></td>

            <td>lista de horarios disponibles</td>
        </tr>
        
        <tr>
            <td></td>
            <td>
        <table id="horario" name="horario" align="center" class="table">
            <thead>
            <tr><th>Item</th><th>Turno</th><th>Dia</th><th>Hora Inicio</th><th>hora finalizar</th><th>Accion</th></tr>
            </thead>
            <?php
            $item=0;
            foreach ($this->data_horarios as $th)
                    {
                $item++;
                echo "<tr>";
                    echo "<td>$item</td>";
                    echo "<td>$th[1]</td>";
                    echo "<td>$th[2]</td>";
                    echo "<td>$th[3]</td>";
                    echo "<td>$th[4]</td>";
                    echo "<td><input type='checkbox' class='cliking' name='horario_id[]' id='horario_id[]' value='".$th[0]."' /></td>";
                    echo "</tr>";
                    }
            ?>
        
        </table>
            </td>
        </tr>
        
        <tr>
            <td>
                monto de pago inicial:
            </td>
            <td>
                <input type="text" name="pago" id="pago" value="<?php echo $this->data[0][8];?>" />
            </td>
            <td>Reserva:</td>
            <td><input type="checkbox" name="reserva" id="reserva" value="1"/></td>
        </tr>
        
        <tr>

            <td>Fecha de pago:</td>
            <td><!--<input type="text" data-format="yyyy-MM-dd" name="fecha_p" id="fecha_p" value=""/>-->
                <div class="well">
                    <input class="span2"  id="fecha_p" type="text" name="fecha_p">
</div>
            </td>
            <td>monto:</td>
            <td><input type="text" name="monto_p" id="monto_p" ></td>
            <td>
             
                <button  name="add_cronograma" id="add_cronograma" type="button" class="btn btn-success active" value="1"><i class="icon-ok icon-white"></i></button>
            </td>
            
        </tr>
        <tr>
            <td></td>
        <td>
            <div id="capa_cronograma" <?php if($this->data_cronograma!=null){}else{echo "style='display:none;'";}?>>
            <table id="cronograma" id="cronograma" align="center" class="table">
                <thead>
                <tr>
                    <th> Item</th>
                    <th> Fecha </th>
                    <th> Pago</th>
                </tr>
                </thead>
                <tbody>
                    <?php
                    $i=0;
                    foreach ($this->data_cronograma as $cr)
                            {
                        $i++;
                        $name="fecha_".$cr[2];
                        echo "<tr>";
                        echo "<td>$i</td>";
                              echo "<td><input type='hidden' name='".$name."' value='".$cr[1]."'/>".$cr[1]."</td>";

                    echo "<td><input type='hidden' name='monto[]' value='".$cr[2]."'/>".$cr[2]."</td>";
                    echo "</tr>";
                             }
                    ?>
                </tbody>
            </table>
            </div>
            <div>
                <samp>Total de pago</samp> <input type="text" name="total" id="total" reandoly value="<?php echo $this->data[0][9];?>" />
            </div>
             <div>
                <samp>observaciones</samp>
                <textarea id="obs" name="obs" >

                </textarea>
            </div>
        </td>
        </tr>
        
        <tr>
            <td colspan="2" align="center">
                <p><button type="submit" class="btn btn-inverse" id="save">Guardar</button>
                <a href="<?php echo BASE_URL ?>matricula" class="btn btn-inverse">Cancelar</a></p>
            </td>
        </tr>
        
    </table>
</form>
</div>

  <!---->
  <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style=" width: 1200px; left: 300px; height:  auto;">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel"></h3>
        </div>
        <div class="modal-body text-justify">
           
            <caption><h3>Registo de Alumnos<span id="msg"></span></h3></caption>
              <table align="center" cellpadding="10">
                    <tr>
                        <td><label>Nro.Documento:</label></td>
                        <td>
                            <input class="input-large" type="text" name="documento" onKeyPress="return soloNumeros(event);"
                            maxlength="8" id="nrodoc" value="<?php if(isset ($this->datos[0]['DNI']))echo $this->datos[0]['DNI']?>"/>
                        </td>
                        <td><label>Nombre:</label></td>
                        <td>
                            <input type="text" name="nombres" onkeypress="return soloLetras(event)"
                            id="nombre" value="<?php if(isset ($this->datos[0]['NOMBRE']))echo $this->datos[0]['NOMBRE']?>"/>
                        </td>
                    </tr>
                    <tr>
                        <td><label>Apellidos_Paterno:</label></td>
                        <td>
                            <input type="text" name="apellidos" onkeypress="return soloLetras(event)"
                            id="apellidos" value="<?php if(isset ($this->datos[0]['APELLIDO_PATERNO']))echo $this->datos[0]['APELLIDO_PATERNO']?>"/>
                        <td><label>:Apellidos_Paterno</label></td>
                        <td>
                            <input type="text" name="apellido_materno"
                            id="apellido_materno" value="<?php if(isset ($this->datos[0]['APELLIDO_MATERNO']))echo $this->datos[0]['APELLIDO_MATERNO']?>"/>
                        </td>
                    </tr>
                    <tr>
                        <td><label>Sexo:</label></td>
                        <td>
                            <style>
                                input[type="radio"]{
                                    margin: 0 0.5em 0 1.5em;
                                }
                            </style>
                            <?php if (isset ($this->datos[0]['SEXO']) && $this->datos[0]['SEXO']==0) {?>
                            <input type="radio" name="sexo" value ="1" />M
                            <input type="radio" name="sexo" value="0" checked="checked"/>F
                            <?php } else { ?>
                            <input type="radio" name="sexo" value ="1" checked="checked"/>M
                            <input type="radio" name="sexo" value="0" />F
                            <?php } ?>
                        </td>
                        <td><label>Telefono:</label></td>
                        <td>
                            <input type="text" name="telefono" onKeyPress="return numeroTelefonico(event);"
                            id="telefono" value="<?php if(isset ($this->datos[0]['TELEFONO_MOVIL']))echo $this->datos[0]['TELEFONO_MOVIL']?>"/>
                        </td>
                    </tr>
                    <tr>
                        <td><label>Email:</label></td>
                        <td>
                            <input type="email" name="email"
                            id="email" value="<?php if(isset ($this->datos[0]['EMAIL']))echo $this->datos[0]['EMAIL']?>"/>
                        </td>
                        <td><label>Fecha de Nacimiento:</label></td>
                        <td>
                            <input readonly="readonly" name="fecha_nacimiento" type="text"
                            id="fechanac" value="<?php echo $this->datos[0]['FECHA_NACIMIENTO'] ?>"/>
                        </td>
                    </tr>
                    <tr>
                        <!-- faltkkkkkkkkkkkkkkk-->
                        <td><label>Inst-Educativa:</label></td>
                        <td>
                        <select name="profesion" id="profesion">
                                <option></option>
                                <?php for($i=0;$i<count($this->datos_profesiones);$i++){ ?>
                                    <?php if( $this->datos[0]['IDPROFESION'] == $this->datos_profesiones[$i]['IDPROFESION'] ){ ?>
                                <option value="<?php echo $this->datos_profesiones[$i]['IDPROFESION'] ?>" selected="selected"><?php echo utf8_encode($this->datos_profesiones[$i]['DESCRIPCION']) ?></option>
                                    <?php } else { ?>
                                <option value="<?php echo $this->datos_profesiones[$i]['IDPROFESION'] ?>"><?php echo utf8_encode($this->datos_profesiones[$i]['DESCRIPCION']) ?></option>
                                    <?php } ?>
                                <?php } ?>
                            </select>
                        </td>

                    </tr>
                    <tr>
                        <td><label>Region:</label></td>
                        <td>
                <select placeholder="Seleccione..." class="regiones" id="regiones">
                    <?php if(isset ($this->datos)){ ?>
                        <?php for($i=0;$i<count($this->datos_regiones);$i++){ ?>
                            <?php if( $this->datos[0]['IDREGION'] == $this->datos_regiones[0]['IDUBIGEO'] ){ ?>
                        <option value="<?php echo $this->datos_regiones[$i]['IDUBIGEO'] ?>" selected="selected"><?php echo $this->datos_regiones[$i]['DESCRIPCION'] ?></option>
                            <?php } else { ?>
                        <option value="<?php echo $this->datos_regiones[$i]['IDUBIGEO'] ?>"><?php echo $this->datos_regiones[$i]['DESCRIPCION'] ?></option>
                            <?php } ?>
                        <?php } ?>
                    <?php }else{ ?>
                        <?php for($i=0;$i<count($this->datos_regiones);$i++){ ?>
                            <?php if( 1901 == $this->datos_regiones[$i]['IDUBIGEO'] ){ ?>
                        <option value="<?php echo $this->datos_regiones[$i]['IDUBIGEO'] ?>" selected="selected"><?php echo $this->datos_regiones[$i]['DESCRIPCION'] ?></option>
                            <?php } else { ?>
                        <option value="<?php echo $this->datos_regiones[$i]['IDUBIGEO'] ?>"><?php echo $this->datos_regiones[$i]['DESCRIPCION'] ?></option>
                            <?php } ?>
                        <?php } ?>
                    <?php } ?>
                    </select></td>
                        <td><label>Provincia:</label></td>
                        <td>

                <select placeholder="Seleccione..." required id="provincias" name="provincias" class="comboX">
                    <option></option>
                    <?php if(isset ($this->datos)){ ?>
                        <?php for($i=0;$i<count($this->datos_provincias);$i++){ ?>
                            <?php if( $this->datos[0]['IDPROVINCIA'] == $this->datos_provincias[$i]['IDUBIGEO'] ){ ?>
                        <option value="<?php echo $this->datos_provincias[$i]['IDUBIGEO'] ?>" selected="selected"><?php echo $this->datos_provincias[$i]['DESCRIPCION'] ?></option>
                            <?php } else { ?>
                        <option value="<?php echo $this->datos_provincias[$i]['IDUBIGEO'] ?>"><?php echo $this->datos_provincias[$i]['DESCRIPCION'] ?></option>
                            <?php } ?>
                        <?php } ?>
                    <?php }else{ ?>
                        <?php for($i=0;$i<count($this->datos_provincias);$i++){ ?>
                            <?php if( 1968 == $this->datos_provincias[$i]['IDUBIGEO'] ){ ?>
                        <option value="<?php echo $this->datos_provincias[$i]['IDUBIGEO'] ?>" selected="selected"><?php echo $this->datos_provincias[$i]['DESCRIPCION'] ?></option>
                            <?php } else { ?>
                        <option value="<?php echo $this->datos_provincias[$i]['IDUBIGEO'] ?>"><?php echo $this->datos_provincias[$i]['DESCRIPCION'] ?></option>
                            <?php } ?>
                        <?php } ?>
                    <?php } ?>
                </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label>Ciudad:</label></td>
                        <td>

                <select placeholder="Seleccione..." required name="ubigeo" id="ciudades" class="comboX">
                    <option></option>
                    <?php if(count($this->datos_ubigeos)){ ?>
                        <?php for($i=0;$i<count($this->datos_ubigeos);$i++){
                            if($i!=0){?>
                            <?php if( $this->datos[0]['IDUBIGEO'] == $this->datos_ubigeos[$i]['IDUBIGEO'] ){ ?>
                        <option value="<?php echo $this->datos_ubigeos[$i]['IDUBIGEO'] ?>" selected="selected"><?php echo $this->datos_ubigeos[$i]['DESCRIPCION'] ?></option>
                            <?php } else { ?>
                        <option value="<?php echo $this->datos_ubigeos[$i]['IDUBIGEO'] ?>"><?php echo $this->datos_ubigeos[$i]['DESCRIPCION'] ?></option>
                            <?php } ?>
                        <?php } }?>
                    <?php } ?>
                </select>
                        </td>
                    </tr>
                </table>
            
       
            </div>
      <div class="modal-footer">
            <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Ok</button>
        </div>
        </div>
        
    
  <!----->
    <!-- apoderados-->

  <div id="ventana-apoderado" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel"></h3>
        </div>
        <div class="modal-body text-justify">

            <caption><h3>Registo de Apoderado<span id="msg"></span></h3></caption>
              <form method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm">
            <input type="hidden" name="guardar" id="guardar" value="1"/>
            <input type="hidden" readonly="readonly" name="codigo" id="codigo"
                    value="<?php if(isset ($this->datos[0]['APODERADO_ID']))echo $this->datos[0]['APODERADO_ID']?>"/>
            
               <table align="center" cellpadding="10" >
                <tr>
                    <td><label>nombre</label></td>
                    <td>
                    <input type="text" name="nombre" onkeypress="return soloLetras(event)"
                            id="nombre" value="<?php if(isset ($this->datos[0]['NOMBRE']))echo $this->datos[0]['NOMBRE']?>"/></td>
                </tr>
                <tr>
                    <td><label>Apellido_Paterno</label></td>
                    <td>
                    <input type="text" name="apellido_paterno" onkeypress="return soloLetras(event)"
                            id="apellido_paterno" value="<?php if(isset ($this->datos[0]['APELLIDO_PATERNO']))echo $this->datos[0]['APELLIDO_PATERNO']?>"/></td>
                </tr>

                <tr>
                    <td><label>Apellido_Materno</label></td>
                    <td>
                    <input type="text" name="apellido_materno"
                            id="apellido_materno" value="<?php if(isset ($this->datos[0]['APELLIDO_MATERNO']))echo $this->datos[0]['APELLIDO_MATERNO']?>"/></td>
                </tr>
                <tr>
                    <td><label>Direccion</label></td>
                    <td>
                    <input type="text" name="direccion"
                            id="direccion" value="<?php if(isset ($this->datos[0]['DIRECCION']))echo $this->datos[0]['DIRECCION']?>"/></td>
                </tr>
                <tr>
                    <td><label>Ocupacion</label></td>
                    <td>
                    <input type="text" name="ocupacion"
                            id="ocupacion" value="<?php if(isset ($this->datos[0]['OCUPACION']))echo $this->datos[0]['OCUPACION']?>"/></td>
                </tr>
                <tr>
                    <td><label>Fecha Nacimiento</label></td>
                    <td>
                    <input type="text" name="fecha_nacimiento"
                            id="fecha_nacimiento" readonly="readonly" style="cursor: pointer"  value="<?php if(isset ($this->datos[0]['FECHA_NACIMIENTO']))echo $this->datos[0]['FECHA_NACIMIENTO']?>"/>
                    </td>
                </tr>

                <tr>
                    <td><label>DNI</label></td>
                    <td>
                    <input type="text" name="dni"
                            id="dni" value="<?php if(isset ($this->datos[0]['DNI']))echo $this->datos[0]['DNI']?>"/></td>
                </tr>
                <tr>
                    <td colspan="2" class="text-center">
                    <p><button type="button" class="btn btn-primary" id="save">Guardar</button>
                    <a href="<?php echo BASE_URL ?>apoderado" class="btn btn-info">Cancelar</a></p>
                    </td>
                </tr>
            </table>
        </form>


            </div>
      <div class="modal-footer">
            <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Ok</button>
        </div>
        </div>