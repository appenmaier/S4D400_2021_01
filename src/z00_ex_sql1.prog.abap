*&---------------------------------------------------------------------*
*& Report z00_ex_sql1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_ex_sql1.

"Definitionen und Deklarationen
PARAMETERS carrid TYPE d400_s_flight-carrid. "TYPE s_carr_id.
PARAMETERS connid TYPE d400_s_flight-connid. "TYPE s_conn_id.
PARAMETERS fldate TYPE d400_s_flight-fldate. "TYPE s_date.

DATA flight TYPE d400_s_flight.

"Hauptverarbeitung
SELECT SINGLE FROM sflight
 FIELDS carrid, connid, fldate, planetype, seatsmax, seatsocc
 WHERE carrid = @carrid AND connid = @connid AND fldate = @fldate
 INTO @flight.
IF sy-subrc <> 0.
  WRITE: / 'Fehler: keine Daten gefunden'.
ENDIF.

SELECT SINGLE FROM sflight
 FIELDS *
 WHERE carrid = @carrid AND connid = @connid AND fldate = @fldate
 INTO CORRESPONDING FIELDS OF @flight.
IF sy-subrc <> 0.
  WRITE: / 'Fehler: keine Daten gefunden'.
ENDIF.

"Ausgabe
WRITE: / |{ flight-planetype } { flight-seatsmax } { flight-seatsocc }|.
