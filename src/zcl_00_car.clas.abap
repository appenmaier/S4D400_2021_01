CLASS zcl_00_car DEFINITION PUBLIC INHERITING FROM zcl_00_vehicle FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        make  TYPE string
        model TYPE string
        seats TYPE i
      RAISING
        cx_parameter_invalid.

    METHODS get_seats
      RETURNING VALUE(seats) TYPE i.

    METHODS print REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA seats TYPE i.

ENDCLASS.

CLASS zcl_00_car IMPLEMENTATION.

  METHOD constructor.
    super->constructor( make = make model = model ).
    me->seats = seats.
  ENDMETHOD.

  METHOD get_seats.
    seats = me->seats.
  ENDMETHOD.

  METHOD print.
    WRITE: / |{ get_make( ) } { get_model( ) } ({ seats }-Sitzer)|.
  ENDMETHOD.

ENDCLASS.
