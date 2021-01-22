CLASS zcl_00_carrier DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_00_partner_ex.

    METHODS add_airplane
      IMPORTING
        airplane TYPE REF TO zcl_00_airplane.

    METHODS get_airplanes
      RETURNING VALUE(airplanes) TYPE z00_tt_airplanes.

    METHODS get_highest_weight
      RETURNING VALUE(weight) TYPE i.

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

  METHOD get_highest_weight.
    LOOP AT airplanes INTO DATA(airplane) WHERE table_line IS INSTANCE OF zcl_00_cargo_plane.
      DATA(cargo_plane) = CAST zcl_00_cargo_plane( airplane ). "Downcast
      IF cargo_plane->get_weight( ) >= weight.
        weight = cargo_plane->get_weight( ).
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD zif_00_partner_ex~get_partner_info.
    partner_info = VALUE #(
      ( attribute = 'TYPE' value = 'CARRIER' )
      ( attribute = 'AIRPLANES' value = lines( airplanes ) ) ).
  ENDMETHOD.

ENDCLASS.
