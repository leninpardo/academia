    $(function(){
        $("#buscar").focus();
        function buscar(){
            $.post(url+'caja/buscador','cadena='+$("#buscar").val(),function(datos){
                HTML = '<table id="table" class="table table-striped table-bordered table-hover sortable">'+
                        '<thead>'+
                            '<tr>'+
                                '<th>Nro Caja</th>'+
                                '<th>Empleado</th>'+
                                '<th>Fecha</th>'+
                                '<th>Saldo</th>'+
                                 '<th>Estado</th>'+
                            '</tr>'+
                            '</thead>'+
                            '<tbody>';
                        

                for(var i=0;i<datos.length;i++){
                    
                    HTML = HTML + '<tr>';
                    HTML = HTML + '<td>'+datos[i][0]+'</td>';
                    HTML = HTML + '<td>'+datos[i][1]+'</td>';
                    HTML = HTML + '<td>'+datos[i][2]+'</td>';
                     HTML = HTML + '<td>'+datos[i][3]+'</td>';
                     if(datos[i][4]==1)
                         {
HTML = HTML + '<td> <a href="javascript:void(0)" onclick="cerrar('+datos[i][0]+')">Cerrar</td>';
                         }
                         if(datos[i][4]==2)
                             {
                                 
                             if(datos[i][2]==datos[i][5])
                                 {
 HTML = HTML + '<td> <a href="javascript:void(0)" onclick="reaperturar('+datos[i][0]+')">Reaperturar</td>';
                                 }
                                 else
                                     {
                             HTML = HTML + '<td>::::::</td>';
                                     }
                             }
                      
   
                    HTML = HTML + '</tr>';
                }
                HTML = HTML + '</tbody></table>'
                $("#grilla").html(HTML);
                $("#jsfoot").html('<script src="'+url+'vista/web/js/scriptgrilla.js"></script>');
                
                
            },'json');
        }
        $("#buscar").keyup(function(event){
          /* if(event.which == 13){
               buscar();
           }*/
            buscar();
             
        });
        
        $("#btn_buscar").click(function(){
            buscar();
            $("#buscar").focus();
        });
         $("#ap_caja").click(function(){
           
            $.post(url+'caja/aperturar',function(datos){
                if(datos==null)
                    {
                    alert("Error al aperturar");
                    }
                    else
                  {
             if(datos==2)
                 {
                     alert("Caja existente o pasada, cierre su caja");
                     // buscar();
                 }
                 else{
                     alert("La caja se aperturo");
                     buscar();
                 }
                  }
        },'json');
       
     ///////
     
   });





  });
        

   

     function cerrar(id)
{
   $.post(url+'caja/cerrar','caja='+id,function(datos){
       if(datos==1)
           {
   window.location="caja";
   }else{alert("Error a cerrar la caja");}
    //buscar();
   },'json');
}

function reaperturar(id)
{
   $.post(url+'caja/reaperturar','caja='+id,function(datos){
       if(datos==1)
           {
   window.location="caja";
   }else{alert("Error al reaperturar la caja");}
   },'json');

}