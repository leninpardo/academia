$(document).ready(function(){
    $( "#fecha_nacimiento" ).datepicker({yearRange: '-65:-10',dateFormat: 'dd-mm-yy',changeMonth:true,changeYear:true,defaultDate: '1-1-1990'});
    $( "#saveformnatural" ).click(function(){
        bval = true;        
        bval = bval && $( "#dni" ).required(); 
        bval = bval && $( "#nombre" ).required();   
        bval = bval && $( "#apellido_paterno" ).required();
        bval = bval && $( "#apellido_materno" ).required();
        bval = bval && $( "#email" ).required();
        bval = bval && $( "#fecha_nacimiento" ).required();
        bval = bval && $( "#institucion" ).required();
        bval = bval && $( "#provincias" ).required();
        bval = bval && $( "#ciudades" ).required();
        if ( bval ) {
            $("#frm_natural").submit();
        }
        return false;
    });  
    
    
    $("#regiones").change(function(){
        if(!$("#regiones").val()){
            $("#provincias").html('<option>Cargando...</option>');
            $("#ciudades").html('<option>Cargando...</option>');
        }else{
            $("#provincias").html('<option>Cargando...</option>');
            $("#ciudades").html('<option>Cargando...</option>');
            $.post(url+'alumno/get_provincias','idregion='+$("#regiones").val(),function(datos){
            $("#provincias").html('<option></option>');
            $("#ciudades").html('<option></option>');
                for(var i=0;i<datos.length;i++){
                    $("#provincias").append('<option value="'+ datos[i].UBIGEO_ID + '">' + datos[i].DESCRIPCION+ '</option>');
                }
            },'json');
        }
    });
    
  
    $("#provincias").change(function(){
        if(!$("#provincias").val()){
            $("#ciudades").html('<option></option>');
        }else{
            $("#ciudades").html('<option>Cargando...</option>');
            $.post(url+'alumno/get_ciudades','idprovincia='+$("#provincias").val(),function(datos){
                $("#ciudades").html('<option></option>');
                for(var i=0;i<datos.length;i++){
                    if(i!=0){
                        $("#ciudades").append('<option value="'+ datos[i].UBIGEO_ID + '">' + datos[i].DESCRIPCION+ '</option>');
                    }
                }       
            },'json');
        }
    });
    
    /*
    //valida existencia de cliente
    $("#dni").blur(function(){
        if($(this).val()!='' && $(this).val().length==8){
            $.post(url+'alumno/buscador','cadena='+$("#dni").val()+'&filtro=2',function(datos){

                if(datos.length>0){
                    if(confirm('Ya existe un alumno con este Nro de DNI...\nDesea editar sus datos?')){
                        window.location = url+'alumno/editar/'+datos[0].ALUMNO_ID
                    }else{
                        window.location = url+'alumno/';
                    }
                }   
            },'json');
        }
    });*/
    
    
}); 
        
