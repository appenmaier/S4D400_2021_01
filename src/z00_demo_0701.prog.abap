*&---------------------------------------------------------------------*
*& Report z00_demo_0701
*&---------------------------------------------------------------------*
*& Demo 7.1: Interne Tabellen
*&---------------------------------------------------------------------*
REPORT z00_demo_0701.

"Deklaration interner Tabellen
DATA carriers TYPE z00_tt_carriers. "TYPE <Tabellentyp>
DATA carriers2 TYPE TABLE OF z00_s_carrier. "TYPE TABLE OF <Strukturtyp>

"Einfügen von Datensätzen
carriers = VALUE #(
    ( carrier_id = 'LH' carrier_name = 'Lufthansa' )
    ( carrier_id = 'UA' carrier_name = 'United Airlines' )
    ( carrier_name = 'British Airways' ) ).

"Erweitern interner Tabellen
DATA carrier TYPE z00_s_carrier.
carrier-carrier_id = 'SQ'.
carrier-carrier_name = 'Singapore Irgendwas'.

carriers = VALUE #( BASE carriers
    ( carrier_id = 'AA' carrier_name = 'American Airl. A' )
    ( carrier_id = 'AA' carrier_name = 'American Airl. B' )
    ( carrier ) ).

"Lesen eines Einzelsatzes per...
carrier = carriers[ 1 ]. "...Index
carrier = carriers[ carrier_id = 'AA' ]. "...Schlüssel

"Fehlerbehandlung bei Tabellenausdrücken
TRY.
    carrier = carriers[ 100 ].
  CATCH cx_sy_itab_line_not_found.
    WRITE: / 'Fehler: Zeile nicht gefunden'.
ENDTRY.

IF line_exists( carriers[ 100 ] ).
  carrier = carriers[ 100 ].
ELSE.
  WRITE: / 'Fehler: Zeile nicht gefunden'.
ENDIF.

"Lesen mehrerer Datensätze
LOOP AT carriers INTO carrier WHERE carrier_id IS NOT INITIAL. "LOOP AT carriers INTO DATA(carrier2).
  WRITE: / |{ sy-tabix }: { carrier-carrier_id } { carrier-carrier_name }|.
ENDLOOP.

"Ändern eines Einzelsatzes
carriers[ 3 ]-carrier_id = 'BA'.
carriers[ carrier_id = 'SQ' ]-carrier_name = 'Singapore Airl.'.

"Ändern mehrerer Datensätze
DATA carrier2 TYPE REF TO z00_s_carrier.

LOOP AT carriers REFERENCE INTO carrier2. "LOOP AT carriers REFERENCE INTO DATA(carrier2).
  carrier2->carrier_name = carrier2->carrier_name && ' 21'.
ENDLOOP.

*LOOP AT carriers INTO DATA(dummy).
*  carriers[ sy-tabix ]-carrier_name = carriers[ sy-tabix ]-carrier_name && ' 2021'.
*ENDLOOP.

"Sortieren interner Tabellen
SORT carriers BY carrier_id ASCENDING carrier_name DESCENDING.

"Löschen eines Einzelsatzes
DELETE carriers INDEX 1.

"Löschen mehrerer Datensätze
DELETE carriers WHERE carrier_id > 'MM'.

"Größe einer internen Tabelle
WRITE: / |Größe der internen Tabelle: { lines( carriers ) }|.
