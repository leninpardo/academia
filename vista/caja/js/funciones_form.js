$(function() {    
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