CLASS zcl_00_travel_agency DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        name TYPE string.

    METHODS add_partner
      IMPORTING
        partner TYPE REF TO zif_00_partner.

    METHODS print.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA name TYPE string.
    DATA partners TYPE TABLE OF REF TO zif_00_partner.

ENDCLASS.

CLASS zcl_00_travel_agency IMPLEMENTATION.

  METHOD add_partner.
    partners = VALUE #( BASE partners ( partner ) ).
  ENDMETHOD.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD print.
    WRITE: / name.
    WRITE: / 'Unsere Partner: '.
    LOOP AT partners INTO DATA(partner). "Polymorphie
      partner->print( ).
      IF partner IS INSTANCE OF zcl_00_rental.
        DATA(rental) = CAST zcl_00_rental( partner ). "Downcast
        WRITE: / |Größte Frachtkapzität: { rental->get_biggest_cargo( ) }t|.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
