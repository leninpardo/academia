    $(function(){
        $("#buscar").focus();
        function buscar(){
            $.post(url+'contabilidad/buscador','cadena='+$("#buscar").val(),function(datos){
                HTML = '<table id="table" class="table table-striped table-bordered table-hover sortable">'+
                        '<thead>'+
                            '<tr>'+
                                '<th>Nro Asiento</th>'+
                                '<th>Descripcion</th>'+
                                
                            '</tr>'+
                            '</thead>'+
                            '<tbody>';
                        

                for(var i=0;i<datos.length;i++){
                    
                    HTML = HTML + '<tr>';
                    HTML = HTML + '<td>'+datos[i][0]+'</td>';
                    HTML = HTML + '<td>'+datos[i][1]+'</td>';  
   
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
        
        
       
     ///////
     
   });





        

   

    