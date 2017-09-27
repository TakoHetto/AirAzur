<div id="contenu"> 
    <form method='POST' action='index.php?action=validerReservation' >
    <center><fieldset>
        <legend>Reservation pour le vol numero <?php echo $_SESSION['numero']; ?></legend>
        <fieldset>
            <legend>Vos informations: </legend>
                <label for="nom">Nom: </label>
                    <input name="nom" type="text" id="nom" />
                </br>
                <label for="prenom">Prénom: </label>
                    <input name="prenom" type="text" id="prenom"/>
                </br>
                <label for="adresse">Adresse: </label>
                    <input name="adresse" type="text" id="adresse"/>
                </br>
                <label for="mail">Mail: </label>
                    <input name="mail" type="mail" id="mail"/>
                </br>
                <label for="nbvoyageurs">Nb voyageur:</label>
                <input type='text' name='nbvoyageurs' id="nbvoyageurs"/>
                </br>
        </fieldset></br>
            <input type="hidden" name="numero" value="<?php echo $_SESSION['numero']; ?>">
            <input type="submit" value="Valider" />
            <input type="reset" value="Effacer" />
        </fieldset></center>
    </form>
</div>