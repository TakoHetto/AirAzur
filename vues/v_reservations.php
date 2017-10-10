<div id="contenu">
<h1>Liste des réservations</h1>
    <table border="1">
        <tr>
        <th>Nom</th>
        <th>Prenom</th>
        <th>Numero de réservation</th>
        <th>Nombre de Voyageurs</th>
        </tr>
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