
$(function() {    
    $( "#nombre_curso" ).focus(); 
    $( "#save" ).click(function(){
        bval = true;   
        bval = bval && $("#nombre_curso").required();
        
        if (bval) 
        {
            $("#frm").submit();
        }
        return false;
    }); 
});