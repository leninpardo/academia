<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<div class="navbar-inner">
    <form method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm">
    <input type="hidden" name="guardar" id="guardar" value="1"/>
    <input type="hidden" readonly="readonly" name="codigo" id="codigo"
                value="<?php if(isset ($this->datos[0][0]))echo $this->datos[0][0]?>"/>
    <table align="center" cellpadding="10">
        <caption><h3><?php echo $this->titulo ?><span id="msg"></span></h3></caption>
        <tr>
            <td>
               fecha inicio:
            </td>
            <td>
                      <div class="well">
                    <input class="span2"  id="fecha_ini" type="text" name="fecha_ini">
                      </div> 
            </td>
             <td>
               Fecha final:
            </td>
            
            <td>
                       <div class="well">
                    <input class="span2"  id="fecha_final" type="text" name="fecha_final">
                     </div>
            </td>
        <tr>
            
            
            <td>
                <input type="submit" name="generar" name="generar" value="generar"/>
            </td>
        </tr>
        </tr>
    </table>
    </form>
    
