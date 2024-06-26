-- # 1. BOOK
-- # 2. BOOK_SALES

-- # 2022년 1월의 카테고리 별 도서 판매량을 합산하고, 카테고리(CATEGORY), 총 판매량(TOTAL_SALES) 리스트를 출력
--     # 결과는 카테고리명을 기준으로 오름차순 정렬

SELECT CATEGORY, SUM(SALES) as TOTAL_SALES
FROM BOOK b
JOIN BOOK_SALES s on b.BOOK_ID = s.BOOK_ID
    WHERE YEAR(SALES_DATE) = 2022 AND MONTH(SALES_DATE) = 1
GROUP BY CATEGORY
ORDER BY CATEGORY
