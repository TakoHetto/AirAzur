<div id="contenu">
    <div class="bloc">
        <?php foreach ($lesVols as $unVol) { ?>
            Vol : <?php echo $unVol['numero']; ?></br>
            Départ : <?php echo $unVol['depart']; ?> - <?php echo $unVol['departV']; ?> </br>
            Arrivée : <?php echo $unVol['arrivee']; ?> - <?php echo $unVol['arriveeV']; ?> </br>
            Prix : <?php echo $unVol['prix']; ?></br>
            Places : <?php echo $unVol['places']; ?></br>
            <?php
            echo '<a href="index.php?action=formReservation&numero=' . $unVol['numero'] . '">Réserver</a></br></br>';
        }
        ?>
    </div>
</div>
