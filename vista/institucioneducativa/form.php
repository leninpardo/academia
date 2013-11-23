<div class="navbar-inner">
        <form method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm">
            <input type="hidden" name="guardar" id="guardar" value="1"/>
            <input type="hidden" readonly="readonly" name="codigo" id="codigo"
                    value="<?php if(isset ($this->datos[0]['INSTITUCIONEDUCATIVA_ID']))echo $this->datos[0]['INSTITUCIONEDUCATIVA_ID']?>"/>
            <table align="center" cellpadding="10" >
                <caption><h3><?php echo $this->titulo ?><span id="msg"></span></h3></caption>
                 <tr>
                    <td><label>nombre</label></td>
                    <td>
                    <input type="text" name="nombre" onkeypress="return soloLetras(event)"
                            id="nombre" value="<?php if(isset ($this->datos[0]['NOMBRE']))echo $this->datos[0]['NOMBRE']?>"/></td>
                </tr>
                <tr>
                    <td><label>curricula</label></td>
                    <td>
                    <input type="text" name="curricula" 
                            id="curricula" value="<?php if(isset ($this->datos[0]['CURRICULA']))echo $this->datos[0]['CURRICULA']?>"/></td>
                </tr>
                <tr>
                    <td><label>telefono_fijo</label></td>
                    <td>
                    <input type="text" name="telefono_fijo" 
                            id="telefono_fijo" value="<?php if(isset ($this->datos[0]['TELEFONO_FIJO']))echo $this->datos[0]['TELEFONO_FIJO']?>"/></td>
                </tr>
                
                <tr>
                    <td><label>direccion</label></td>
                    <td>
                    <input type="text" name="direccion" 
                            id="direccion" value="<?php if(isset ($this->datos[0]['DIRECCION']))echo $this->datos[0]['DIRECCION']?>"/></td>
                </tr>

                <tr>
                    <td colspan="2" class="text-center">
                    <p><button type="button" class="btn btn-inverse" id="save">Guardar</button>
                    <a href="<?php echo BASE_URL ?>institucioneducativa" class="btn btn-inverse">Cancelar</a></p>
                    </td>
                </tr>
            </table>
        </form>