
$(function() {    
   
        $("#codigo_horario").change(function() {
        bval = true;
        if (bval) {
            $.post(url + 'asistencia/buscardatos','horario=' + $("#codigo_horario").val(), function(datos) {        
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
                    HTML = HTML + '<td><input type="hidden" name="codigo_matricula[]" value="'+datos[i].MATRICULA_ID+'">'+datos[i].MATRICULA_ID+'</td>';
                    HTML = HTML + '<td>'+datos[i].NOMBRE+'</td>';     
                    var id=datos[i].MATRICULA_ID;
                    HTML = HTML + '<td><input type="checkbox"  name="justificacion[]" id='+id+' value="1">';
                    if ($('.justificacion').attr('checked')) {
                      $(".justificacion").attr('value','0');
                    }
                   else {
                      $(".justificacion").attr('value','1');
                   }
                    HTML = HTML + '</td>';
                    HTML = HTML + '</tr>';
                }
                HTML = HTML + '</tbody></table>' 
               $("#grilla").html(HTML);
               $("#jsfoot").html('<script src="'+url+'vista/web/js/scriptgrilla.js"></script>');     
            }, 'json');
        }
        return false;
    });
   
  
});
