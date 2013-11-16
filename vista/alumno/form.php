
<div class="navbar-inner text-center">
    <h3><?php echo $this->titulo ?><span id="msg"></span></h3>
    
    <form method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm_natural">
        <input type="hidden" name="guardar" id="guardar" value="1"/>
        <input type="hidden" name="tipo_cliente" value="natural"/>
        <input type="hidden" name="codigo" id="codigo"
               value="<?php if(isset ($this->datos[0]['ALUMNO_ID']))echo $this->datos[0]['ALUMNO_ID']?>"/>
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
        <table align="center">
            <tr>
                <td align="center">
                    <p>
                        <button type="button" class="btn btn-primary" id="saveformnatural">Guardar</button>
                        <a href="<?php echo BASE_URL ?>alumno" class="btn btn-info cancel">Cancelar</a>
                    </p>
                </td>
            </tr>
        </table>
    </form>
</div>

