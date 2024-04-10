--1. feladat
SELECT iif(grouping_id(SZOBA_FK)=1, 'szobaösszeg', Cast(SZOBA_FK as nvarchar(7))) as 'szobaszam', 
iif(grouping_id(YEAR(METTOL))=1, 'részösszeg', CAST(YEAR(METTOL) as nvarchar(4))) as 'év',
COUNT(*) as 'db'
From Foglalas
GROUP BY rollup(SZOBA_FK, YEAR(METTOL))


--2. feladat
SELECT sz.szoba_id, sz.ferohely ,
dense_rank() over(order by COUNT(*) desc, sz.ferohely) as 'helyezés'
FROM Szoba sz JOIN Foglalas f ON sz.SZOBA_ID = f.SZOBA_FK
GROUP BY sz.szoba_id, sz.ferohely


--3.feladat
SELECT NEV
FROM Vendeg
WHERE USERNEV not in (
    SELECT Ugyfel_fk
    from Foglalas
)
or usernev in(
    select ugyfel_fk
    from Foglalas
    GROUP by UGYFEL_FK
    having max(datediff(day,mettol,meddig))<3
)

