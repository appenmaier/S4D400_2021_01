*&---------------------------------------------------------------------*
*& Report z00_demo_0301
*&---------------------------------------------------------------------*
*& Demo 3.1: Datenobjekte und Datentypen
*&---------------------------------------------------------------------*
REPORT z00_demo_0301.

"Wichtige ABAP-Standardtypen
DATA i1 TYPE i. "ganze Zahl (Bsp: 42)
DATA string1 TYPE string. "Zeichenkette dynamischer Länge (Bsp: 'Hallo Welt!')
DATA c1 TYPE c LENGTH 6. "Zeichenkette fester Länge (Bsp: 'ABC123')
DATA n1 TYPE n LENGTH 7. "Numerische Folge fester Länge (Bsp: '7126394')
DATA d1 TYPE d. "Datum (Bsp: '20210118')
DATA t1 TYPE t. "Zeit (Bsp: '114822')
DATA p1 TYPE p LENGTH 16 DECIMALS 2. "gepackte Zahl (Bsp: '512453.32')

"Deklaration variabler Datenobjekte per...
DATA carrier_id TYPE c LENGTH 3. "...ABAP-Standardtyp
DATA carrier_id2 TYPE s_carr_id. "...Datenelement

"Wertzuweisung per...
carrier_id = 'LH'. "...Zuweisungsoperator
DATA flight_date TYPE s_date VALUE '20210118'. "...statischer Vorbelegung
DATA(connection_id) = '0400'. "...Inlinedeklaration

"Initialisierung
CLEAR carrier_id.

"Deklaration fixer Datenobjekte
CONSTANTS pi TYPE p LENGTH 2 DECIMALS 2 VALUE '3.14'.
