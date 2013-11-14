<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
<script type="text/javascript" src="http://coneisc.pe//assets/js/gmaps.js"></script>
<script type="text/javascript" src="http://hpneo.github.io/gmaps/prettify/prettify.js"></script>
<link href='http://hpneo.github.io/gmaps/prettify/prettify.css' rel='stylesheet' type='text/css' />

<style type="text/css">
    .popin{
        background:#fff;
        padding:15px;
        box-shadow: 0 0 20px #999;
        border-radius:2px;
        width: 90%;
    }
    #map {
        height:400px;

    }
    #filtro{
        top:0;
        right:0;
        width:200px;
    }
    .overlay{
        text-align: match-parent;
        color:#fff;
        font-size:17px;
        opacity:0.8;
        background:#4477aa;
        border:solid 3px #336699;
        border-radius:4px;
        box-shadow:2px 2px 10px #333;
        text-shadow:1px 1px 1px #666;
        padding:0 4px;
    }
    .overlay_arrow{
        left:50%;
        margin-left:-18px;
        width:0;
        height:0;
        position:absolute;
    }
    .overlay_arrow.above{
        bottom:-15px;
        border-left:16px solid transparent;
        border-right:16px solid transparent;
        border-top:16px solid #336699;
    }
</style>
<script type="text/javascript">
        var map;
        $(document).ready(function(){
            
            // alert(json.result_id[1].latitud);
            map = new GMaps({
                div: '#map',
                lat: -6.481924,
                lng: -76.377278,
                enableNewStyle: true,
                zoom: 15
            });
            map.addMarker({
                lat: -6.481924,
                lng: -76.377278,
                icon:'http://icons.iconarchive.com/icons/icons-land/vista-map-markers/32/Map-Marker-Marker-Outside-Azure-icon.png',
                title: 'GHBus Tarapoto',
                click: function(e) {
                        
                },
                infoWindow: {
                    content: "<img width='60' style='padding-right:1em; float:left' src='"+url+"lib/img/logomap.png'/><h4>GHBus S.A.C. Tarapoto</h4><p>Direccion: Av. Salaverry 850 – Morales - San Martín - Perú</p>"
                }

            });
           
        });
    </script>
<div class="contenido navbar-inner">
    <h3>Contáctenos</h3>
    <div class="text-justify">
        <label style="font-size: 18px">Si tienes alguna duda o desea informarse comuniquese con nosotros</label>
    </div>
        <div class="row-fluid">
            <div class="span6">
                <div class="page-header">
                    <label class="subtitulo">DEJENOS UN MENSAJE</label>
                </div>
                <div class=" span10 text-center">
                <form action="" method="post" id="frmContacto" class="form-inline well">                    
                    <div class="control-group">
                        <label class="control-label">Nombre:</label>
                        <div class="controls">
                            <input type="text" class="input-xlarge" id="nombre" name="nombre" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Email:</label>
                        <div class="controls">
                            <input type="email" class="input-xlarge" id="email" name="email" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Asunto:</label>
                        <div class="controls">
                            <input type="text" class="input-xlarge" id="asunto" name="asunto" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Mensaje:</label>
                        <div class="controls">
                            <textarea class="input-xlarge" id="text" name="text" rows="5" cols="0"></textarea>
                        </div>
                    </div>
                    <div class="controls">
                        <input type="submit" class="boton_registro btn btn-primary" value="Enviar" id="submit" />
                        <button type="reset" class="btn btn-info" name="reset" id="reset">Cancelar</button>
                    </div>
                </form> 
                </div>
            </div>
            <div class="span6">
                <div class="page-header">
                    <label class="subtitulo">UBIQUENOS EN GOOGLE MAPS</label>
                </div>
                <div class="popin">
                    <div id="map"></div>
                </div>
            </div>
        </div>
            <br/><br/>
    </div>