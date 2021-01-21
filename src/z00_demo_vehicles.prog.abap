*&---------------------------------------------------------------------*
*& Report z00_demo_vehicles
*&---------------------------------------------------------------------*
*& Fahrzeuge
*&---------------------------------------------------------------------*
REPORT z00_demo_vehicles.

"Deklarationen
DATA vehicle TYPE REF TO zcl_00_vehicle.
DATA vehicles TYPE TABLE OF REF TO zcl_00_vehicle.

"Objekterzeugungen
WRITE: / |Anz. Fahrzeuge: { zcl_00_vehicle=>get_number_of_vehicles( ) }|.

TRY.
    vehicle = NEW #( ).
    vehicle->set_make( 'Opel' ).
    vehicle->set_model( 'Zafira Life' ).
    zcl_00_vehicle=>increase_number_of_vehicles( ).
    vehicles = VALUE #( BASE vehicles ( vehicle ) ).
  CATCH cx_parameter_invalid INTO DATA(x).
    WRITE: / x->get_text( ).
ENDTRY.

TRY.
    vehicle = NEW #( ).
    vehicle->set_make( 'MAN' ).
    vehicle->set_model( 'TGX' ).
    zcl_00_vehicle=>increase_number_of_vehicles( ).
    vehicles = VALUE #( BASE vehicles ( vehicle ) ).
  CATCH cx_parameter_invalid INTO x.
    WRITE: / x->get_text( ).
ENDTRY.

TRY.
    vehicle = NEW #( ).
    vehicle->set_make( 'Porsche' ).
    vehicle->set_model( '911' ).
    zcl_00_vehicle=>increase_number_of_vehicles( ).
    vehicles = VALUE #( BASE vehicles ( vehicle ) ).
  CATCH cx_parameter_invalid INTO x.
    WRITE: / x->get_text( ).
ENDTRY.

TRY.
    vehicle = NEW #( ).
    vehicle->set_make( '' ).
    vehicle->set_model( '' ).
    zcl_00_vehicle=>increase_number_of_vehicles( ).
    vehicles = VALUE #( BASE vehicles ( vehicle ) ).
  CATCH cx_parameter_invalid INTO x.
    WRITE: / x->get_text( ).
ENDTRY.

WRITE: / |Anz. Fahrzeuge: { zcl_00_vehicle=>get_number_of_vehicles( ) }|.

"Ausgabe
LOOP AT vehicles INTO vehicle.
  vehicle->print( ).
ENDLOOP.
