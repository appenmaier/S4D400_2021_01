CLASS zcl_00_rental DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        name TYPE string.

    METHODS add_vehicle
      IMPORTING
        vehicle TYPE REF TO zcl_00_vehicle.

    METHODS get_biggest_cargo
      RETURNING VALUE(cargo) TYPE i.

    METHODS print.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA name TYPE string.
    DATA vehicles TYPE z00_tt_vehicles.

ENDCLASS.

CLASS zcl_00_rental IMPLEMENTATION.

  METHOD add_vehicle.
    vehicles = VALUE #( BASE vehicles ( vehicle ) ).
  ENDMETHOD.

  METHOD print.
    WRITE: / name.
    LOOP AT vehicles INTO DATA(vehicle). "Polymorphie
      vehicle->print( ).
    ENDLOOP.
  ENDMETHOD.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD get_biggest_cargo.
    LOOP AT vehicles INTO DATA(vehicle) WHERE table_line IS INSTANCE OF zcl_00_truck.
      DATA truck TYPE REF TO zcl_00_truck.
      truck = CAST #( vehicle ). "Downcast
      IF truck->get_cargo( ) >= cargo.
        cargo = truck->get_cargo( ).
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
