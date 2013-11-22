    $(function(){
        $( "#buscar" ).focus();
        
        function buscar(){
            $.post(url+'asistencia/buscador','cadena='+$("#buscar").val(),function(datos){
                HTML = '<table id="table" class="table table-striped table-bordered table-hover sortable">'+
                            '<thead>'+
                            '<tr>'+
                                '<th>codigo_matricula</th>'+
                                '<th>Nombre</th>'+
                                '<th>Justificacion</th>'+
                            '</tr>'+
                            '</thead>'+
                            '<tbody>';

                for(var i=0;i<datos.length;i++){
                    HTML = HTML + '<tr>';

                    HTML = HTML + '<td>'+datos[i][0]+'</td>';
                    HTML = HTML + '<td>'+datos[i][3]+" "+datos[i][4]+" "+datos[i][5]+'</td>';
                    var id=datos[i][0]; 
                    HTML += '<td><input type="checkbox"     name="justificacion" id='+id+' value="1">';
                    HTML = HTML + '</td>';
                    HTML = HTML + '</tr>';
                }
                HTML = HTML + '</tbody></table>'
                $("#grilla").html(HTML);
                $("#jsfoot").html('<script src="'+url+'vista/web/js/scriptgrilla.js"></script>');
            },'json');
        }
        $("#buscar").keyup(function(event){
         
               buscar();
           
        });
        
        $("#btn_buscar").click(function(){
            buscar();
            $("#buscar").focus();
        });
        
       
    });