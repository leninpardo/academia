
$(function() {    
   
    $( "#save" ).click(function(){
       
        bval = true;   
        bval = bval && $("#codigo_matricula").required();
        if (bval) 
        {
            $("#frm").submit();
        }
        return false;
    }); 
});