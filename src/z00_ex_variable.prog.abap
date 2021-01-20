*&---------------------------------------------------------------------*
*& Report z00_ex_variable
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_ex_variable.

PARAMETERS greettxt TYPE string LOWER CASE.

DATA greeting_text TYPE string.
greeting_text = greettxt.

WRITE greeting_text.
