*&---------------------------------------------------------------------*
*& Report z00_demo_0302
*&---------------------------------------------------------------------*
*& Demo 3.2: Eingabeparameter
*&---------------------------------------------------------------------*
REPORT z00_demo_0302.

"Eingabe
PARAMETERS carrid TYPE s_carr_id.
PARAMETERS connid TYPE s_conn_id.

"Ausgabe
WRITE: carrid, connid.
