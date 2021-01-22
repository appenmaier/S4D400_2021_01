CLASS zcl_00_truck DEFINITION PUBLIC INHERITING FROM zcl_00_vehicle FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        make  TYPE string
        model TYPE string
        cargo TYPE i
      RAISING
        cx_parameter_invalid.

    METHODS get_cargo
      RETURNING VALUE(cargo) TYPE i.

    METHODS print REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA cargo TYPE i.

ENDCLASS.

CLASS zcl_00_truck IMPLEMENTATION.

  METHOD constructor.
    super->constructor( make = make model = model ).
    me->cargo = cargo.
  ENDMETHOD.

  METHOD get_cargo.
    cargo = me->cargo.
  ENDMETHOD.

  METHOD print.
    WRITE: / |{ get_make( ) } { get_model( ) } ({ cargo }t Frachtkapazität)|.
  ENDMETHOD.

ENDCLASS.
