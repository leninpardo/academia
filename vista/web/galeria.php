<style>
.imgfb{
    width: 100px;
    height: 100px;
}
.fotofb{
	width: 154px;
        display:inline-block;
        vertical-align: top;
	padding: 6px;
	margin: 4px;
	font-family:Arial, Helvetica, sans-serif;
	font-size: 11px;
        box-shadow: inset 0px 0px 20px rgba(100,100,100,0.2);
        border: solid 1px #666;
        border-radius: 5px;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        -o-border-radius: 5px;
        -ms-border-radius: 5px;

}
.fotofb i{
	width: 150px;
	height: 116px;
	background-color:#FBFBFB;
	border: solid 1px #999;
	background-color: #EEE;
	background-position: center 25%;
	background-repeat: no-repeat;
	display: block;		
	box-shadow: -3px 3px 5px #111;
}
.fotofb i:hover{
	box-shadow: 0px 0px 5px #000;	
}
</style>
<div class="contenido navbar-inner">
    <h3>Lista de Albumes</h3>
    <div class="text-center">
<?php
    $divfotos = '';
    include("fb.php");
    $listafotos =  fb_albums('378974098835590');
    foreach($listafotos as $index => $valor){
        $nombre = str_replace(" ","_", $valor['nombre']);
        $divfotos .= '<div class="fotofb"><a href="'. BASE_URL .'galeria/album/'.$valor['ida'].'/'.$nombre .'">
                <i style="background-image: url('.$valor['thumb'].')"></i></a>
                    <p> '. $valor['total'].' fotos publicadas'.'</p>
                        <p style="font-weight:bold;" title="'.$valor['nombre'].'">'.($valor['nombre']).'</p></div>';
    }
    echo $divfotos;
?>
    </div>