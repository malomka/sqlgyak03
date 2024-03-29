SELECT 
        TIPUS, 
        COUNT(SZALLAS_ID) AS 'DARABSZAM',
        AVG(CSILLAGOK_SZAMA) AS 'ATLAGOS_CSILLAGOK_SZAMA'
FROM Szallashely
WHERE 
        ROGZITETTE = 'Béla' OR 
        ROGZITETTE = 'Sári'
GROUP BY TIPUS
ORDER BY TIPUS ASC


SELECT 
        FEROHELY,
        count(KLIMAS) AS 'KLIMAS_SZOBAK_SZAMA'
FROM Szoba
WHERE
        KLIMAS = 'i' AND
        POTAGY <> 0
GROUP BY FEROHELY


SELECT 
        COUNT(FOGLALAS_PK) AS 'FOGLALASOK_SZAMA_2017',
        GYERMEK_SZAM
FROM Foglalas
WHERE 
        GYERMEK_SZAM <> 0 AND
        LEFT(METTOL,4) = '2017'
GROUP BY GYERMEK_SZAM


SELECT
        LEFT(SZAML_CIM,4) AS 'IRANYITOSZAM',
        AVG(LEN(NEV)) AS 'ATLAGOS_NEV_HOSSZ'
FROM Vendeg
WHERE YEAR(SZUL_DAT) < 1980 AND YEAR(SZUL_DAT) > 1975
GROUP BY LEFT(SZAML_CIM,4)
ORDER BY LEFT(SZAML_CIM,4) DESC