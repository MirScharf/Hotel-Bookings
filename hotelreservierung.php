<html>
<head>
<h1 id="header"> Hotelreservierung </h1>
<title>Hotelreservierung</title>
<link rel=stylesheet type="text/css" href="design.css">
</head>
<body>

<?php

// ******************************
// SETZEN GLOBALER VARIABLEN
// ******************************

$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';
$dbname = 'db_hotelreservierung';

$dbconn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
if(mysqli_connect_error()) die("Keine Verbindung zur Datenbank: ".mysqli_connect_error());
//echo "<br>Verbindung zur Datenbank hergestellt.";


// ******************************
// UEBERNAHME DER VARIABLEN
// ******************************

//Buttons
$Submitbutton = isset($_POST["Submitbutton"])? $_POST["Submitbutton"]:"";
$Resetbutton  = isset($_POST["Resetbutton"])?  $_POST["Resetbutton"]:"";

//Suchfelder
$Suchbegriff  = isset($_POST["Suchbegriff"])?  $_POST["Suchbegriff"] :"";
$Zimmersuche  = isset($_POST["Zimmersuche"])?  $_POST["Zimmersuche"] :"";

$ug  = isset($_POST["ug"])?  $_POST["ug"] :"";
$og  = isset($_POST["og"])?  $_POST["og"] :"";

//Auswahllisten 
$Zeit         = isset($_POST["Zeit"])?         $_POST["Zeit"]:"%";
$Zeit_string  = isset($_POST["Zeit_string"])?  $_POST["Zeit_string"]:"";
$Zeit_num     = isset($_POST["Zeit_num"])?     $_POST["Zeit_num"]:"";

$Verpflegung         = isset($_POST["Verpflegung"])?        $_POST["Verpflegung"]:"%";
$Verpflegung_string  = isset($_POST["Verpflegung_string"])? $_POST["Verpflegung_string"]:"";

//Radiobuttons
$zgr          = isset($_POST["zgr"])?          $_POST["zgr"]:"";

//Checkboxen
$Option1        = isset($_POST["Option1"])?       $_POST["Option1"]:"";
$Option2        = isset($_POST["Option2"])?       $_POST["Option2"]:"";
$Option3        = isset($_POST["Option3"])?       $_POST["Option3"]:"";
$Option4        = isset($_POST["Option4"])?       $_POST["Option4"]:"";

$extra1        = isset($_POST["extra1"])?       $_POST["extra1"]:"";
$extra2        = isset($_POST["extra2"])?       $_POST["extra2"]:"";
$extra3        = isset($_POST["extra3"])?       $_POST["extra3"]:"";


// Resetbutton
if ($Resetbutton) 
{
   $Suchbegriff  = "";
   $Zimmersuche  = "";
   $Zeit         = "%";
   $Zeit_string  = "";
   $zgr          = "";
   $Verpflegung  = "%";
   $Verpflegung_string  = "";
   $Option1      = "";
   $Option2      = "";
   $Option3      = "";
   $Option4      = "";
   $extra1       = "";
   $extra2       = "";
   $extra3       = "";
   $ug  = "";	
   $og  = "";
}

//Auswahlliste Reservierungsdatum

if ($Zeit_string == "") 
{
   $dbconn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
   $sql = "select reservierung from buchung order by reservierung";
   $result = mysqli_query($dbconn, $sql);
   $Zeit_num = mysqli_num_rows($result);
   for ($i=0; $i<$Zeit_num; $i++) {$row=mysqli_fetch_row($result);$Zeit_liste[$i]=$row[0];}
   
if ($Zeit_liste[0] == "") $Zeit_liste[0] = "Fehler: Kein Eintrag vorhanden.";
   $Zeit_string = base64_encode(serialize($Zeit_liste)); 
}
else
{
   $Zeit_liste = unserialize(base64_decode($Zeit_string));
}

if ($Zeit == '%')
{   $Zeit_select = "selected"; 
    for ($i=0; $i<$Zeit_num; $i++) 
{$Zeit_sel[$i] = "";}
} 
else {
    $Zeit_select = ""; 
    for ($i=0; $i<$Zeit_num; $i++) {$Zeit_sel[$i] = "";
    if ($Zeit == "$Zeit_liste[$i]") $Zeit_sel[$i] = "selected";}
}

