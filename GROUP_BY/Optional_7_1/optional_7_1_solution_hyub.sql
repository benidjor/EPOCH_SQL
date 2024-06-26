-- # Table 1: FIRST_HALF
-- # Table 2: ICECREAM_INFO

-- # 상반기 동안 각 아이스크림 성분 타입과 성분 타입에 대한 아이스크림의 총주문량 조회
--     # 총주문량이 작은 순서대로 
--     # 총주문량을 나타내는 컬럼명은 TOTAL_ORDER로 지정
SELECT INGREDIENT_TYPE, SUM(TOTAL_ORDER) as TOTAL_ORDER로
FROM FIRST_HALF h
    JOIN ICECREAM_INFO i on h.FLAVOR = i.FLAVOR
GROUP BY INGREDIENT_TYPE
ORDER BY TOTAL_ORDER ASC
