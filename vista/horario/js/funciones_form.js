
$(function() {    
    $( "#turno" ).focus(); 
    $( "#dia" ).focus(); 
    $( "#hora_inicio" ).focus(); 
    $( "#hora_fin" ).focus(); 
    $( "#save" ).click(function(){
        bval = true;   
        bval = bval && $("#turno").required();
        bval = bval && $("#dia").required();
        bval = bval && $("#hora_inicio").required();
        bval = bval && $("#hora_fin").required();
        
        if (bval) 
        {
            $("#frm").submit();
        }
        return false;
    }); 
});