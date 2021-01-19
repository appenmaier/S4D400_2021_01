FUNCTION z_00_set_flight.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(CARRIER_ID) TYPE  S_CARR_ID
*"     REFERENCE(CONNECTION_ID) TYPE  S_CONN_ID
*"  EXCEPTIONS
*"      INITIAL_PARAMETERS
*"----------------------------------------------------------------------
  "Fehlerbehandlung
  IF carrier_id IS INITIAL OR connection_id IS INITIAL.
    RAISE initial_parameters.
  ENDIF.

  "Programmlogik
  carrid = carrier_id.
  connid = connection_id.

ENDFUNCTION.
