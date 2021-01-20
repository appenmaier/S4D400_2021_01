*&---------------------------------------------------------------------*
*& Report z00_demo_0802
*&---------------------------------------------------------------------*
*& Demo 8.2: Definition der Zielvariablen
*&---------------------------------------------------------------------*
REPORT z00_demo_0802.

PARAMETERS carrid TYPE s_carr_id.

DATA carrier TYPE z00_carrier.

"Angabe passender Felder
SELECT SINGLE FROM scarr
 FIELDS carrid, carrname
 WHERE carrid = @carrid
 INTO @carrier.
IF sy-subrc <> 0.
  WRITE: / 'Fehler: keine Daten gefunden'.
ENDIF.

"Kopieren namensgleicher Komponenten
SELECT SINGLE FROM scarr
 FIELDS *
 WHERE carrid = @carrid
 INTO CORRESPONDING FIELDS OF @carrier.
IF sy-subrc <> 0.
  WRITE: / 'Fehler: keine Daten gefunden'.
ENDIF.

"Inlinedeklaration
SELECT SINGLE FROM scarr
 FIELDS carrid, carrname, currcode
 WHERE carrid = @carrid
 INTO @DATA(carrier2).
IF sy-subrc <> 0.
  WRITE: / 'Fehler: keine Daten gefunden'.
ENDIF.
