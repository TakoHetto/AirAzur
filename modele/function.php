<?php

require ("modele/connexion.php");

/**
 * Récupère tous les vols disponibles
 * @return type : lesVols
 */
function getLesVols() {
    
        $bdd = connect();
        $sql = $bdd->query("select numero, datedepart, datearrivee, prix, places, a1.libelle as depart, a2.libelle as arrivee, a1.ville as departV, a2.ville as arriveeV from vols, aeroport as a1, aeroport as a2 where idad = a1.id and idaa = a2.id ");

        $vols = $sql->fetchAll();
        $sql->closeCursor();

        return ($vols);
    }

/**
 * Récupère le numéro du vol, retourne ce dernier
 * @return type : id
 */
function reserverVol() {
    $numero = $_REQUEST["numero"];
    return $numero;
}

/**
 * Crée une réservation à partir des données fourni, puis les ajoutes au panier créer
 * @return type : lesReservationss
 */
function validerReservation() {
    $reservation = array();
    $reservation['numero'] = $_POST['numero'];
    $reservation['nom'] = $_POST['nom'];
    $reservation['prenom'] = $_POST['prenom'];
    $reservation['adresse'] = $_POST['adresse'];
    $reservation['mail'] = $_POST['mail'];
    $reservation['nbplaces'] = $_POST['nbvoyageurs'];
    creerReservation($reservation);
    initPanier();
    ajouterAuPanier($reservation);

    return $reservation;
}

function initPanier() {
    if (!isset($_SESSION['reservations'])) {
        $_SESSION['reservations'] = array();
    }
}

function ajouterAuPanier($reservation) {
    $_SESSION['reservations'][] = $reservation;
}

function creerReservation($reservation) {
    $bdd = connect();
    if (isset($bdd)) {
        $sql = $bdd->query("INSERT INTO reservation (numero,nom,prenom,adresse,mail,nbVoyageurs) values
            ('$reservation[numero]', '$reservation[nom]', '$reservation[prenom]', '$reservation[adresse]', '$reservation[mail]', '$reservation[nbplaces]')");
    }
}

?>