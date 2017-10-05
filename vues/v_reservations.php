<div id="contenu">
<h1>Liste des réservations</h1>
    <table border="1">
        <th>
        <td>Nom</td>
        <td>Prenom</td>
        <td>Numero de réservation</td>
        <td>Nombre de Voyageurs</td>
        </th>
<?php
    if($lesReservations!=NULL){
        for($i=0;$i<=count($lesReservations)-1;$i++){ 
           
            echo '<tr>';
                echo '<td>'.$lesReservations[$i]['nom'].'</td>';
                echo '<td>'.$lesReservations[$i]['prenom'].'</td>';
                echo '<td>'.$lesReservations[$i]['numero'].'</td>';
                echo '<td>'.$lesReservations[$i]['nbplaces'].'</td>';
            echo '<tr>';
         }
    }
  ?>
    </table>
</div>