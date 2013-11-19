$(function() {    
    $( "#fecha" ).focus();
    
    
     $('#fecha').datepicker({dateFormat: 'yy-mm-dd'});
    
    $( "#save" ).click(function(){
 
        bval = true;
        bval = bval && $("#fecha").required();
        bval = bval && $("#monto").required();
       
        if (bval) 
        {
            $("#frm").submit();
        }
        return false;
    });

   

 
   
});