//Auswahlliste Verpflegung

if ($Verpflegung_string == "") 
{
   $sql = "select name from optionen ";
   $result = mysqli_query($dbconn, $sql);
   for ($i=0; $i<4; $i++) {$row=mysqli_fetch_row($result);$Verpflegung_liste[$i]=$row[0];}
   
if ( $Verpflegung_liste[0] == "" ) $Verpflegung_liste[0] = "Fehler: Kein Eintrag vorhanden.";
   $Verpflegung_string = base64_encode(serialize($Verpflegung_liste)); 
}
else
{
   $Verpflegung_liste = unserialize(base64_decode($Verpflegung_string));
}

if ($Verpflegung == '%')
{   $Verpflegung_select = "selected"; 
    for ($i=0; $i<4; $i++) {$Verpflegung_sel[$i] = "";}
} else {
    $Verpflegung_select = ""; 
    for ($i=0; $i<4; $i++) {$Verpflegung_sel[$i] = "";
    if ($Verpflegung == "$Verpflegung_liste[$i]") $Verpflegung_sel[$i] = "selected";}
}

//Radiobuttons
$zgr1_select = ""; if ($zgr == "1") $zgr1_select = "checked";
$zgr2_select = ""; if ($zgr == "2") $zgr2_select = "checked";
$zgr3_select = ""; if ($zgr == "3") $zgr3_select = "checked";

//Checkboxen
$Option1_select = "";    
if ($Option1 == "1") $Option1_select = "checked"; 
$Option2_select = "";    
if ($Option2 == "1") $Option2_select = "checked"; 
$Option3_select = "";    
if ($Option3 == "1") $Option3_select = "checked"; 
$Option4_select = "";    
if ($Option4 == "1") $Option4_select = "checked"; 

$extra1_select = "";    
if ($extra1 == "1") $extra1_select = "checked"; 
$extra2_select = "";    
if ($extra2 == "1") $extra2_select = "checked"; 
$extra3_select = "";    
if ($extra3 == "1") $extra3_select = "checked"; 

// ******************************
// AUSGABE VON MASKE UND ERGEBNIS
// ******************************

//Suchfelder
echo '<div class="options-container">';
echo "<br>";
echo '<form method="post" action="'.$_SERVER["PHP_SELF"].'">'."\n";

echo '<input name="Suchbegriff" type="text" size="50" maxlength="40" value='.$Suchbegriff.'>'."\n";
echo " Bitte einen Teil von Name oder Anschrift eingeben. <BR><BR>";

echo '<input name="Zimmersuche" type="integer" size="5" maxlength="2" value='.$Zimmersuche.'>'."\n";
echo " Bitte eine Zimmernummer eingeben. <BR><BR>";
echo " Ab diesem Anreisetermin:   ";

echo '<input name="ug" type="date("Y-m-d")" size="15" maxlength="10" value='.$ug.'>'."\n";
echo " Bis zu diesem Abreisetermin:   ";
echo '<input name="og" type="date("Y-m-d")" size="15" maxlength="10" value='.$og.'>'."<BR><BR>";

//Radiobuttons
echo " Zimmergroesse auswaehlen: <br>";
echo '<input type="radio" name="zgr" value="1" '."$zgr1_select".' >'."\n";
echo " bis 20qm ausschl.<br>";
echo '<input type="radio" name="zgr" value="2" '."$zgr2_select".' >'."\n";
echo " ab 20qm bis 30 qm ausschl.<br>";
echo '<input type="radio" name="zgr" value="3" '."$zgr3_select".' >'."\n";
echo " ueber 30qm einsschl.<br><br>";

//Checkboxen

echo "Optionen:<BR>";
echo '<input type="checkbox" name="Option1" value="1" '."$Option1_select".' >'."\n";
echo " Tennis &nbsp&nbsp&nbsp";
echo '<input type="checkbox" name="Option2" value="1" '."$Option2_select".' >'."\n"; 
echo " W-Lan  &nbsp&nbsp&nbsp";
echo '<input type="checkbox" name="Option3" value="1" '."$Option3_select".' >'."\n";
echo " Sauna  &nbsp&nbsp&nbsp";
echo '<input type="checkbox" name="Option4" value="1" '."$Option4_select".' >'."\n"; 
echo " Fitness <br><br>";



