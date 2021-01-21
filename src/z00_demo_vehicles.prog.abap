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
    vehicle = NEW #( make = 'Opel' model = 'Zafira Life' ).
    vehicles = VALUE #( BASE vehicles ( vehicle ) ).
  CATCH cx_parameter_invalid INTO DATA(x).
    WRITE: / x->get_text( ).
ENDTRY.

TRY.
    vehicle = NEW #( make = 'MAN' model = 'TGX' ).
    vehicles = VALUE #( BASE vehicles ( vehicle ) ).
  CATCH cx_parameter_invalid INTO x.
    WRITE: / x->get_text( ).
ENDTRY.

TRY.
    vehicle = NEW #( make = 'Porsche' model = '911' ).
    vehicles = VALUE #( BASE vehicles ( vehicle ) ).
  CATCH cx_parameter_invalid INTO x.
    WRITE: / x->get_text( ).
ENDTRY.

TRY.
    vehicle = NEW #( make = '' model = '' ).
    vehicles = VALUE #( BASE vehicles ( vehicle ) ).
  CATCH cx_parameter_invalid INTO x.
    WRITE: / x->get_text( ).
ENDTRY.

WRITE: / |Anz. Fahrzeuge: { zcl_00_vehicle=>get_number_of_vehicles( ) }|.

"Ausgabe
LOOP AT vehicles INTO vehicle.
  vehicle->print( ).
ENDLOOP.
