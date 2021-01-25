*&---------------------------------------------------------------------*
*& Report z00_ex_itab
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_ex_itab.

"Definitionen und Deklarationen
DATA connections TYPE z00_connections.
DATA flights TYPE z00_flights.
DATA flights_xt TYPE d400_t_percentage.

"Hauptverarbeitung
connections = VALUE #(
        ( carrid = 'LH' connid = '0400' )
        ( carrid = 'LH' connid = '0402' ) ).

CALL FUNCTION 'Z_00_GET_FLIGHTS'
  EXPORTING
    connections = connections
  IMPORTING
    flights     = flights
  EXCEPTIONS
    no_data     = 1
    OTHERS      = 2.
IF sy-subrc <> 0.
  WRITE: / 'Fehler: keine Daten gefunden'.
ENDIF.

flights_xt = CORRESPONDING #( flights ).

LOOP AT flights_xt REFERENCE INTO DATA(flight_xt).
  flight_xt->percentage = flight_xt->seatsocc / flight_xt->seatsmax * 100.
ENDLOOP.

SORT flights_xt BY percentage DESCENDING.

"Ausgabe
LOOP AT flights_xt REFERENCE INTO flight_xt.
  WRITE: / |{ flight_xt->carrid } { flight_xt->connid } { flight_xt->fldate }: { flight_xt->percentage }%|.
ENDLOOP.
