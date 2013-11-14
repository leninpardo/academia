/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

   /* $(function(){
        $("#myModalLabel2").html('Descarga la Aplicación Android de GHBus');
        $("#bodymodal2").html('<div class="text-center"><img src="'+url+'lib/img/androidghbus.jpg" /></div>');
        $('#myModal2').css("top","3%");
        $('#myModal2 .modal-body').css("max-height","490px");
        $('#myModal2').modal('show');
    });*/

function ver_info(id){
    $("#myModalLabel").html('');
    $("#bodymodal1").html('<div class="text-center"><img src="'+url+'lib/img/loading.gif" /></div>');
    tit = "", cont = "";
    if(id==1){
        tit = "LUGAR HERMOSO DE TIOYACU ";
        cont = "<img src='"+url+"lib/img/1.jpg' alt='' style='float:left; padding: 0 15px 15px 0' />La Naciente de Tío Yacu, es uno de los lugares más concurridos en el Alto Mayo,muchos atribuyen a sus aguas propiedades curativas. Tío Yacu nace de entre las rocas en medio de la exuberante vegetación.El recreo turístico Tío Yacu, se encuentra muy cerca de Rioja, a tan sólo 15 minutos de esta ciudad, en el poblado de Segunda Jerusalén. Su principal atractivo es la naciente de este rio de aguas cristalinas, se puede observar como el agua brota de entre las rocas, formando diversas cascadas y una piscina natural donde podrás tomar un relajante baño. El agua fría de este rio es ideal para revitalizar el cuerpo y activar la circulación sanguínea";
    }
    if(id==2){
        tit = "Ciudad de la Eterna Primavera";
        cont = "<img src='"+url+"lib/img/2.jpg' alt='' style='float:left; padding: 0 15px 15px 0' />La ciudad de Trujillo es la capital del departamento de La Libertad, llamada la Ciudad de la Eterna Primavera , fundada por el conquistador español Diego de Almagro el 6 de diciembre de 1534, ubicada a poca distancia de Chan Chan la capital de la nación Chimú, sobre un valle de gran hegemonía de culturas prehispánicas y muy cerca del mar. Muy cerca de la ciudad encontrará numerosos y maravillosos centros arqueológicos, herencia de más de 12 mil años de historia de pueblos peruanos de las culturas Cupisnique, Salinar, Virú, Mochica y Chimú, destacando la ciudadela de Chan Chan, declarada Patrimonio Cultural de la Humanidad por UNESCO.";
    }
    if(id==3){
        tit = "Chachapoyas";
        cont = "<img src='"+url+"lib/img/3.jpg' alt='' style='float:left; padding: 0 15px 15px 0' />Chachapoyas es el nombre que tiene tanto la provincia como la ciudad capital de esta, que se encuentran en la región del Amazonas. El nombre de Chachapoyas tiene su origen en la cultura que años atrás se asentara en el lugar y cuyo nombre significara Hombres de Neblina, una ciudad de amplias casonas, con techos de tejas, grandes patios, rodeado de huertos, jardines y vistosos balcones, debido a su influencia hispana. Si estás cansado de la rutina de la cuidad y buscas relajarte disfrutando de paisajes únicos, te recomendamos visitar esta catarata, ubicada en la región Amazonas.";
    }
    if(id==4){
        tit = "Chiclayo";
        cont = "<img src='"+url+"lib/img/4.jpg' alt='' style='float:left; padding: 0 15px 15px 0' />Chiclayo conocida como “La Ciudad de la Amistad” durante la época colonial fue una simple villa de indios y mestizos en el camino que unía Lambayeque con Zaña, fundada en 1720 con el nombre de Santa María de los Valles de Chiclayo. Carece de construcciones coloniales, pero es magnificado por los recientes y espectaculares descubrimientos arqueológicos como el Señor de Sipán en Huaca Rajada, el Señor de Sicán en Batán Grande y la puesta en valor de las pirámides de Túcume.";
    }
    if(id==5){
        tit = "Castillo de Lamas";
        cont = "<img src='"+url+"lib/img/5.png' alt='' style='float:left; padding: 0 15px 15px 0' />La ciudad de Lamas, capital folclórica de la región San Martín, conocida por la etnia de los quechuas lamistas, ahora cuenta con un nuevo atractivo turístico, se trata del Castillo de Lamas. Su arquitectura ha sido diseñada en base a piedra natural, la misma que ha sido moldeada a mano, convirtiéndose en el único castillo de la región San Martín. Su estructura consta de cinco niveles, en cada piso tiene sus miradores, lugares desde donde se puede apreciar la ciudad de Lamas y el paisaje que va hacia el río Mayo y Tarapoto.";
    }
    if(id==6){
        tit = "La Ciudad de las Palmeras";
        cont = "<img src='"+url+"lib/img/6.png' alt='' style='float:left; padding: 0 15px 15px 0' />Tarapoto llamada también “Ciudad de las Palmeras” por dichas plantas que crecen en la zona; es una ciudad de progreso y desarrollo, cuya población tiene el sentimiento de surgir y salir adelante, está provista de una cultura y una historia extraordinaria, es diferente a las demás; aparte de un clima agradable, de paisajes impresionantes, destacan la amabilidad de su gente, su tranquilidad, los excelentes potajes, entre otras características que dan distinción a este bello “paraje” de la Amazonía Ofrece una gran variedad de hoteles y hostales tanto en la ciudad como en sus alrededores para el turista y la persona de negocios. Disfrute de los hermosos paisajes, de la flora, de la fauna, nuestras cataratas y del turismo de aventura (canotaje, white water rafting, expediciones y caminatas). En la ciudad de las palmeras podrá degustar gran variedad de comidas típicas y tragos exóticos.";
    }
    
    $("#myModalLabel").html(tit);
    $("#bodymodal1").html(cont);

}
