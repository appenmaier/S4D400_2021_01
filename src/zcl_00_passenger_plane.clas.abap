CLASS zcl_00_passenger_plane DEFINITION PUBLIC INHERITING FROM zcl_00_airplane FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS get_attributes REDEFINITION.

    METHODS constructor
      IMPORTING
        name      TYPE string
        planetype TYPE saplane-planetype
        seats     TYPE i
      RAISING
        cx_s4d400_wrong_plane.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA seats TYPE i.

ENDCLASS.

CLASS zcl_00_passenger_plane IMPLEMENTATION.

  METHOD get_attributes.
    attributes = VALUE #( BASE attributes
        ( attribute = 'NAME' value = name )
        ( attribute = 'PLANETYPE' value = planetype )
        ( attribute = 'SEATS' value = seats ) ).
  ENDMETHOD.

  METHOD constructor.
    super->constructor( name = name planetype = planetype ).
    me->seats = seats.
  ENDMETHOD.

ENDCLASS.
