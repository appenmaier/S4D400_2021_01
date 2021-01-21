*&---------------------------------------------------------------------*
*& Report z00_ex_sql2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_ex_sql2.

"Definitionen und Deklarationen
PARAMETERS carrid TYPE d400_s_flight-carrid. "TYPE s_carr_id.
PARAMETERS connid TYPE d400_s_flight-connid. "TYPE s_conn_id.

DATA flights TYPE d400_t_flights.

"Hauptverarbeitung
SELECT FROM sflight
 FIELDS *
 WHERE carrid = @carrid AND connid = @connid
 INTO CORRESPONDING FIELDS OF TABLE @flights.
IF sy-subrc <> 0.
  WRITE: / 'Fehler: keine Daten gefunden'.
ENDIF.

"Ausgabe
LOOP AT flights INTO DATA(flight).
  WRITE: / |{ flight-fldate } { flight-planetype } { flight-seatsmax } { flight-seatsocc }|.
ENDLOOP.
