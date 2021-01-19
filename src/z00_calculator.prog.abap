*&---------------------------------------------------------------------*
*& Report z00_calculator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_calculator.

"Deklarationen
PARAMETERS operand1 TYPE p LENGTH 16 DECIMALS 2.
PARAMETERS operator TYPE c LENGTH 1.
PARAMETERS operand2 TYPE p LENGTH 16 DECIMALS 2.

DATA result TYPE p LENGTH 16 DECIMALS 2.
DATA output TYPE string.

"Eingabeprüfungen
IF operator <> '+' AND operator <> '-'
 AND operator <> '*' AND operator <> '/' AND operator <> '%'.
  output = 'Fehler: ungültiger Operator'.
ENDIF.

IF operator = '/' AND operand2 IS INITIAL.
  output = 'Fehler: Division durch Null'.
ENDIF.

"Hauptverarbeitung
IF output IS INITIAL.
  CASE operator.
    WHEN '+'.
      result = operand1 + operand2.
    WHEN '-'.
      result = operand1 - operand2.
    WHEN '*'.
      result = operand1 * operand2.
    WHEN '/'.
      result = operand1 / operand2.
    WHEN '%'.
      DATA tmp1 TYPE i.
      DATA tmp2 TYPE i.
      tmp1 = operand1.
      tmp2 = operand2.
      CALL FUNCTION 'S4D400_CALCULATE_PERCENTAGE'
        EXPORTING
          iv_int1          = tmp1
          iv_int2          = tmp2
        IMPORTING
          ev_result        = result
        EXCEPTIONS
          division_by_zero = 1
          OTHERS           = 2.
      IF sy-subrc <> 0.
        output = 'Fehler: Division durch Null'.
      ENDIF.
  ENDCASE.
  output = result.
ENDIF.

"Ausgabe
WRITE output.
