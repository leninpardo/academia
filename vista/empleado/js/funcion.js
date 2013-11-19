    $(function(){
        $("#buscar").focus();
        function buscar(){
            $.post(url+'empleado/buscador','cadena='+$("#buscar").val(),function(datos){
                HTML = '<table id="table" class="table table-striped table-bordered table-hover sortable">'+
                        '<thead>'+
                            '<tr>'+
                                '<th>Item</th>'+
                                '<th>Nombres</th>'+
                                '<th>Apellidos</th>'+
                                '<th>Usuario</th>'+
                                '<th>Perfil</th>'+
                                '<th>Acciones</th>'+
                            '</tr>'+
                            '</thead>'+
                            '<tbody>';

                for(var i=0;i<datos.length;i++){
                    HTML += '<tr>';
                    HTML += '<td>'+(i+1)+'</td>';
                    HTML += '<td>'+datos[i][1]+'</td>';
                    HTML += '<td>'+datos[i][2]+'</td>';
                    HTML += '<td>'+datos[i][3]+'</td>';
                    HTML += '<td>'+datos[i][4]+'</td>';
                    var editar=url+'empleado/editar/'+datos[i][0]; 
                    var eliminar=url+'empleado/eliminar/'+datos[i][0];   
                    HTML += '<td><a style="margin-right:4px" href="#myModal" role="button" data-toggle="modal" onclick="ver(\''+datos[i].ID_EMPLEADO+'\')" class="btn btn-warning"><i class="icon-eye-open icon-white"></i> Ver</a>';
                    HTML += '<a style="margin-right:4px" href="javascript:void(0)" onclick="editar(\''+editar+'\')" class="btn btn-success"><i class="icon-pencil icon-white"></i> Editar</a>';
                    HTML += '<a href="javascript:void(0)" onclick="eliminar(\''+eliminar+'\')"class="btn btn-danger"><i class="icon-remove icon-white"></i> Eliminar</a>';
                    HTML += '</td>';
                    HTML += '</tr>';
                }
                HTML += '</tbody></table>'
                $("#grilla").html(HTML);
                $("#jsfoot").html('<script src="'+url+'vista/web/js/scriptgrilla.js"></script>');
            },'json');
        }
        $("#buscar").keypress(function(event){
           
               buscar();
           
        });
        
        $("#btn_buscar").click(function(){
            buscar();
            $("#buscar").focus();
        });
        
    });
    function ver(id){
            $("#myModalLabel").html('');
            $("#bodymodal").html('<div class="text-center"><img src="'+url+'lib/img/loading.gif" /></div>');
            html='';titulo='';
           $.post(url+'empleado/ver','id='+id,function(datos){
                titulo= 'Empleado: '+datos[0]['NOMBRE']+' '+datos[0]['APELLIDO'];
                html+='<table align="center" cellpadding="10">';
                html+= '<tr>';
                html+= '<td>Direccion:</td>';
                html+= '<td>'+datos[0]['DIRECCION']+'</td>';
                html+= '</tr>';
                if(datos[0]['TELEFONO'] != null && datos[0]['TELEFONO'] != ' ' && datos[0]['TELEFONO'] != ''){
                html+= '<tr>';
                html+= '<td>Telefono:</td>';
                html+= '<td>'+datos[0]['TELEFONO']+'</td>';
                html+= '</tr>';
                }
                html+= '<tr>';
                html+= '<td>Dni:</td>';
                html+= '<td>'+datos[0]['DNI']+'</td>';
                html+= '</tr>';
                html+= '<tr>';
                html+= '<td>Fecha de Nacimiento:</td>';
                html+= '<td>'+datos[0]['FECHANACIMIENTO']+'</td>';
                html+= '</tr>';
                html+= '<tr>';
                html+= '<td>Estado Civil:</td>';
                html+= '<td>'+datos[0]['ESTADOCIVIL']+'</td>';
                html+= '</tr>';
                html+= '</table>';
                $("#myModalLabel").html(titulo);
                $("#bodymodal").html(html);
           },'json');
       }
