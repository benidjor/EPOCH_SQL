# Table 1: ANIMAL_INS

SELECT COUNT(DISTINCT(NAME)) as count
FROM ANIMAL_INS
WHERE NAME IS NOT NULL
