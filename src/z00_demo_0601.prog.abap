*&---------------------------------------------------------------------*
*& Report z00_demo_0601
*&---------------------------------------------------------------------*
*& Demo 6.1: Strukturen
*&---------------------------------------------------------------------*
REPORT z00_demo_0601.

"Deklaration von Strukturen
DATA connection TYPE z00_s_connection.

"Zugriff auf Strukturkomponenten
connection-carrier_id = 'LH'.
connection-connection_id = '0400'.
connection-city_from = 'FRANKFURT'.
connection-city_to = 'NEW YORK'.

WRITE: |Carrier ID: { connection-carrier_id }|.
WRITE: / |Connection ID: { connection-connection_id }|.
WRITE: / |City From: { connection-city_from }|.
WRITE: / |City To: { connection-city_to }|.
