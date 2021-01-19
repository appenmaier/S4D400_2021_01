FUNCTION z_00_get_flights.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(CONNECTIONS) TYPE  Z00_CONNECTIONS
*"  EXPORTING
*"     REFERENCE(FLIGHTS) TYPE  Z00_FLIGHTS
*"  EXCEPTIONS
*"      NO_DATA
*"----------------------------------------------------------------------
  LOOP AT connections INTO DATA(connection).
    SELECT FROM sflight FIELDS *
     WHERE carrid = @connection-carrid AND connid = @connection-connid
     INTO TABLE @DATA(tmp).
    IF sy-subrc <> 0.
      RAISE no_data.
    ENDIF.
    flights = CORRESPONDING #( BASE ( flights ) tmp ).
  ENDLOOP.

ENDFUNCTION.
