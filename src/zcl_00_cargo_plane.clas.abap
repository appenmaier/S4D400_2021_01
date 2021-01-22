CLASS zcl_00_cargo_plane DEFINITION PUBLIC INHERITING FROM zcl_00_airplane FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS get_attributes REDEFINITION.

    METHODS constructor
      IMPORTING
        name      TYPE string
        planetype TYPE saplane-planetype
        weight    TYPE i
      RAISING
        cx_s4d400_wrong_plane.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA weight TYPE i.

ENDCLASS.

CLASS zcl_00_cargo_plane IMPLEMENTATION.

  METHOD get_attributes.
    super->get_attributes(
      IMPORTING
        attributes = attributes ).
    attributes = VALUE #( BASE attributes
        ( attribute = 'WEIGHT' value = weight ) ).
  ENDMETHOD.

  METHOD constructor.
    super->constructor( name = name planetype = planetype ).
    me->weight = weight.
  ENDMETHOD.

ENDCLASS.
