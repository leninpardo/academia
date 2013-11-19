/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function soloNumeros(evt){
	evt = (evt) ? evt : event; //Validar la existencia del objeto event
	var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0)); //Extraer el codigo del caracter de uno de los diferentes grupos de codigos
	var respuesta = true; //Predefinir como valido
	if(charCode>31&&(charCode<48||charCode>57)){
		respuesta = false;
	}
	return respuesta;
}
function serieComprobante(evt){
	evt = (evt) ? evt : event; //Validar la existencia del objeto event
	var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0)); //Extraer el codigo del caracter de uno de los diferentes grupos de codigos
	var respuesta = true; //Predefinir como valido
	if(charCode>31&&(charCode<48||charCode>57) && charCode!=45){
		respuesta = false;
	}
	return respuesta;
}
function numeroTelefonico(evt){
        evt = (evt) ? evt : event; //Validar la existencia del objeto event
	var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0)); 
	var respuesta = true; //Predefinir como valido
	if(charCode>31&&(charCode<48||charCode>57) &&(charCode!=42&&charCode!=35&&charCode!=32&&charCode!=40&&charCode!=41&&charCode!=45)){
		respuesta = false;
	}
	return respuesta;
}
function soloLetras(e) {
        key = e.keyCode || e.which;
        tecla = String.fromCharCode(key).toLowerCase();
        letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
        especiales = [8,9,37,39,46];
        tecla_especial = false
        for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            } 
        }
 
        if(letras.indexOf(tecla)==-1 && !tecla_especial)
        return false;
}
function dosDecimales(e, field){
  key = e.keyCode ? e.keyCode : e.which
  // backspace
  if (key == 8) return true
  // 0-9
  if (key > 47 && key < 58) {
    if (field.value == "") return true
    regexp = /.[0-9]{2}$/
    return !(regexp.test(field.value))
  }
  // .
  if (key == 46) {
    if (field.value == "") return false
    regexp = /^[0-9]+$/
    return regexp.test(field.value)
  }
  // other key
  return false
}
function eliminar(url){
    if(confirm("Esta seguro que desea eliminar este registro")){
        href = url;
        window.location = href; // prueba1/modulos/eliminar/4
   
    } 
}
function editar(url){
    window.location = url;
}
function amortizar(url){
     if(confirm("Esta seguro que desea amortizar?")){
        href = url;
        window.location = href; // prueba1/modulos/eliminar/4

    } 
}

$(function() {
  $.fn.required = function() {
    if ( $(this).val() == '' || $(this).val() == 0 ) {
        $(this).css('border','solid 2px red');
        $('#msg').html('<label class="lbl_msg">Debes llenar todos los campos necesarios</label>');
        $(this).focus();
        return false;
    }else {
        $(this).css('border','solid 1px #ccc');
        $('#msg').html('');
        return true;
    }
  };
})