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
airplanes = VALUE #( BASE airplanes ( airplane ) ).
airplane = NEW #( ).
airplanes = VALUE #( BASE airplanes ( airplane ) ).
airplane = NEW #( ).
airplanes = VALUE #( BASE airplanes ( airplane ) ).
