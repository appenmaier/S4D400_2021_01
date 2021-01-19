*&---------------------------------------------------------------------*
*& Report z00_demo_0304
*&---------------------------------------------------------------------*
*& Demo 3.4: Verzweigungen
*&---------------------------------------------------------------------*
REPORT z00_demo_0304.

DATA carrier_id TYPE s_carr_id VALUE 'LH'.
DATA flight_date TYPE s_date VALUE '20210118'.

"Vergleichsoperatoren: =, <>, >, >=, <, <=, BETWEEN

"Logische Operatoren: AND, OR, NOT

"Einfachverzweigung
IF NOT ( flight_date >= '20210101' AND flight_date <= '20211231' )
 OR carrier_id = 'LH'.
  WRITE 'X'.
ELSE.
  WRITE '-'.
ENDIF.

IF carrier_id IS NOT INITIAL.
  WRITE 'X'.
ENDIF.

"Mehrfachverzweigung
IF carrier_id = 'LH'.
  WRITE: / 'Lufthansa'.
ELSEIF carrier_id = 'UA'.
  WRITE: / 'United Airlines'.
ELSE.
  WRITE: 'others'.
ENDIF.

CASE carrier_id.
  WHEN 'LH' OR 'lh' OR 'lH' OR 'Lh'.
    WRITE: / 'Lufthansa'.
  WHEN 'UA'.
    WRITE: / 'United Airlines'.
  WHEN OTHERS.
    WRITE: 'others'.
ENDCASE.
