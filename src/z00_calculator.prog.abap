*&---------------------------------------------------------------------*
*& Report z00_calculator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_calculator.

PARAMETERS operand1 TYPE p LENGTH 16 DECIMALS 2.
PARAMETERS operator TYPE c LENGTH 1.
PARAMETERS operand2 TYPE p LENGTH 16 DECIMALS 2.

DATA result TYPE p LENGTH 16 DECIMALS 2.
DATA output TYPE string.

IF operator <> '+' AND operator <> '-' AND operator <> '*' AND operator <> '/'.
  output = 'Fehler: ungültiger Operator!'.
ENDIF.

IF operator = '/' AND operand2 IS INITIAL.
  output = 'Fehler: Division durch Null!'.
ENDIF.

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
  ENDCASE.
  output = result.
ENDIF.

WRITE output.
