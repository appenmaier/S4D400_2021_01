*&---------------------------------------------------------------------*
*& Report z00_demo_0201
*&---------------------------------------------------------------------*
*& Demo 2.1: Hello World
*&---------------------------------------------------------------------*
REPORT z00_demo_0201.

DATA text TYPE string. "Deklaration
text = 'Hallo'. "Wertzuweisung
WRITE: text, 'Welt!'. "Ausgabe mit Hilfe des Kettensatzes (: ,)
