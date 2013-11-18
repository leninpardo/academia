   
<div id="jsfoot">
        <?php if(isset($_params['js_foot']) && count($_params['js_foot'])): ?>
        <?php for($i=0; $i < count($_params['js_foot']); $i++): ?>
        
        <script src="<?php echo $_params['js_foot'][$i] ?>" type="text/javascript"></script>
        
        <?php endfor; ?>
        <?php endif; ?>
    </div>
    </div>
    <script src="<?php echo $_params['ruta_js']; ?>jquery.motionCaptcha.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $('#mc-form').motionCaptcha({
                shapes: ['triangle', 'x', 'rectangle', 'circle', 'check', 'zigzag', 'arrow', 'delete', 'pigtail', 'star']
            });
        });
        
     
    </script>
    
    
        <?php if(!isset($this->vermenu) && session::get('autenticado')){ ?>
    </div>
    </div>
    </div>
    </div>
    </div>
    <script>
     $(document).ready(function(){
        $("#cont-sistema .btn-primary").addClass('btn-warning');
        $("#cont-sistema .btn-info").removeClass('btn-info');
        $("#cont-sistema .btn-info i.icon-white").removeClass('icon-white');
    });
    </script>
    <div class="text-center" id="footer">
            <div class="divfooter">
                Academia Abierta
            </div>
            <div class="divfooter">
                <?php echo session::get('perfil')?> <?php echo session::get('empleado')?> | <?php echo Main::get_servidor() ?>
            </div>
        </div>  
        <?php } else { ?> 
        <div class="text-center" id="footer">
            <div class="divfooter" style="font-size: 15px">
                <label>ACADEMIA- Tarapoto</label>
                <label>jr: Gregorio Delgado 443</label>
                <label>RPM:#988418909- #990872650</label>
            </div>
        </div>   
        <?php } ?>
    </div>
    </body>
</html>