$(function() {    
 $("#fechanac").datepicker({yearRange: '-65:-10', dateFormat: 'dd-mm-yy', changeMonth: true, changeYear: true, defaultDate: '1-1-1990'}); 
 $("#fechanaca").datepicker({yearRange: '-65:-10', dateFormat: 'dd-mm-yy', changeMonth: true, changeYear: true, defaultDate: '1-1-1990'}); 
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
    
    
    $("#reg_alumno").click(function() {
        bval = true;
        bval = bval && $( "#nombre" ).required();   
        bval = bval && $( "#apellido_paterno" ).required();
        bval = bval && $( "#apellido_materno" ).required();
        bval = bval && $( "#dni" ).required(); 
        bval = bval && $( "#email" ).required();
        bval = bval && $( "#fechanac" ).required();
        bval = bval && $( "#institucion" ).required();
        bval = bval && $( "#provincias" ).required();
        bval = bval && $( "#ciudades" ).required();
        if (bval) {
            //$("#cliente").val("Cargando...");
            $.post(url + 'matricula/inserta_alu', 
            'nombre=' + $("#nombre").val() +
            '&apellido_paterno=' + $("#apellido_paterno").val() +
            '&apellido_materno=' + $("#apellido_materno").val()+ 
            '&dni=' + $("#dni").val()+
            '&sexo=' + $("#sexo").val()+
            '&telefono_movil=' + $("#telefono_movil").val()+
            '&email=' + $("#email").val()+
            '&fecha_nacimiento=' + $("#fechanac").val() +
            '&institucion=' + $("#institucion").val() +
            '&ubigeo=' + $("#ciudades").val(), function(datos) {
                //$("#id_cliente").val(datos.x_idcliente);
               // $("#cliente").val($("#nombre").val() + ' ' + $("#apellidos").val());
            //$("#nombre,#apellidos,#dni,#fechanac,#telefononat,#email,#estado_civil,#profesion,#ciudades,#direccion").val('');
            }, 'json');
            $('#modalNuevoAlumno').modal('hide');
        }
        return false;
    });
    
    $("#reg_apoderado").click(function() {
        bval = true;
       /* bval = bval && $( "#nombrea" ).required();   
        bval = bval && $( "#apellido_paternoa" ).required();
        bval = bval && $( "#apellido_maternoa" ).required();
        bval = bval && $( "#direccion" ).required(); 
        bval = bval && $( "#ocupacion" ).required();
        bval = bval && $( "#fechanaca" ).required();
        bval = bval && $( "#dni" ).required();*/
        if (bval) {
            //$("#cliente").val("Cargando...");
            $.post(url + 'matricula/inserta_apo', 
            'nombre=' + $("#nombrea").val() +
            '&apellido_paterno=' + $("#apellido_paternoa").val() +
            '&apellido_materno=' + $("#apellido_maternoa").val()+ 
            '&direccion=' + $("#direccion").val()+
            '&ocupacion=' + $("#ocupacion").val()+
            '&fecha_nacimiento=' + $("#fechanaca").val()+
            '&dni=' + $("#dnia").val(), function(datos) {
                //$("#id_cliente").val(datos.x_idcliente);
               // $("#cliente").val($("#nombre").val() + ' ' + $("#apellidos").val());
            //$("#nombre,#apellidos,#dni,#fechanac,#telefononat,#email,#estado_civil,#profesion,#ciudades,#direccion").val('');
            }, 'json');
            $('#modalNuevoApoderado').modal('hide');
        }
        return false;
    });
    
    
    
    
    
    $( "#descripcion" ).focus();
    
    
     $('#fecha_p').datepicker({dateFormat: 'yy-mm-dd'});
    
    $( "#save" ).click(function(){
        
         curs=$('#lista_cursos >tbody >tr').length;
        // cr=$('#cronograma >tbody >tr').length
         
         hor=$(".cliking:checked").length;
         //if(curs>0& cr>0)
            // {
        bval = true;
        bval = bval && $("#estudiante").required();
        bval = bval && $("#apoderado").required();
        bval = bval && $("#pago").required();
        
     
      if(curs>0&&hor>0)
          {
         

            
          }
          else
              {
               bval=false;
                 alert("Seleccion cursos,Genere Pagos o Asigne horarios");
              }
            // }
             /*else{
                
             }*/
       
        if (bval) 
        {
            $("#frm").submit();
        }
        return false;
    });
    $("#reserva").click(function(){
        $("#capa_cronograma").css("display", "block");
    });

   $("#cursos").change(function(){
       
    id=$("#cursos").val();
    if(id!="")
        {
    curso=$("#cursos option:selected").text();
    
  band=true;
 cont=0;
    $("#lista_cursos tbody tr").each(function(i,j){
        cont++;
                    id_e = $("#lista_cursos tr td:eq(0) :input").val();
                    
                      
                    if(id_e==id){band = false;}

                });
               
                if(band)
                    {
                        cont=cont;
                      html="<tr>";
                       html+="<td><input type='hidden' name='cursos_id[]' value='"+id+"'/>"+id+"</td>";
                     // html+="<td><input type='hidden' name='curso_id[]' id='curso_id[]' value='"+id+"' />"+id+"</td>";
                      html+="<td>"+curso+"</td><td>eliminar</td></tr>";
                      $("#lista_cursos").append(html);
                    }
                    else
                        {
                            alert("Este Curso fue Agregado")
                        }
        }
   });
/*$('#fecha_p').datetimepicker({
      language: 'pt-BR'
    });*/
 
 
   $("#add_cronograma").click(function(){
     fecha=$("#fecha_p").val();
     monto=$("#monto_p").val();
     
     bval = true;
      bval = bval && $("#fecha_p").required();
        bval = bval && $("#monto_p").required();
       item=$('#cronograma >tbody >tr').length;
       total=$("#total").val();
      
       
       if(total=="")
           {
                inicial=$("#pago").val();
                if(inicial==""){inicial=0;}
               total=inicial;
           }
        if(bval)
            {
                 band=true;
                 $("#cronograma tbody tr").each(function(){
                 
                    f= $("tbody tr td:eq(0) :input").val();
                

                    if(f==fecha){band = false;}

                });
                
               item=item+1;
                if(band)
                    {
                html="<tr>";
                html+="<td>"+item+"</td>";
                name="fecha_"+monto;
                  html+="<td><input type='hidden' name='"+name+"' value='"+fecha+"'/>"+fecha+"</td>";
           
                    html+="<td><input type='hidden' name='monto[]' value='"+monto+"'/>"+monto+"</td>";
                html+="</tr>";
                $("#cronograma").append(html);
                 $("#fecha_p").val("");
                 $("#monto_p").val("");
                tot= parseInt(total)+parseInt(monto);
                 $("#total").val(tot);
                    }
                    else{
                        alert("Fecha de pago fue Agregada anteriormente");
                    }
                
            }
   });
     
});