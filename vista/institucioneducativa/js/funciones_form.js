
$(function() {    
    $( "#nombre").focus(); 
    $( "#curricula" ).focus(); 
    $( "#telefono_fijo" ).focus(); 
    $( "#direccion" ).focus(); 
    $( "#save" ).click(function(){
        bval = true;   
        bval = bval && $("#nombre").required();
        bval = bval && $("#curricula").required();
        bval = bval && $("#telefono_fijo").required();
        bval = bval && $("#direccion").required();
        
        if (bval) 
        {
            $("#frm").submit();
        }
        return false;
    }); 
});