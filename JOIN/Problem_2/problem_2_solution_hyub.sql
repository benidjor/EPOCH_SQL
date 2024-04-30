# ANIMAL_IND : 입양 온
# ANIMAL_OUTS: 입양 보낸

SELECT outs.ANIMAL_ID, outs.NAME
FROM ANIMAL_INS as ins
    RIGHT JOIN ANIMAL_OUTS as outs 
        on ins.ANIMAL_ID = outs.ANIMAL_ID
WHERE ins.ANIMAL_ID IS NULL