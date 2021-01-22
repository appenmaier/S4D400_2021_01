*&---------------------------------------------------------------------*
*& Report z00_ex_objects
*&---------------------------------------------------------------------*
*& Flugzeuge
*&---------------------------------------------------------------------*
REPORT z00_ex_objects.

"Deklarationen
DATA rental TYPE REF TO zcl_00_rental.
DATA rental2 TYPE REF TO zcl_00_rental.
DATA car TYPE REF TO zcl_00_car.
DATA truck TYPE REF TO zcl_00_truck.
DATA carrier TYPE REF TO zcl_00_carrier.
DATA cargo_plane TYPE REF TO zcl_00_cargo_plane.
DATA passenger_plane TYPE REF TO zcl_00_passenger_plane.

DATA partners TYPE TABLE OF REF TO zif_00_partner_ex.

"Objekterzeugungen
carrier = NEW #( ).
rental = NEW zcl_00_rental( 'Sixxt' ).
rental2 = NEW #( 'Hertz' ).
partners = VALUE #( ( carrier ) ( rental ) ( rental2 ) ).

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

TRY.
    car = NEW #( make = 'Opel' model = 'Zafira Life' seats = 7 ).
    rental->add_vehicle( car ). "impliziter Upcast
  CATCH cx_parameter_invalid INTO DATA(x2).
    WRITE: / x->get_text( ).
ENDTRY.

TRY.
    truck = NEW zcl_00_truck( make = 'MAN' model = 'TGX' cargo = 2 ).
    rental->add_vehicle( truck ). "impliziter Upcast.
  CATCH cx_parameter_invalid INTO x2.
    WRITE: / x->get_text( ).
ENDTRY.

TRY.
    car = NEW #( make = 'Porsche' model = '911' seats = 2 ).
    rental->add_vehicle( car ). "impliziter Upcast
  CATCH cx_parameter_invalid INTO x2.
    WRITE: / x->get_text( ).
ENDTRY.

TRY.
    car = NEW #( make = 'Porsche' model = '911' seats = 2 ).
    rental2->add_vehicle( car ). "impliziter Upcast
  CATCH cx_parameter_invalid INTO x2.
    WRITE: / x->get_text( ).
ENDTRY.

TRY.
    car = NEW #( make = 'Porsche' model = 'Boxter' seats = 2 ).
    rental2->add_vehicle( car ). "impliziter Upcast
  CATCH cx_parameter_invalid INTO x2.
    WRITE: / x->get_text( ).
ENDTRY.

TRY.
    car = NEW #( make = 'Porsche' model = 'Cayman' seats = 4 ).
    rental2->add_vehicle( car ). "impliziter Upcast
  CATCH cx_parameter_invalid INTO x2.
    WRITE: / x->get_text( ).
ENDTRY.

"Ausgabe
LOOP AT partners INTO DATA(partner).
  DATA partner_infos TYPE zif_00_partner_ex=>partner_infos.
  partner_infos = partner->get_partner_info( ).
  WRITE: / |{ partner_infos[ 1 ]-attribute } { partner_infos[ 1 ]-value }|.
  WRITE: / |{ partner_infos[ 2 ]-attribute } { partner_infos[ 2 ]-value }|.
ENDLOOP.
