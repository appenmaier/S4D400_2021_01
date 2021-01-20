*&---------------------------------------------------------------------*
*& Report z00_demo_0801
*&---------------------------------------------------------------------*
*& Demo 8.1: Lesen von Datensätzen
*&---------------------------------------------------------------------*
REPORT z00_demo_0801.

PARAMETERS carrid TYPE s_carr_id.

DATA carrier TYPE scarr.
DATA carriers TYPE TABLE OF scarr.

* SELECT FROM <Datenbanktabelle/Datenbankview>
*  FIELDS <Spalte 1>, <Spalte 2>,...<Spalte n>
*  WHERE <Bedingung>
*  INTO @<Zielvariable>.
* IF sy-subrc <> 0.
* ENDIF.

"Lesen eines Einzelsatzes
SELECT SINGLE FROM scarr
 FIELDS *
 WHERE carrid = @carrid
 INTO @carrier.
IF sy-subrc <> 0.
  WRITE: / 'Fehler: keine Daten gefunden'.
ENDIF.

"Lesen mehrerer Datensätze
SELECT FROM scarr
 FIELDS *
 INTO TABLE @carriers.
IF sy-subrc <> 0.
  WRITE: / 'Fehler: keine Daten gefunden'.
ENDIF.
