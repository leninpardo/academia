<!DOCTYPE html>

<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
    	<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
       <title>::.ACADEMIA.::</title>
        <meta name="keywords" content="" />
        <link href="<?php echo BASE_URL; ?>/lib/img/title.ico" rel="shortcut icon"/>
        <meta name="description" content="" >
        <meta name="viewport" content="width=device-width">
        <link href="<?php echo $_params['ruta_css']; ?>bootstrap.css" rel="stylesheet" />
        <link href="<?php echo $_params['ruta_css']; ?>bootstrap-responsive.css" rel="stylesheet" />
        <link href="<?php echo $_params['ruta_css']; ?>main.css" rel="stylesheet" charset="utf-8" />
        <link href="<?php echo $_params['ruta_css']; ?>jquery.motionCaptcha.css" rel="stylesheet" />
        <link rel="stylesheet" href="<?php echo $_params['ruta_css']; ?>fanbox.css" type="text/css" media="screen">


        <link href="<?php echo $_params['ruta_css']; ?>jquery-ui.custom.css" rel="stylesheet" />

           <link rel="stylesheet" href="<?php echo $_params['ruta_css']; ?>jquery-ui.custom.css" type="text/css" media="screen">

        <link href="<?php echo $_params['ruta_css']; ?>jquery-ui.custom.css" rel="stylesheet" />
        <link rel="stylesheet" href="<?php echo $_params['ruta_css']; ?>jquery-ui.custom.css" type="text/css" media="screen">

        <script src="<?php echo $_params['ruta_js']; ?>jquery.js"></script>
        <script src="<?php echo $_params['ruta_js']; ?>validaciones.js"></script>
        <script src="<?php echo $_params['ruta_js']; ?>jquery.min.js"></script>
        <script src="<?php echo $_params['ruta_js']; ?>modernizr-2.6.2.min.js"></script>
        <script type="text/javascript" src="<?php echo $_params['ruta_js']; ?>bootstrap.min.js"></script>
        <?php if(isset($this->vermenu)){ ?>
        <script type="text/javascript">

        $(function(){
            $('#toggleLogin').click(function(){
		$('#login').slideToggle("300");
                $("#usuario").focus();
            });
            $('#closeLogin').click(function(){
		$('#login').slideUp("300");
            });
            <?php if(session::get('autenticado') && !isset($this->vermenu)) { ?>
                
            <?php } else { ?>
                $(".<?php echo $this->li_menu ?>").addClass("current");
            <?php } ?>
        });
        var showStaticMenuBar = false;
        $(window).scroll(function() {
            if(showStaticMenuBar == false){
                if($(window).scrollTop() >= 109){
                    document.getElementById("navbar2").style.visibility = "visible";
                    showStaticMenuBar=true;
                }
            }else{
                if($(window).scrollTop() <= 109){
                    document.getElementById("navbar2").style.visibility = "hidden";
                    showStaticMenuBar=false;
                }   
            }
        }
        );
        $(function(){
            $(".<?php echo $this->li_menu ?>").addClass("active");
        });
        </script>
 
        <script type="text/javascript" src="<?php echo $_params['ruta_js']; ?>bootbox.min.js"></script>
        <link rel="stylesheet" href="<?php echo $_params['ruta_css']; ?>fanbox.css" type="text/css" media="screen">
    
            <div id='facebook_box' class="slide_likebox">
            <img src='<?php echo BASE_URL?>lib/img/fb_tab.png' class="img_fanbox"/>
            <div class="div_fanbox" style='background: #3c5a98;'>
                <span class="fanbox_fb">
                    <div class='likeboxwrap'>
                       
                    </div>
                </span>
            </div>
        </div>
        <?php } ?>
        <?php if(isset($_params['js']) && count($_params['js'])): ?>
        <?php for($i=0; $i < count($_params['js']); $i++): ?>
        
        <script src="<?php echo $_params['js'][$i] ?>" type="text/javascript"></script>
        
        <?php endfor; ?>
        <?php endif; ?>
        
        <?php if(isset($_params['css']) && count($_params['css'])): ?>
        <?php for($i=0; $i < count($_params['css']); $i++): ?>
        
        <link href="<?php echo $_params['css'][$i] ?>" type="text/css" rel="stylesheet" media="screen" />
        
        <?php endfor; ?>
        <?php endif; ?>
        <script type="text/javascript">
            jQuery(function (){jQuery(".slide_likebox").hover(function(){jQuery(".slide_likebox").stop(true, false).animate({right:"0"},"medium");},
                function(){jQuery(".slide_likebox").stop(true, false).animate({right:"-250"},"medium");},500);return false;});
        </script>
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->
        <?php if(isset($this->vermenu) && $this->vermenu == '1'){ ?>
        <style>
            #menu_sistema{
                display: none;
            }
        </style>
        <?php } ?>
        <?php if(!isset($this->vermenu) && session::get('autenticado')){ ?>
        <style>
            .slide_likebox, #menuweb, #menuweb2 {
                display: none;
            }
        </style>
        <?php } ?>
        <script type="text/javascript">
        jQuery(function (){
        jQuery(".ventana").hover(function(){
        jQuery(".ventana").stop(true, false).animate({left:"0",top:"180"},"medium");
        },function(){
        jQuery(".ventana").stop(true, false).animate({left:"-285",top:"230"},"fast");
        },1000);
        return false;
        });
        </script>
       
        <?php if(!session::get('autenticado')){ ?>
     <div id="dialogo" class="ventana">
            <div id="sesion">			
                <div id="cuadrosesion">
                    <form action="<?php echo BASE_URL?>login" method="post" style="padding: 0; margin: 0" id="mc-form">
                        <input type='hidden' name='oficinas' value='1' />
                        <table style="margin-top: 6%; margin-left: 2%">
                            <tr><td>Usuario:</td><td><input size="15%" type="text" name="usuario" id="usuario" placeholder="Ingrese el usuario"></td></tr>
                            <tr><td >Clave:</td><td><input size="15%" type="password" name="clave" placeholder="Ingrese su clave"></td>
                            <tr><td colspan="2" align="center"><button type="submit" class="btn btn-info" id="button">Acceder</button><br/> 
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
        <?php } ?>
        <!-- Modal -->
  
        
        <div class="container">
            <?php if(isset($this->vermenu)){ ?>
        <div id="body">
            <section id="navbar1">
              
                <div class="navbar menuinfo" style="width: 100%;">
                    <div class="">
                     
                        <div class="nav-collapse collapse nav-collapse1" style="width: 200%;" >
                            <ul class="nav" id="menu_info" style="width:100%; margin: 0%; margin-left: -4%; background-color:#446D9E">
                                <li style="padding-right: 3%; margin-top: 1%; margin-left: 1%"> <a href="<?php echo BASE_URL?>index"><img  class="img-rounded" src="<?php echo BASE_URL ?>lib/img/logo.png" height="100%" width="100%" /></a></li>
                                     <li style="margin-top: 3%; margin-left: 1%"><a class="li_inicio"  href="<?php echo BASE_URL ?>"><span></span>INICIO</a></li>
                                    <li style="margin-top: 3%;margin-left: 1%"><a class="li_nosotros" href="<?php echo BASE_URL ?>web/nosotros"><span></span>NOSOTROS</a></li>
                                    <li style="margin-top: 3%;margin-left: 1%"><a class="li_servicios" href="<?php echo BASE_URL ?>web/servicios"><span></span>SERVICIOS</a></li>
                                    <li style="margin-top: 3%;margin-left: 1%"><a class="li_contactenos" href="<?php echo BASE_URL ?>web/contactenos"><span></span>CONTÁCTENOS</a></li>
                                <?php if(session::get('autenticado')){ ?>
                                <li style="margin-top: 3%;margin-left: 1%"><a class="li_sistema" href="<?php echo BASE_URL ?>index"><span></span>SISTEMA</a></li>
                                <?php } ?>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
            <section id="navbar2">
          
                <div class="navbar menuinfo" id="menuweb2"style=" background-color:#446D9E; width: 100%; padding-top: 2.5%; margin-left:0%">
                    <div class="">
                        <div class="container">
                            <div class="pull-left">
                                <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse2">
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="nav-collapse nav-collapse2 collapse" >
                                <ul class="nav" id="menu_info" style=" width: 70%" >
                                    <li style="margin-top: -3%; padding: 3%"> <a href="<?php echo BASE_URL?>index"><img src="<?php echo BASE_URL ?>lib/img/logo.png" height="70%" width="70%"/></a></li>
                                    <li style="margin-top: 1%; margin-left: 1%"><a class="li_inicio"  href="<?php echo BASE_URL ?>"><span></span>INICIO</a></li>
                                    <li style="margin-top: 1%;margin-left: 1%"><a class="li_nosotros" href="<?php echo BASE_URL ?>web/nosotros"><span></span>NOSOTROS</a></li>
                                    <li style="margin-top: 1%;margin-left: 1%"><a class="li_servicios" href="<?php echo BASE_URL ?>web/servicios"><span></span>SERVICIOS</a></li>
                                    <li style="margin-top: 1%;margin-left: 1%"><a class="li_contactenos" href="<?php echo BASE_URL ?>web/contactenos"><span></span>CONTÁCTENOS</a></li>
                                    <?php if(session::get('autenticado')){ ?>
                                    <li style="margin-top: 1%;margin-left: 1%"><a class="li_sistema" href="<?php echo BASE_URL ?>index"><span></span>SISTEMA</a></li>
                                    <?php } ?>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <script>var url="<?php echo BASE_URL ?>";</script>
            <section id="main" class="container" style="margin-top: 0.2%;">
            <?php } else { ?>
                <div id="bodysistema">
                    <section id="navbar" >
                <div class="menuinfo" id="titulo">
                    <a href="<?php echo BASE_URL?>index"><img src="<?php echo BASE_URL ?>lib/img/logoYO.jpg" /></a>
                </div>
            <script>
                var url="<?php echo BASE_URL ?>";
            </script>
            <?php } ?>
 