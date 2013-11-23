<?php 

header("Content-type: application/octet-stream");
//indicamos al navegador que se está devolviendo un archivo
header("Content-Disposition: attachment; filename=asiento_contable.xls");
//con esto evitamos que el navegador lo grabe en su caché
header("Pragma: no-cache");
header("Expires: 0");
//damos salida a la tabla
include '../../basedatos/conexion.php';
include '../../basedatos/Main.php';
include '../../modelo/contabilidad.php';

?>
<table border="1">
    <tr>
        <td colspan="4">Descripcion Asiento</td>
        <td>Nro cuenta</td>
        <td>cuenta</td>
        <td>debe</td>
        <td>haber</td>
        
    </tr>
<?
$m=new contabilidad();
$datos =$m->getQuery("SELECT *from planilla_movimiento");
foreach ( $datos as $sk)
{
 $dat =$m->getQuery("SELECT a.Planilla_movimiento_ID,a.debe,a.haber,cuentas.planilla_contable_ID,cuentas.descripcion
from asiento a
INNER JOIN planilla_contable cuentas on(a.planilla_contable_ID=cuentas.planilla_contable_ID)
WHERE a.Planilla_movimiento_ID=$sk[0]"); 
echo "<tr><td colspan='3'>".$sk[1]."</td><td colspan='4'></td></tr>";
 foreach ($dat as $dt)
 {
     echo '<tr><td colspan="3"><td>';
      echo '<td>'.$dt[3].'</td>';
          echo '<td>'.$dt[4].'</td>';
     if($dt[1]!=null)
     {
           echo '<td>'.$dt[1].'</td>';   
     }
 else{
          echo '<td></td>';
 }
     if($dt[2]!=null)
     {
              echo '<td>'.$dt[1].'</td>';
         
     }else{     echo '<td></td>';}
    
          echo '</tr>';
     
 }
 
}
?>

</table>