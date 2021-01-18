*&---------------------------------------------------------------------*
*& Report z00_variable
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_variable.

PARAMETERS greettxt TYPE string LOWER CASE.

DATA greeting_text TYPE string.
greeting_text = greettxt.

WRITE greeting_text.
