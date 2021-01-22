*&---------------------------------------------------------------------*
*& Report z00_demo_vehicles
*&---------------------------------------------------------------------*
*& Fahrzeuge
*&---------------------------------------------------------------------*
REPORT z00_demo_vehicles.

"Deklarationen
DATA vehicle TYPE REF TO zcl_00_vehicle.
DATA car TYPE REF TO zcl_00_car.
DATA vehicles TYPE TABLE OF REF TO zcl_00_vehicle.

"Objekterzeugungen
WRITE: / |Anz. Fahrzeuge: { zcl_00_vehicle=>get_number_of_vehicles( ) }|.

TRY.
    car = NEW #( make = 'Opel' model = 'Zafira Life' seats = 7 ).
    vehicles = VALUE #( BASE vehicles ( car ) ). "Upcast
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
    car = NEW #( make = 'Porsche' model = '911' seats = 2 ).
    vehicles = VALUE #( BASE vehicles ( car ) ). "Upcast
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
