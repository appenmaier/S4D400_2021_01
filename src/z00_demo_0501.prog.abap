*&---------------------------------------------------------------------*
*& Report z00_demo_0501
*&---------------------------------------------------------------------*
*& Demo 5.1: Funktionsbausteine
*&---------------------------------------------------------------------*
REPORT z00_demo_0501.

"Deklarationen
PARAMETERS carrid TYPE s_carr_id.
PARAMETERS connid TYPE s_conn_id.

DATA carrier_id TYPE s_carr_id.
DATA connection_id TYPE s_conn_id.
DATA output TYPE string.

"Schreiben
CALL FUNCTION 'Z_00_SET_FLIGHT'
  EXPORTING
    carrier_id         = carrid
    connection_id      = connid
  EXCEPTIONS
    initial_parameters = 1
    OTHERS             = 2.
IF sy-subrc <> 0.
  output = 'Fehler: initiale Parameter'.
ENDIF.

"Lesen
IF output IS INITIAL.
  CALL FUNCTION 'Z_00_GET_FLIGHT'
    IMPORTING
      carrier_id    = carrier_id
      connection_id = connection_id.

  output = |{ carrier_id } { connection_id }|.
ENDIF.

"Ausgabe
WRITE output.
