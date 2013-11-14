<script src="<?php echo BASE_URL ?>lib/js/highslide-with-gallery.js" type="text/javascript"></script>
<link href="<?php echo BASE_URL ?>lib/css/highslide.css" type="text/css" rel="stylesheet" media="screen" />
<script type="text/javascript">
	hs.graphicsDir = url+'lib/img/graphics/';
	hs.align = 'center';
	hs.transitions = ['expand', 'crossfade'];
	hs.fadeInOut = true;
	hs.dimmingOpacity = 0.8;
	hs.wrapperClassName = 'borderless floating-caption';
	hs.captionEval = 'this.thumb.alt';
	hs.marginLeft = 100; // make room for the thumbstrip
	hs.marginBottom = 80 // make room for the controls and the floating caption
	hs.numberPosition = 'caption';
	hs.lang.number = '%1/%2';

	// Add the slideshow providing the controlbar and the thumbstrip
	hs.addSlideshow({
		//slideshowGroup: 'group1',
		interval: 5000,
		repeat: false,
		useControls: true,
		overlayOptions: {
			className: 'text-controls',
			position: 'bottom center',
			relativeTo: 'viewport',
			offsetX: 50,
			offsetY: -5

		},
		thumbstrip: {
			position: 'middle left',
			mode: 'vertical',
			relativeTo: 'viewport'
		}
	});

	// Add the simple close button
	hs.registerOverlay({
		html: '<div class="closebutton" onclick="return hs.close(this)" title="Close"></div>',
		position: 'top right',
		fade: 2 // fading the semi-transparent overlay looks bad in IE
	});
</script>

<style>   
.imgfb{
    margin: 2px;
}
.imgfb img{
    width: 140px;
    height: 120px;
}
</style>
<div class="contenido navbar-inner">
<div class="text-center">
    <br/>
    <a href="<?php echo BASE_URL ?>galeria" class="btn btn-primary">Volver a la Lista de Albumes</a><br/>
    <h3>
        <?php 
        $nombre = str_replace("_"," ", $nombre);
        echo $nombre ?>
    </h3>
    <br/>
<?php 
include("fb.php");
$galeria = file_get_contents("https://graph.facebook.com/".$idfb."/photos?limit=100"); 

$galeria = json_decode($galeria);

$fotos = $galeria->data;
    $divfotos ='<div class="highslide-gallery">';
            foreach($fotos as $idfoto => $foto){
                $divfotos .= '<span class="imgfb"><a class="highslide" onclick="return hs.expand(this)" title="Foto '.($idfoto+1).' de la galería" href="'.$foto->source.'"><img class="imgfb img-polaroid" title="Foto '.($idfoto+1).' de la galería" src="'.$foto->picture.'" alt="" /></a></span>';
            }
    $divfotos .='<br>
        </ul>';
echo $divfotos;
?>
</div>
</div>