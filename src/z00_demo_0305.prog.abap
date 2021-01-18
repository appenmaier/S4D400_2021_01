*&---------------------------------------------------------------------*
*& Report z00_demo_0305
*&---------------------------------------------------------------------*
*& Demo 3.5: Zeichenketten
*&---------------------------------------------------------------------*
REPORT z00_demo_0305.

DATA text TYPE string VALUE 'Hallo'.
DATA text2 TYPE string VALUE 'Welt'.
DATA text3 TYPE string.

"Verknüpfung mehrerer Zeichenketten
text3 = text && | | && text2 && '!'.
WRITE text3.

"Verwenden eines Zeichenketten-Templates
text3 = |{ text } { text2 }!|.
WRITE: / text3.

"Zeichenkettenfunktionen
DATA result TYPE i.

result = strlen( text3 ). "Zeichenkettenlänge bestimmen
WRITE: / result.
text3 = replace( val = text3 sub = '!' with = '.' ). "Ersetzen
WRITE: / text3.

SPLIT text3 AT | | INTO text text2. "Aufteilen
WRITE: / text.
WRITE: / text2.
