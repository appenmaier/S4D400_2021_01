*&---------------------------------------------------------------------*
*& Report z00_ex_objects
*&---------------------------------------------------------------------*
*& Flugzeuge
*&---------------------------------------------------------------------*
REPORT z00_ex_objects.

"Deklarationen
DATA airplane TYPE REF TO zcl_00_airplane.
DATA airplanes TYPE TABLE OF REF TO zcl_00_airplane.

"Objekterzeugungen
TRY.
    airplane = NEW #( name = 'Flugzeug 1' planetype = '747-400' ).
    airplanes = VALUE #( BASE airplanes ( airplane ) ).
  CATCH cx_s4d400_wrong_plane INTO DATA(x).
    WRITE: / x->get_text( ).
ENDTRY.

TRY.
    airplane = NEW #( name = 'Flugzeug 2' planetype = 'A380-800' ).
    airplanes = VALUE #( BASE airplanes ( airplane ) ).
  CATCH cx_s4d400_wrong_plane INTO x.
    WRITE: / x->get_text( ).
ENDTRY.

TRY.
    airplane = NEW #( name = 'Flugzeug 3' planetype = '747-400' ).
    airplanes = VALUE #( BASE airplanes ( airplane ) ).
  CATCH cx_s4d400_wrong_plane INTO x.
    WRITE: / x->get_text( ).
ENDTRY.

"Ausgabe
LOOP AT airplanes INTO airplane.
  airplane->get_attributes(
    IMPORTING
      attributes = DATA(attributes) ).
  WRITE: / |{ attributes[ 1 ]-value } { attributes[ 2 ]-value }|.
ENDLOOP.
