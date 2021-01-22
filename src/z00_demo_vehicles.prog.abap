*&---------------------------------------------------------------------*
*& Report z00_demo_vehicles
*&---------------------------------------------------------------------*
*& Fahrzeuge
*&---------------------------------------------------------------------*
REPORT z00_demo_vehicles.

"Deklarationen
DATA rental TYPE REF TO zcl_00_rental.
DATA car TYPE REF TO zcl_00_car.
DATA truck TYPE REF TO zcl_00_truck.

"Objekterzeugungen
WRITE: / |Anz. Fahrzeuge: { zcl_00_vehicle=>get_number_of_vehicles( ) }|.

rental = NEW zcl_00_rental( 'Sixxt' ).

TRY.
    car = NEW #( make = 'Opel' model = 'Zafira Life' seats = 7 ).
    rental->add_vehicle( car ). "impliziter Upcast
  CATCH cx_parameter_invalid INTO DATA(x).
    WRITE: / x->get_text( ).
ENDTRY.

TRY.
    truck = NEW zcl_00_truck( make = 'MAN' model = 'TGX' cargo = 2 ).
    rental->add_vehicle( truck ). "impliziter Upcast.
  CATCH cx_parameter_invalid INTO x.
    WRITE: / x->get_text( ).
ENDTRY.

TRY.
    car = NEW #( make = 'Porsche' model = '911' seats = 2 ).
    rental->add_vehicle( car ). "impliziter Upcast
  CATCH cx_parameter_invalid INTO x.
    WRITE: / x->get_text( ).
ENDTRY.

WRITE: / |Anz. Fahrzeuge: { zcl_00_vehicle=>get_number_of_vehicles( ) }|.

"Ausgabe
rental->print( ).
WRITE: / |Größte Frachtkapzität: { rental->get_biggest_cargo( ) }t|.
