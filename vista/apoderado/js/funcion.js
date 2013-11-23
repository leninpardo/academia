    $(function(){
        $( "#buscar" ).focus();
        
        function buscar(){
            $.post(url+'apoderado/buscador','cadena='+$("#buscar").val(),function(datos){
                HTML = '<table id="table" class="table table-striped table-bordered table-hover sortable">'+
                        '<thead>'+
                            '<tr>'+
                                '<th>Item</th>'+
                                '<th>Nombre</th>'+
                                '<th>Apellido_paterno</th>'+
                                '<th>Apellido_materno</th>'+
                                '<th>Direccion</th>'+
                                '<th>Ocupacion</th>'+
                                '<th>Fecha_nacimiento</th>'+
                                '<th>DNI</th>'+
                                '<th>Acciones</th>'+
                            '</tr>'+
                            '</thead>'+
                            '<tbody>';

                for(var i=0;i<datos.length;i++){
                    HTML = HTML + '<tr>';
                    HTML = HTML + '<td>'+(i+1)+'</td>';
                    HTML = HTML + '<td>'+datos[i][1]+'</td>';
                    HTML = HTML + '<td>'+datos[i][2]+'</td>';
                    HTML = HTML + '<td>'+datos[i][3]+'</td>';
                    HTML = HTML + '<td>'+datos[i][4]+'</td>';
                    HTML = HTML + '<td>'+datos[i][5]+'</td>';
                    HTML = HTML + '<td>'+datos[i][6]+'</td>';
                    HTML = HTML + '<td>'+datos[i][7]+'</td>';
                    var editar=url+'apoderado/editar/'+datos[i][0];
                    var eliminar=url+'apoderado/eliminar/'+datos[i][0];  
                    HTML = HTML + '<td><a style="margin-right:4px" href="javascript:void(0)" onclick="editar(\''+editar+'\')" class="btn btn-warning"><i class="icon-pencil icon-white"></i> Editar</a>';
                    HTML = HTML + '<a href="javascript:void(0)" onclick="eliminar(\''+eliminar+'\')" class="btn btn-danger"><i class="icon-remove icon-white"></i> Eliminar</a>';
                    HTML = HTML + '</td>';
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
        
    });