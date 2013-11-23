<div class="navbar-inner">
        <form method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm">
            <input type="hidden" name="guardar" id="guardar" value="1"/>
            <input type="hidden" readonly="readonly" name="codigo" id="codigo"
                    value="<?php if(isset ($this->datos[0]['HORARIO_ID']))echo $this->datos[0]['HORARIO_ID']?>"/>
            <table align="center" cellpadding="10" >
                <caption><h3><?php echo $this->titulo ?><span id="msg"></span></h3></caption>
                <tr>
                    <td><label>turno</label></td>
                    <td>
                    <input type="text" name="turno" onkeypress="return soloLetras(event)"
                            id="turno" value="<?php if(isset ($this->datos[0]['TURNO']))echo $this->datos[0]['TURNO']?>"/></td>
                </tr>
                <tr>
                    <td><label>dia</label></td>
                    <td>
                    <input type="text" name="dia" onkeypress="return soloLetras(event)"
                            id="dia" value="<?php if(isset ($this->datos[0]['DIA']))echo $this->datos[0]['DIA']?>"/></td>
                </tr>
                
                <tr>
                    <td><label>hora_inicio</label></td>
                    <td>
                    <input type="text" name="hora_inicio" 
                            id="hora_inicio" value="<?php if(isset ($this->datos[0]['HORA_INICIO']))echo $this->datos[0]['HORA_INICIO']?>"/></td>
                </tr>
                <tr>
                    <td><label>hora_final</label></td>
                    <td>
                    <input type="text" name="hora_fin" 
                            id="hora_fin" value="<?php if(isset ($this->datos[0]['HORA_FIN']))echo $this->datos[0]['HORA_FIN']?>"/></td>
                </tr>
                <tr>
                    <td colspan="2" class="text-center">
                    <p><button type="button" class="btn btn-inverse" id="save">Guardar</button>
                    <a href="<?php echo BASE_URL ?>horario" class="btn btn-inverse">Cancelar</a></p>
                    </td>
                </tr>
            </table>
        </form>