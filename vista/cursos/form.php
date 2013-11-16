<div class="navbar-inner">
        <form method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm">
            <input type="hidden" name="guardar" id="guardar" value="1"/>
            <input type="hidden" readonly="readonly" name="codigo" id="codigo"
                    value="<?php if(isset ($this->datos[0]['CURSOS_ID']))echo $this->datos[0]['CURSOS_ID']?>"/>
            <table align="center" cellpadding="10" >
                <caption><h3><?php echo $this->titulo ?><span id="msg"></span></h3></caption>
                <tr>
                    <td><label>Nombre Cursos</label></td>
                    <td>
                    <input type="text" name="nombre_curso" onkeypress="return soloLetras(event)"
                            id="nombre_curso" value="<?php if(isset ($this->datos[0]['NOMBRE_CURSO']))echo $this->datos[0]['NOMBRE_CURSO']?>"/></td>
                </tr>
                <tr>
                    <td colspan="2" class="text-center">
                    <p><button type="button" class="btn btn-primary" id="save">Guardar</button>
                    <a href="<?php echo BASE_URL ?>cursos" class="btn btn-info">Cancelar</a></p>
                    </td>
                </tr>
            </table>
        </form>