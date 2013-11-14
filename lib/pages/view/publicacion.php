<?php 
$cad='';
$sql=mysql_query('SELECT * FROM publicacion');	  
//MAIN CONTENT
$cad.='<div class="main-slider-content" style="width:980px; height:340px;">';
$cad.='<ul class="sliders-wrap-inner">';
while($f=mysql_fetch_array($sql))
{
  $fecha=$f['FechaPublicacion'];
  $stringMes=date('M',strtotime($fecha));
  switch(date('D',strtotime($fecha)))
  {
    case 'Mon':
		$stringDia="LUNES";
		break;
    case 'Tue':
		$stringDia="MARTES";
		break;
    case 'Wed':
		$stringDia="MIERCOLES";
		break;	
    case 'Thu':
		$stringDia="JUEVES";
		break;	
    case 'Fri':
		$stringDia="VIERNES";
		break;	
    case 'Sat':
		$stringDia="SABADO";
		break;	
    case 'Sun':
                $stringDia="DOMINGO";
		break;				
  }
	
  switch(date('M',strtotime($fecha)))
  {
    case 'Jan':
		$stringMes="ENERO";
		break;
    case 'Feb':
		$stringMes="FEBRERO";
		break;
    case 'Mar':
		$stringMes="MARZO";
		break;	
    case 'Apr':
		$stringMes="ABRIL";
		break;	
    case 'May':
		$stringMes="MAYO";
		break;	
    case 'Jun':
		$stringMes="JUNIO";
		break;	
    case 'Jul':
		$stringMes="JULIO";
		break;	
    case 'Aug':
		$stringMes="AGOSTO";
		break;	
    case 'Sep':
		$stringMes="SETIEMBRE";
		break;	
    case 'Oct':
		$stringMes="OCTUBRE";
		break;	
    case 'Nov':
		$stringMes="NOVIEMBRE";
		break;	
    case 'Dec':
	        $stringMes="DICIEMBRE";
		break;				
  }
  $fechaPublicacion = $stringDia.", ".date('d')." ".$stringMes." ".date('Y');
  $cad.='<li>';
  $cad.='<img src="'.$f['image'].'" title="Galeria de Imagenes" >';
  $cad.='<div class="slider-description">';
  $cad.='<div class="slider-meta">';
  $cad.='<a target="_parent" title="Galeria de Imagenes" href="#Category-1">/Publicaci&oacute;n/</a> <i>Inicio:'.$fechaPublicacion.'</i>';
  $cad.='</div>';
  $cad.='<h4>'.$f['Titulo'].'</h4>';
  $cad.='<p>'.$f['Descripcion'].',...<a class="readmore" href="#">Leer m&aacute;s...</a></p>';
  $cad.='</div>';
  $cad.='</li>';
}
$cad.='</ul>';
$cad.='</div>';
//END MAIN CONTENT	
$cad.='<div class="navigator-content">';
$cad.='<div class="button-next">Siguiente</div>';	
$cad.='<div class="navigator-wrapper">';
$cad.='<ul class="navigator-wrap-inner">';
$cad.='<li><img src="css/images/thumbs/thumbl_980x340.png"/></li>';
$cad.='<li><img src="css/images/thumbs/thumbl_980x340_002.png"/></li>';	
$cad.='</ul>';
$cad.='</div>';
$cad.='<div  class="button-previous">Anterior</div>';
$cad.='</div>';
$cad.='<div class="button-control"><span></span></div>';
echo $cad;
?>