echo "Austattung:<BR>"; 
echo '<input type="checkbox" name="extra1" value="1" '."$extra1_select".' >'."\n";
echo " Meerblick &nbsp&nbsp&nbsp";
echo '<input type="checkbox" name="extra2" value="1" '."$extra2_select".' >'."\n"; 
echo " Lounge  &nbsp&nbsp&nbsp";
echo '<input type="checkbox" name="extra3" value="1" '."$extra3_select".' >'."\n";
echo " Minibar  &nbsp&nbsp&nbsp <BR><BR>";


//**********************
//DropDown-Feld 1 zu Auswahlliste Verpflegung 
//**********************

echo '<input type="hidden" name="Verpflegung_string" value="'.$Verpflegung_string.'">'."\n";
echo '<select name="Verpflegung" size="1">'."\n";
echo '<option '.$Verpflegung_select.' value="%"> egal'."\n";
$i=0;
while ($i<4) 
   {echo '<option '.$Verpflegung_sel[$i].' value="'.$Verpflegung_liste[$i].'">'.$Verpflegung_liste[$i].'</option>'; $i++;}
echo '</select>'."\n";

echo " Bitte eine Verpflegungsart auswaehlen. <BR><BR>";

//**********************
//DropDown-Feld 2 zu Auswahlliste Reservierungsdatum
//**********************
echo '<input type="hidden" name="Zeit_num"    value="'.$Zeit_num.'">   '."\n";
echo '<input type="hidden" name="Zeit_string" value="'.$Zeit_string.'">'."\n";
echo '<select name="Zeit" size="1">'."\n";
echo '<option '.$Zeit_select.' value="%"> egal'."\n";
$i=0;
while ($i<$Zeit_num) 
   {echo '<option '.$Zeit_sel[$i].' value="'.$Zeit_liste[$i].'">'.$Zeit_liste[$i].'</option>'; $i++;}
echo '</select>'."\n";

echo " Bitte das Reservierungsdatum auswaehlen. <BR><BR>";

//**********************
//DropDown-Feld (Ende)
//**********************

echo '<input type="submit" name="Submitbutton" value="Suchen">'."\n";
echo '<input type="submit" name="Resetbutton" value="Reset">'."\n";  
echo '</div>';

