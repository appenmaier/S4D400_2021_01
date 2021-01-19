FUNCTION z_00_get_next_flight.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(CARRIER_ID) TYPE  S_CARR_ID
*"     REFERENCE(CONNECTION_ID) TYPE  S_CONN_ID
*"  EXPORTING
*"     REFERENCE(FLIGHT) TYPE  Z00_FLIGHT
*"  EXCEPTIONS
*"      NO_DATA
*"----------------------------------------------------------------------
  DATA flights TYPE TABLE OF z00_flight.

  SELECT FROM sflight FIELDS *
   WHERE carrid = @carrier_id AND connid = @connection_id
   ORDER BY fldate
   INTO CORRESPONDING FIELDS OF TABLE @flights.
  IF sy-subrc <> 0.
    RAISE no_data.
  ENDIF.

  flight = flights[ 1 ].

ENDFUNCTION.
