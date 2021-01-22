*&---------------------------------------------------------------------*
*& Report z00_ex_objects
*&---------------------------------------------------------------------*
*& Flugzeuge
*&---------------------------------------------------------------------*
REPORT z00_ex_objects.

"Deklarationen
DATA airplane TYPE REF TO zcl_00_airplane.
DATA cargo_plane TYPE REF TO zcl_00_cargo_plane.
DATA passenger_plane TYPE REF TO zcl_00_passenger_plane.
DATA carrier TYPE REF TO zcl_00_carrier.
DATA airplanes TYPE TABLE OF REF TO zcl_00_airplane.

"Objekterzeugungen
carrier = NEW #( ).

TRY.
    cargo_plane = NEW #( name = 'Flugzeug 1' planetype = '757F' weight = 500 ).
    carrier->add_airplane( cargo_plane ). "impliziter Upcast
  CATCH cx_s4d400_wrong_plane INTO DATA(x).
    WRITE: / x->get_text( ).
ENDTRY.

TRY.
    passenger_plane = NEW #( name = 'Flugzeug 2' planetype = 'A380-800' seats = 800 ).
    carrier->add_airplane( passenger_plane ). "impliziter Upcast
  CATCH cx_s4d400_wrong_plane INTO x.
    WRITE: / x->get_text( ).
ENDTRY.

TRY.
    cargo_plane = NEW #( name = 'Flugzeug 3' planetype = '757F' weight = 1000 ).
    carrier->add_airplane( cargo_plane ). "impliziter Upcast
  CATCH cx_s4d400_wrong_plane INTO x.
    WRITE: / x->get_text( ).
ENDTRY.

"Ausgabe
airplanes = carrier->get_airplanes( ).

LOOP AT airplanes INTO airplane.
  airplane->get_attributes(
    IMPORTING
      attributes = DATA(attributes) ).
  WRITE: / |{ attributes[ 1 ]-value } { attributes[ 2 ]-value }|.
ENDLOOP.

WRITE: / |Größtes Gewicht: { carrier->get_highest_weight( ) }kg|.
