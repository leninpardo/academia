<?php
$chart = new Highchart();
$chart->chart->renderTo = "container";
$chart->chart->type = "column";
$chart->title->text = utf8_decode(" TOTAL DE ALUMNOS POR TURNO MATRICULADOS");

$chart->xAxis->categories = array($this->datos[0]['TURNO'],$this->datos[1]['TURNO'],
        $this->datos[2]['TURNO']);

$chart->yAxis->min = 0;
$chart->yAxis->title->text = "Total";
$chart->legend->layout = "vertical";
$chart->legend->backgroundColor = "#FFFFFF";
$chart->legend->align = "left";
$chart->legend->verticalAlign = "top";
$chart->legend->x = 100;
$chart->legend->y = 70;
$chart->legend->floating = 1;
$chart->legend->shadow = 1;

$chart->tooltip->formatter = new HighchartJsExpr("function() {
    return '' + this.x +': S/. '+ this.y +'';}");

$chart->plotOptions->column->pointPadding = 0.2;
$chart->plotOptions->column->borderWidth = 0;

$chart->series[] = array('name' => "Total Alumnos x Turno",
                         'data' => array((float)$this->datos[0]['TOTALALUMNOS'],(float)$this->datos[1]['TOTALALUMNOS'], 
                             (float)$this->datos[2]['TOTALALUMNOS']
                             ));

?>

<html>
  <head>
    <title>Ventas</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <?php
      foreach ($chart->getScripts() as $script) {
         echo '<script type="text/javascript" src="' . $script . '"></script>';
      }
    ?>
  </head>
  <body>
    <div id="container"></div>
    <script type="text/javascript">
    <?php
      echo $chart->render("chart1");
    ?>
    </script>
  </body>
</html>
