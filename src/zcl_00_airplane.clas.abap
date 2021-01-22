CLASS zcl_00_airplane DEFINITION PUBLIC CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF attribute,
             attribute TYPE string,
             value     TYPE string,
           END OF attribute.
    TYPES attributes TYPE TABLE OF attribute.

    METHODS constructor
      IMPORTING
        name      TYPE string
        planetype TYPE saplane-planetype
      RAISING
        cx_s4d400_wrong_plane.

    METHODS get_attributes
      EXPORTING
        attributes TYPE attributes.

    CLASS-METHODS get_number_of_airplanes
      EXPORTING
        number_of_airplanes TYPE i.

    CLASS-METHODS class_constructor.

  PROTECTED SECTION.
    DATA name TYPE string.
    DATA planetype TYPE saplane-planetype.

  PRIVATE SECTION.
    CLASS-DATA number_of_airplanes TYPE i.
    CLASS-DATA planetypes TYPE TABLE OF saplane.

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

  METHOD constructor.
    IF NOT line_exists( planetypes[ planetype = planetype ] ).
      RAISE EXCEPTION TYPE cx_s4d400_wrong_plane.
    ENDIF.

    me->name = name.
    me->planetype = planetype.
    number_of_airplanes = number_of_airplanes + 1.
  ENDMETHOD.

  METHOD class_constructor.
    SELECT FROM saplane FIELDS * INTO TABLE @planetypes.
  ENDMETHOD.

ENDCLASS.
