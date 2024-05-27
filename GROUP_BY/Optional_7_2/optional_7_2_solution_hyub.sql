-- # Table 1: REST_INFO

-- # 음식종류별로 즐겨찾기수가 가장 많은 식당의 음식 종류, ID, 식당 이름, 즐겨찾기수를 조회
--     # 음식 종류를 기준으로 내림차순
    
-- # SELECT FOOD_TYPE, REST_ID, REST_NAME, MAX(FAVORITES) as FAVORITES
-- # FROM REST_INFO
-- # GROUP BY FOOD_TYPE 
-- # ORDER BY FOOD_TYPE DESC
-- # # 왜 틀린 거지 아!

SELECT FOOD_TYPE, REST_ID, REST_NAME, FAVORITES
FROM REST_INFO
WHERE (FOOD_TYPE, FAVORITES) in (    
    SELECT FOOD_TYPE, MAX(FAVORITES)
    FROM REST_INFO
    GROUP BY FOOD_TYPE)
ORDER BY FOOD_TYPE DESC