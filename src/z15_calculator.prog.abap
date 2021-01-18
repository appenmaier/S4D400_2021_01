*&---------------------------------------------------------------------*
*& Report z15_calculator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z15_calculator.

PARAMETERS zahl1 TYPE p LENGTH 16 DECIMALS 2.
PARAMETERS zahl2 TYPE p LENGTH 16 DECIMALS 2.
PARAMETERS operator TYPE c LENGTH 1.

DATA ergebnis TYPE p LENGTH 16 DECIMALS 2.
DATA ausgabe TYPE string.

IF operator <> '+' OR operator <> '-' OR operator <> '*' OR operator <> '/'.
   ausgabe = 'ungültiger Operator'.
ENDIF.

IF operator = '/' AND zahl2 IS INITIAL.
        ausgabe = 'Fehler, zahl2 darf nicht 0 sein'.
ENDIF.

IF ausgabe IS INITIAL.
        CASE operator.
          WHEN '+'.
            ergebnis = zahl1 + zahl2.
          WHEN '-'.
            ergebnis = zahl1 - zahl2.
          WHEN '*'.
            ergebnis = zahl1 * zahl2.
          WHEN '/'.
            ergebnis = zahl1 / zahl2.
        ENDCASE.
        ausgabe = ergebnis.

ENDIF.

WRITE ausgabe.
