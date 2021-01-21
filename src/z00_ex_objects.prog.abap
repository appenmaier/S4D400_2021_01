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
airplane = NEW #( ).
airplane->set_attributes( name = 'Flugzeug 1' planetype = '747-400' ).
airplanes = VALUE #( BASE airplanes ( airplane ) ).

airplane = NEW #( ).
airplane->set_attributes( name = 'Flugzeug 2' planetype = 'A380-800' ).
airplanes = VALUE #( BASE airplanes ( airplane ) ).

airplane = NEW #( ).
airplane->set_attributes( name = 'Flugzeug 3' planetype = '747-400' ).
airplanes = VALUE #( BASE airplanes ( airplane ) ).

"Ausgabe
LOOP AT airplanes INTO airplane.
  airplane->get_attributes(
    IMPORTING
      attributes = DATA(attributes) ).
  WRITE: / |{ attributes[ 1 ]-value } { attributes[ 2 ]-value }|.
ENDLOOP.
