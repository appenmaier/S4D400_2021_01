CLASS zcl_00_vehicle DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        make  TYPE string
        model TYPE string
      RAISING
        cx_parameter_invalid.

    METHODS get_make
      RETURNING VALUE(make) TYPE string.

    METHODS get_model
      RETURNING VALUE(model) TYPE string.

    METHODS print.

    CLASS-METHODS get_number_of_vehicles
      RETURNING VALUE(number_of_vehicles) TYPE i.

    CLASS-METHODS class_constructor.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA make TYPE string.
    DATA model TYPE string.
    CLASS-DATA number_of_vehicles TYPE i.

ENDCLASS.

CLASS zcl_00_vehicle IMPLEMENTATION.

  METHOD get_make.
    make = me->make.
  ENDMETHOD.

  METHOD get_model.
    model = me->model.
  ENDMETHOD.

  METHOD print.
    WRITE: / |{ make } { model }|.
  ENDMETHOD.

  METHOD get_number_of_vehicles.
    number_of_vehicles = zcl_00_vehicle=>number_of_vehicles.
  ENDMETHOD.

  METHOD constructor.
    IF make IS INITIAL.
      RAISE EXCEPTION TYPE cx_parameter_invalid
        EXPORTING
          parameter = 'MAKE'.
    ENDIF.

    IF model IS INITIAL.
      RAISE EXCEPTION TYPE cx_parameter_invalid
        EXPORTING
          parameter = 'MODEL'.
    ENDIF.

    me->make = make.
    me->model = model.
    number_of_vehicles = number_of_vehicles + 1.
  ENDMETHOD.

  METHOD class_constructor.
    WRITE: / |Klassenkonstruktor|.
  ENDMETHOD.

ENDCLASS.
