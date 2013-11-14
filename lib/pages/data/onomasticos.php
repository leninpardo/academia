<?php
$sql=pg_query("select idtipocliente,
                      nombres_apellidos,
                      razon_social
               from cliente
               where date_part('day', fecnac)=".date('d')." and date_part('month', fecnac)=".date('m')."");
echo "<marquee direction='down' style='background-color:#FADE89' height='180' width='80%' scrollamount='2' class='mov_cenpro'>";
while($f=pg_fetch_array($sql))
{
  echo "<table style='margin-left:0px;font-size:11px;text-align:justify' width='90%' class='data'>";
  echo "<tr>";
  echo '<td valign="top" width="380">';
  echo '<table>';
  if($f['idtipocliente'] == 1)
  {
    echo '<tr>
          <td style="color:#036"><b>CLIENTE:</b></td>';
    echo "<td><a><b>".$f['nombres_apellidos']."</b></a></td>";			
    echo '</tr>';  
  }
  else
  {
    echo '<tr>
          <td style="color:#036"><b>CLIENTE:</b></td>';
    echo "<td><a><b>".$f['razon_social']."</b></a></td>";			
    echo '</tr>';  
  }
  echo '<tr>
        <td style="color:#900" colspan="2"><b>MUCHAS FELICIDADES!!!</b></td>
        </tr>';												
  echo '</table>';
  echo "</td>";
  echo "</tr>";
  echo "</table>";	
}
echo "</marquee>";
?>