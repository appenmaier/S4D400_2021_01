*&---------------------------------------------------------------------*
*& Report z00_demo_0702
*&---------------------------------------------------------------------*
*& Demo 7.2: Einspaltige Tabellen
*&---------------------------------------------------------------------*
REPORT z00_demo_0702.

"Einspaltige Tabellen
DATA carrier_ids TYPE TABLE OF s_carr_id.
carrier_ids = VALUE #( ( |LH| ) ( |AA| ) ( |UA| ) ( |BA| ) ( |SQ| ) ).

IF line_exists( carrier_ids[ table_line = 'UA' ] ).
  WRITE: / |Der Eintrag existiert|.
ENDIF.

"SPLIT
DATA(text) = |Eins Zwei Drei View Fünf|.
SPLIT text AT | | INTO TABLE DATA(texts).

IF line_exists( texts[ table_line = 'Drei' ] ).
  WRITE: / |Der Eintrag existiert|.
ENDIF.
