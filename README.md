# Arcade Mania

Az **Arcade Mania** egy webalapú arcade játékplatform, amely a klasszikus játékok hangulatát ötvözi modern webfejlesztési technológiákkal.  
A projekt elsődleges célja egy **átlátható, jól strukturált, tanulási célú full-stack alkalmazás** megvalósítása.

---

## Projekt célja

A projekt célja nem csupán egy működő játékoldal létrehozása, hanem egy olyan rendszer megvalósítása, amely:

- bemutatja a **frontend–backend–adatbázis** szétválasztását,
- követi a **modern webfejlesztési elveket**,
- alkalmas szakmai vizsga- és bemutatási célokra,
- hosszú távon is **bővíthető és karbantartható** marad.

---

## Rendszerarchitektúra

Az Arcade Mania egy **háromrétegű architektúrára** épül:

### Frontend
- React
- React Router
- Komponens-alapú felépítés
- Védett útvonalak (bejelentkezéshez kötött funkciók)

### Backend
- ASP.NET Core Web API (C#)
- REST alapú végpontok
- DTO-k az adatbiztonság és átláthatóság érdekében

### Adatbázis
- MySQL
- Entity Framework Core (ORM)
- Strukturált felhasználói és pontszámadatok

Ez a felépítés lehetővé teszi, hogy az egyes rétegek egymástól függetlenül módosíthatók és fejleszthetők legyenek.

---

## Frontend – React

A frontend React könyvtár segítségével készült, amely lehetővé teszi az alkalmazás logikus, komponensekre bontott felépítését.

### Főbb oldalak és komponensek:
- **Login** – felhasználói bejelentkezés
- **Register** – új felhasználó regisztrálása
- **Main** – elérhető játékok megjelenítése
- **Header** – navigáció, zenevezérlés, kijelentkezés
- **AuthProvider** – felhasználói állapot kezelése

A React Router biztosítja az oldalak közötti navigációt, míg a protected route-ok gondoskodnak arról, hogy bizonyos funkciók csak bejelentkezett felhasználók számára legyenek elérhetők.

---

## Backend – ASP.NET Core Web API

A backend az alkalmazás üzleti logikájáért felel, és REST API végpontokon keresztül szolgálja ki a frontendet.

### Fő funkciók:
- Felhasználó regisztráció
- Bejelentkezés
- Felhasználók adatainak kezelése
- Játékpontszámok frissítése (külön végpontokon)

---

## Hivatkozások:

## Trello link:

https://trello.com/b/ZOUXv58n/ikt-projektmunka

## GitHub link:

https://github.com/SzabolcsBodi/Arcade-Mania
