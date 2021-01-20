*&---------------------------------------------------------------------*
*& Report z00_exkurs_abap_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_demo_0306.

**********************************************************************
* Definitionen und Deklarationen
**********************************************************************
PARAMETERS carrid TYPE s_carr_id.
PARAMETERS connid TYPE s_conn_id.
PARAMETERS fldate TYPE s_date.

PARAMETERS chckbx AS CHECKBOX.

PARAMETERS rdbtn_a RADIOBUTTON GROUP grp1.
PARAMETERS rdbtn_b RADIOBUTTON GROUP grp1.
PARAMETERS rdbtn_c RADIOBUTTON GROUP grp1.


**********************************************************************
* Dynamische Vorbelegungen
**********************************************************************
INITIALIZATION.
  IF sy-langu = 'D'.
    carrid = 'LH'.
  ENDIF.


**********************************************************************
* Eingabeprüfungen
**********************************************************************
AT SELECTION-SCREEN ON carrid.
  IF carrid IS INITIAL.
    MESSAGE 'carrid is initial' TYPE 'E'.
  ENDIF.

AT SELECTION-SCREEN ON connid.
  IF connid IS INITIAL.
    MESSAGE 'connid is initial' TYPE 'E'.
  ENDIF.


**********************************************************************
* Hauptverarbeitung
**********************************************************************
START-OF-SELECTION.
  IF chckbx = 'X'.
    IF rdbtn_a = 'X'.
      WRITE carrid.
    ENDIF.
    IF rdbtn_b = 'X'.
      WRITE connid.
    ENDIF.
    IF rdbtn_c = 'X'.
      WRITE fldate.
    ENDIF.
  ELSE.
    WRITE: carrid, connid, fldate.
  ENDIF.
