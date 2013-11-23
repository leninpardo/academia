<div class="navbar-inner">
        <form method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm">
            <input type="hidden" name="guardar" id="guardar" value="1"/>
            <input type="hidden" readonly="readonly" name="codigo" id="codigo"
                    value="<?php if(isset ($this->datos[0]['APODERADO_ID']))echo $this->datos[0]['APODERADO_ID']?>"/>
            <table align="center" cellpadding="10" >
                <caption><h3><?php echo $this->titulo ?><span id="msg"></span></h3></caption>
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
                     <input readonly="readonly" name="fecha_nacimiento" type="text"
                     id="fechanac" value="<?php echo $this->datos[0]['FECHA_NACIMIENTO'] ?>"/>
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
                    <p><button type="button" class="btn btn-inverse" id="save">Guardar</button>
                    <a href="<?php echo BASE_URL ?>apoderado" class="btn btn-inverse">Cancelar</a></p>
                    </td>
                </tr>
            </table>
        </form>