$(function() {    
    $( "#nombre" ).focus(); 
   $("#fecha_nacimiento").datepicker({
       yearRange: '-65:-10',dateFormat:'yy-mm-dd',changeMonth:true,changeYear:true,defaultDate: '1950-1-1'
       });
    $( "#save" ).click(function(){
        bval = true;   
//        bval = bval && $("#descripcion").required();
//        bval = bval && $("#url").required();
//        bval = bval && $("#modulo_padre").required();
        
        if (bval) 
        {
            $("#frm").submit();
        }
        return false;
    });
});