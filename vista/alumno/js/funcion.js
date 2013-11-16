    $(function(){
        $( "#buscar" ).focus();
        
        function buscar(){
            $.post(url+'alumno/buscador','cadena='+$("#buscar").val()+'&filtro='+$("#filtro").val(),function(datos){
                HTML = '<table id="table" class="table table-striped table-bordered table-hover sortable">'+
                            '<thead>'+
                            '<tr>'+
                                '<th>Item</th>'+
                                '<th>Tipo</th>'+
                                '<th>Nombre y Apellidos / Razon Social</th>'+
                                '<th>DNI / RUC</th>'+
                                '<th>Direccion</th>'+
                                '<th>Acciones</th>'+
                            '</tr>'+
                            '</thead>'+
                            '<tbody>';

                for(var i=0;i<datos.length;i++){
                    HTML = HTML + '<tr>';

                    HTML = HTML + '<td>'+(i+1)+'</td>';
                    HTML = HTML + '<td>'+datos[i].TIPO+'</td>';
                    var nombres = datos[i].NOMBRES;
                    var cliente = '';
                    if(datos[i].APELLIDOS!=null){
                        cliente = nombres+' '+datos[i].APELLIDOS;
                    }else{
                        cliente = nombres;
                    }
                    HTML = HTML + '<td>'+cliente+'</td>';
                    HTML = HTML + '<td>'+datos[i].DOCUMENTO+'</td>';
                    HTML = HTML + '<td>'+datos[i].DIRECCION+'</td>';
                    var editar=url+'cliente/editar/'+datos[i].IDCLIENTE; 
                    HTML += '<td><a style="margin-right:4px" href="#myModal" role="button" data-toggle="modal" onclick="ver(\''+datos[i].IDCLIENTE+'\')" class="btn btn-warning"><i class="icon-eye-open icon-white"></i> Ver</a>';
                    HTML += '<a href="javascript:void(0)" onclick="editar(\''+editar+'\')" class="btn btn-success"><i class="icon-pencil icon-white"></i> Editar</a>';
                    HTML = HTML + '</td>';
                    HTML = HTML + '</tr>';
                }
                HTML = HTML + '</tbody></table>'
                $("#grilla").html(HTML);
                $("#jsfoot").html('<script src="'+url+'vista/web/js/scriptgrilla.js"></script>');
            },'json');
        }
        $("#buscar").keypress(function(event){
           if(event.which == 13){
               buscar();
           } 
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
           $.post(url+'alumno/ver','idalumno='+id,function(datos){
                    titulo= 'alumno: '+datos[0]['NOMBRE']+' '+datos[0]['APELLIDO_PATERNO'];
                    html+='<table align="center" cellpadding="10">';
                    html+= '<tr>';
                    html+= '<td>Nombres:</td>';
                    html+= '<td>'+datos[0]['NOMBRE']+'</td>';
                    html+= '</tr>';
                    html+= '<tr>';
                    html+= '<td>Apellidos:</td>';
                    html+= '<td>'+datos[0]['APELLIDO_PATERNO']+' '+datos[0]['APELLIDO_MATERNO']+'</td>';
                    html+= '</tr>';
                    html+= '<tr>';
                    html+= '<td>Nro.de Documento:</td>';
                    html+= '<td>'+datos[0]['DNI']+'</td>';
                    html+= '</tr>';
                    html+= '<tr>';
                    html+= '<td>Institucion Educativa</td>';
                    html+= '<td>'+datos[0]['INSTITUCION']+'</td>';
                    html+= '</tr>';
                    html+= '<tr>';
                    html+= '<td>Sexo:</td>';
                    if(datos[0]['SEXO']==0){
                        html+= '<td>Femenino</td>';
                    }
                    else{
                        html+= '<td>Masculino</td>';
                    }
                    html+= '</tr>'
                    if(datos[0]['TELEFONO_MOVIL'] != null && datos[0]['TELEFONO_MOVIL'] != ' ' && datos[0]['TELEFONO_MOVIL'] != ''){
                    html+= '<tr>';
                    html+= '<td>Telefono:</td>';
                    html+= '<td>'+datos[0]['TELEFONO_MOVIL']+'</td>';
                    html+= '</tr>';
                    }
                    if(datos[0]['EMAIL'] != null && datos[0]['EMAIL'] != ' ' && datos[0]['EMAIL'] != ''){
                    html+= '<tr>';
                    html+= '<td>Email:</td>';
                    html+= '<td>'+datos[0]['EMAIL']+'</td>';
                    html+= '</tr>';
                    }
                    if(datos[0]['FECHA_NACIMIENTO'] != null && datos[0]['FECHA_NACIMIENTO'] != ' ' && datos[0]['FECHA_NACIMIENTO'] != ''){
                    html+= '<tr>';
                    html+= '<td>Fecha de Nacimiento:</td>';
                    html+= '<td>'+datos[0]['FECHA_NACIMIENTO']+'</td>';
                    html+= '</tr>';
                    }
                    if(datos[0]['PROFESION'] != null && datos[0]['PROFESION'] != ' ' && datos[0]['PROFESION'] != ''){
                    html+= '<tr>';
                    html+= '<td>Profesion:</td>';
                    html+= '<td>'+datos[0]['PROFESION']+'</td>';
                    html+= '</tr>';
                    }
                    if(datos[0]['ESTADO_CIVIL'] != null && datos[0]['ESTADO_CIVIL'] != ' ' && datos[0]['ESTADO_CIVIL'] != ''){
                    html+= '<tr>';
                    html+= '<td>Estado Civil:</td>';
                    html+= '<td>'+datos[0]['ESTADO_CIVIL']+'</td>';
                    html+= '</tr>';
                    }
                    if(datos[0]['REGION'] != null && datos[0]['REGION'] != ' ' && datos[0]['REGION'] != ''){
                    html+= '<tr>';
                    html+= '<td>Región:</td>';
                    html+= '<td>'+datos[0]['REGION']+'</td>';
                    html+= '</tr>';
                    }
                    if(datos[0]['PROVINCIA'] != null && datos[0]['PROVINCIA'] != ' ' && datos[0]['PROVINCIA'] != ''){
                    html+= '<tr>';
                    html+= '<td>Provincia:</td>';
                    html+= '<td>'+datos[0]['PROVINCIA']+'</td>';
                    html+= '</tr>';
                    }
                    if(datos[0]['UBIGEO'] != null && datos[0]['UBIGEO'] != ' ' && datos[0]['UBIGEO'] != ''){
                    html+= '<tr>';
                    html+= '<td>Ciudad:</td>';
                    html+= '<td>'+datos[0]['UBIGEO']+'</td>';
                    html+= '</tr>';
                    }
               
           
               html+= '</table>';
                $("#myModalLabel").html(titulo);
                $("#bodymodal").html(html);
           },'json');
       }
