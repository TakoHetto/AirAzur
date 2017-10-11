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
        $sql = $bdd->query("INSERT INTO reservation(nom,prenom,adresse,mail,nbVoyageurs,numeroVols) values
            ('$reservation[nom]', '$reservation[prenom]', '$reservation[adresse]', '$reservation[mail]', '$reservation[nbplaces]', '$reservation[numero]')");
    }
}

//function getLesReservations(){
//    $lesReservations=getLesReservationsPanier();
//    return $lesReservations;
//  
//}
////
//function getLesReservationsPanier(){
//    if(isset ($_SESSION['reservations']) && count($_SESSION['reservations'])!=0){
//        return $_SESSION['reservations'];
//    }
//    else{
//        return NULL;
//    }
//    
//}

function getLesReservations() {
        $lesReservations = $_SESSION['reservations'];
        return $lesReservations;
}

function getLaReservation() {
    $tab = $_SESSION['reservations'];
    $laReservation = $tab [$_REQUEST['numReservation']];
    return $laReservation;
}

function creerPdfReservation($reservation) {  
    require('fpdf/fpdf.php');
    
    $numero = $_SESSION['numero'];
    $nom = $_SESSION['nom'];
    $prenom = $_SESSION['prenom'];
    $adresse = $reservation['adresse'];
    $mail = $reservation['mail'];
    $nbplaces = $reservation['nbplaces'];
    
    $pdf=new FPDF();
    $pdf->AddPage();
    //Centre le texte
    $pdf->SetFont('Arial', 'B', 15);
    $pdf->MultiCell(0,'Reservation Air Azur',0,'C');
    $pdf->Image("image/logo.jpg", 77, 10, 50, 36);
    //$pdf->Image('../image/logo.jpg',2,2,64,48);
    //retour Ã  la ligne
    $pdf->Ln();
    $pdf->SetFont('Times', 'B', 12);
    $pdf->Cell(1,95, "Informations de votre vol $numero :");
    $pdf->Cell(1,110, "- Client : $nom $prenom");
    $pdf->Cell(1,120, "- Adresse : $adresse");
    $pdf->Cell(1,130, "- Mail : $mail");
    $pdf->Cell(1,140, "- Nombre de passagers : $nbplaces");
    
    ob_clean();
    
    $pdf->Output(); 
}

?>