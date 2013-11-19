<div class="navbar-inner">
    <form method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm">
    <input type="hidden" name="guardar" id="guardar" value="1"/>
    <input type="hidden" readonly="readonly" name="codigo" id="codigo"
                value="<?php if(isset ($this->datos[0][0]))echo $this->datos[0][0]?>"/>
    <table align="center" cellpadding="10">
        <caption><h3><?php echo $this->titulo ?><span id="msg"></span></h3></caption>
        <tr>
            <td>Fecha Pago:</td>
            <td><input type="text" name="fecha" value="<?php  echo $this->data[0][1];?>" id="fecha"/></td>
        </tr>
          <tr>
            <td>Monto:</td>
            <td><input type="text" name="monto" value="<?php  echo $this->data[0][2];?>" id="monto"/></td>
        </tr>
        
           <tr>
            <td colspan="2" align="center">
                <p><button type="submit" class="btn btn-inverse" id="save">Guardar</button>
                <a href="<?php echo BASE_URL ?>amortizacion" class="btn btn-inverse">Cancelar</a></p>
            </td>
        </tr>
    </table>
</form>
</div>