if ($Submitbutton)
  {
if ($Suchbegriff or $Zeit!= '%' or $Verpflegung !='%' or $Zimmersuche or $zgr != "" or $Option1 == "1" or $Option2 == "1" or $Option3 == "1" or $Option4 == "1" or $extra1 == "1" or $extra2 == "1" or $extra3 == "1" or $ug !="" or $og !="")
{

	$sql = "SELECT Distinct person.kundennummer, "       // Mit distinct die mehrfache Ausgabe von Eintr�gen verhindert
                ." person.vorname, "
                ." person.nachname, "                       
                ." person.strasse, "
                ." person.ort, "
                ." person.plz, "
                ." person.anrede, "
                ." person.telefonnummer, "
		." buchung_person.buchung, "
		." buchung.anreise, "
		." buchung.abreise, "
		." buchung.zimmernummer, "
		." zimmer.qm "
            ."FROM person, buchung_person, buchung, optionen, buchung_optionen, ausstattung, zimmer, zimmer_ausstattung "
           ."WHERE (person.vorname  like '%".$Suchbegriff."%' "
               ."OR person.nachname like '%".$Suchbegriff."%' "
               ."OR person.ort      like '%".$Suchbegriff."%' "
               ."OR person.strasse  like '%".$Suchbegriff."%') 
                AND buchung_person.person = person.kundennummer 
                AND buchung_person.buchung = buchung.buchungsnummer 
                AND buchung_optionen.buchung = buchung.buchungsnummer 
                AND buchung_optionen.optionen = optionen.nummer
		AND zimmer_ausstattung.zimmer      = zimmer.raumnummer 
           	AND zimmer_ausstattung.ausstattung = ausstattung.nummer 
		AND buchung.zimmernummer = zimmer.raumnummer " ;
	
					
 	if ($zgr == "1") $sql .= "AND (zimmer.qm >=  0 AND zimmer.qm < 20) ";
 	if ($zgr == "2") $sql .= "AND (zimmer.qm >= 20 AND zimmer.qm < 30) ";
 	if ($zgr == "3") $sql .= "AND (zimmer.qm >= 30                   ) ";

	if ($og !="")
	    $sql .= "AND (buchung.abreise <= '$og') ";
	if ($ug != "" )
	    $sql .= "AND (buchung.anreise >= '$ug') ";
	
				
	if ($Zeit != "%")
        $sql .=   "AND buchung.reservierung = '$Zeit' ";

	if($Zimmersuche)
	$sql .= "AND buchung.zimmernummer = '$Zimmersuche' ";

   if ($Option1 === "1" || $Option2 === "1" || $Option3 === "1" || $Option4 === "1" || $Verpflegung != '%' || $extra1 === "1" || $extra2 === "1" || $extra3 === "1")
    {
      $sql .= "AND (";
      if ($extra1 == "1")  $sql .= "ausstattung.name like 'Meerblick'  OR ";
      if ($extra2 == "1")  $sql .= "ausstattung.name like 'Lounge'     OR ";
      if ($extra3 == "1")  $sql .= "ausstattung.name like 'Minibar'    OR ";
      if ($Verpflegung != '%') $sql .= "optionen.name = '$Verpflegung' OR ";
      if ($Option1 == "1")  $sql .= "optionen.name like 'Tennis'  OR ";
      if ($Option2 == "1")  $sql .= "optionen.name like 'W-Lan'   OR ";
      if ($Option3 == "1")  $sql .= "optionen.name like 'Sauna'   OR ";
      if ($Option4 == "1")  $sql .= "optionen.name like 'Fitness' OR ";
      $sql .= "optionen.name = 'XXX'  ) ";
    }

	
	$result = mysqli_query($dbconn, $sql);
	if(!$result) die("<br><b><font color=red>Abfrage gescheitert: </font></b>".mysqli_error($dbconn));
       // echo "<br><br>... Daten ausgelesen ...";
	   
	   if(mysqli_num_rows($result)==0){echo "Kein Ergebnis gefunden";}
	   else{
   
   echo '<div class="results-container">';
	echo "<b>Ergebnis</b><br><br>";
	echo "<table border=1>";
	echo "<tr>\n";
	echo "<th>Kundennummer</th>\n";
	echo "<th>Vorname</th>\n";
	echo "<th>Nachname</th>\n";
	echo "<th>Strasse</th>\n";
	echo "<th>Ort</th>\n";
	echo "<th>PLZ</th>\n";
	echo "<th>Anrede</th>\n";
	//echo "<th>Telefonnummer</th>\n";
	echo "<th>Buchungsnummer</th>\n";
	echo "<th>Anreise</th>\n";
	echo "<th>Abreise</th>\n";
	echo "<th>Zimmernummer</th>\n";
	echo "<th>Zimmer qm</th>\n";
	echo "</tr>\n";
	while($row = mysqli_fetch_row($result))
	{
  	echo "<tr>";
  	echo "<td align=center>$row[0]</td>\n";
  	echo "<td align=left  >$row[1]</td>\n";
  	echo "<td align=left  >$row[2]</td>\n";
  	echo "<td align=center>$row[3]</td>\n";
  	echo "<td align=left  >$row[4]</td>\n";	
	echo "<td align=left  >$row[5]</td>\n";
	echo "<td align=left  >$row[6]</td>\n";
	echo "<td align=center>$row[8]</td>\n";
	echo "<td align=center>$row[9]</td>\n";
	echo "<td align=center>$row[10]</td>\n";
	echo "<td align=center>$row[11]</td>\n";
	echo "<td align=center>$row[12]</td>\n";
  	echo "</tr>\n";
	}
	echo "</table>";
   
}
}
  }

echo '</form>';
echo "</div>";
exit;
?>
</body>
</html>