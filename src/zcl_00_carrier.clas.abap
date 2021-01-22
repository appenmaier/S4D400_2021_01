CLASS zcl_00_carrier DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS add_airplane
      IMPORTING
        airplane TYPE REF TO zcl_00_airplane.

    METHODS get_airplanes
      RETURNING VALUE(airplanes) TYPE z00_tt_airplanes.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA airplanes TYPE z00_tt_airplanes.

ENDCLASS.

CLASS zcl_00_carrier IMPLEMENTATION.

  METHOD add_airplane.
    airplanes = VALUE #( BASE airplanes ( airplane ) ).
  ENDMETHOD.

  METHOD get_airplanes.
    airplanes = me->airplanes.
  ENDMETHOD.

ENDCLASS.
