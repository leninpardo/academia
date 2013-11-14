<?php 
$cad='';
$sql='select * 
      from galeria
      where estado = 1
      order by idgaleria';
$r=pg_query($sql);	  
//MAIN CONTENT
$cad.='<div class="main-slider-content" style="width:980px; height:340px;">';
$cad.='<ul class="sliders-wrap-inner">';
//$cad.='<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>';
while($f=pg_fetch_array($r))
{
//  $fechaPublicacion = $stringDia.", ".date('d',strtotime($fecha))." ".$stringMes." ".date('Y',strtotime($fecha));
  $cad.='<li>';
  $cad.='<img src="syscocorocos/system_pg/galeria/publicidad/'.$f['imagen'].'" border="0"  title="Galeria de Imagenes" width="980" height="340" />';
  $cad.='<div class="slider-description">';
  $cad.='<div class="slider-meta">';
  $cad.='</div>';
  $cad.='<h2>'.$f['titulo'].'</h2>';
  $cad.='</div>';
  $cad.='</li>';
}
  $cad.='</ul>';
  $cad.='</div>';
  //END MAIN CONTENT
  $r1=pg_query($sql);	
  $cad.='<div class="navigator-content">';
  $cad.='<div class="button-next">Siguiente</div>';	
  $cad.='<div class="navigator-wrapper">';
  $cad.='<ul class="navigator-wrap-inner">';

  while($f1=pg_fetch_array($r1))
  {	
    $cad.='<li>
           <img src="syscocorocos/system_pg/galeria/publicidad/'.$f1['imagen'].'" border="0" width="70" height="25"/>
           </li>';
  }

  $cad.='</ul>';
  $cad.='</div>';
  $cad.='<div class="button-previous">Anterior</div>';
  $cad.='</div>';
  $cad.='<div class="button-control"><span></span></div>';
  echo $cad;
?>