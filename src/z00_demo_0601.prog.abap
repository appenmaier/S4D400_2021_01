*&---------------------------------------------------------------------*
*& Report z00_demo_0601
*&---------------------------------------------------------------------*
*& Demo 6.1: Strukturen
*&---------------------------------------------------------------------*
REPORT z00_demo_0601.

"Definition von lokalen Strukturtypen
TYPES: BEGIN OF connection_xt,
         carrier_id    TYPE s_carr_id,
         carrier_name  TYPE s_carrname,
         connection_id TYPE s_conn_id,
         city_from     TYPE s_from_cit,
         city_to       TYPE s_to_city,
       END OF connection_xt.

"Deklaration von Strukturen
DATA connection TYPE z00_s_connection.
DATA carrier TYPE z00_s_carrier.
DATA connection_xt TYPE connection_xt.

"Zugriff auf Strukturkomponenten
connection-carrier_id = 'LH'.
connection-connection_id = '0400'.
connection-city_from = 'FRANKFURT'.
connection-city_to = 'NEW YORK'.

carrier-carrier_id = 'LH'.
carrier-carrier_name = 'Lufthansa'.

WRITE: |Kürzel der Fluggesellschaft: { connection-carrier_id }|.
WRITE: / |Verbindungsnummer: { connection-connection_id }|.
WRITE: / |Abflugstadt: { connection-city_from }|.
WRITE: / |Ankunftstadt: { connection-city_to }|.

"Kopieren namensgleicher Strukturkomponenten
connection_xt = CORRESPONDING #( connection ).
connection_xt = CORRESPONDING #( BASE ( connection_xt ) carrier ).
