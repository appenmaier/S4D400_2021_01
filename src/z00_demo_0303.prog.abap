*&---------------------------------------------------------------------*
*& Report z00_demo_0303
*&---------------------------------------------------------------------*
*& Demo 3.3: Mathematische Operatoren und numerische Funktionen
*&---------------------------------------------------------------------*
REPORT z00_demo_0303.

DATA result TYPE p LENGTH 16 DECIMALS 2.

"Mathematische Operatoren
result = 5 + 3. WRITE: result. "Addition
result = 5 - 3. WRITE: / result. "Subtraktion
result = 5 * 3. WRITE: / result. "Multiplikation
result = 5 / 3. WRITE: / result. "Division
result = 5 ** 3. WRITE: / result. "Potenz
result = 5 DIV 3. WRITE: / result. "ganzzahlige Division
result = 5 MOD 3. WRITE: / result. "Divisionrest
ADD 1 TO result. WRITE: / result. "Inkrementieren / Dekrementieren
*result += 1. WRITE: result. "Zuweisungsoperator für die Addition (ab SAP NW 7.54)

"Numerische Funktionen
result = abs( -1 ). WRITE: / result. "Betrag
result = ipow( base = 4 exp = 2 ). WRITE: / result. "Potenz
