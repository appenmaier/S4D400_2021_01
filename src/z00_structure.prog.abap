*&---------------------------------------------------------------------*
*& Report z00_structure
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_structure.

"Definitionen und Deklarationen
TYPES: BEGIN OF connection_xt,
         carrid    TYPE s_carr_id,
         connid    TYPE s_conn_id,
         cityfrom  TYPE s_from_cit,
         cityto    TYPE s_to_city,
         fldate    TYPE s_date,
         planetype TYPE s_planetye,
         seatsmax  TYPE s_seatsmax,
         seatsocc  TYPE s_seatsocc,
       END OF connection_xt.

DATA connection TYPE z00_connection.
DATA flight TYPE z00_flight.
DATA connection_xt TYPE connection_xt.

"Hauptverarbeitung
connection-carrid = 'LH'.
connection-connid = '0400'.
connection-cityfrom = 'FRANKFURT'.
connection-cityto = 'NEW YORK'.

CALL FUNCTION 'Z_00_GET_NEXT_FLIGHT'
  EXPORTING
    carrier_id    = connection-carrid
    connection_id = connection-connid
  IMPORTING
    flight        = flight
  EXCEPTIONS
    no_data       = 1
    OTHERS        = 2.
IF sy-subrc <> 0.
  WRITE 'Fehler: keine Daten'.
ENDIF.

connection_xt = CORRESPONDING #( connection ).
connection_xt = CORRESPONDING #( BASE ( connection_xt ) flight ).

"Ausgabe
WRITE: |Carrier ID: { connection_xt-carrid }|.
WRITE: / |Connection ID: { connection_xt-connid }|.
WRITE: / |City From: { connection_xt-cityfrom }|.
WRITE: / |City To: { connection_xt-cityto }|.
WRITE: / |Flight Date: { connection_xt-fldate }|.
WRITE: / |Planetype: { connection_xt-planetype }|.
WRITE: / |Max. Seats: { connection_xt-seatsmax }|.
WRITE: / |Occ. Seats: { connection_xt-seatsocc }|.
