CLASS zcl_00_airplane DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF attribute,
             attribute TYPE string,
             value     TYPE string,
           END OF attribute.
    TYPES attributes TYPE TABLE OF attribute.

    METHODS set_attributes
      IMPORTING
        name      TYPE string
        planetype TYPE saplane-planetype.

    METHODS get_attributes
      EXPORTING
        attributes TYPE attributes.

    CLASS-METHODS get_number_of_airplanes
      EXPORTING
        number_of_airplanes TYPE i.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA name TYPE string.
    DATA planetype TYPE saplane-planetype.
    CLASS-DATA number_of_airplanes TYPE i.

ENDCLASS.

CLASS zcl_00_airplane IMPLEMENTATION.

  METHOD get_attributes.
    attributes = VALUE #(
        ( attribute = 'NAME' value = name )
        ( attribute = 'PLANETYPE'  value = planetype ) ).
  ENDMETHOD.

  METHOD get_number_of_airplanes.
    number_of_airplanes = zcl_00_airplane=>number_of_airplanes.
  ENDMETHOD.

  METHOD set_attributes.
    me->name = name.
    me->planetype = planetype.
    number_of_airplanes = number_of_airplanes + 1.
  ENDMETHOD.

ENDCLASS.
