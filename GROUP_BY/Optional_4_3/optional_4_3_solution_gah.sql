-- 정답1
SELECT MONTH(START_DATE) MONTH, CAR_ID, COUNT(*) RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31' AND
      CAR_ID IN (SELECT CAR_ID
                 FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
                 WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
                 GROUP BY CAR_ID
                 HAVING COUNT(*) >= 5)
GROUP BY MONTH, CAR_ID
HAVING RECORDS > 0
ORDER BY MONTH, CAR_ID DESC;

-- 정답2
SELECT MONTH(f.START_DATE) MONTH, f.CAR_ID, COUNT(*) RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY f,
     (SELECT CAR_ID, COUNT(*) TOTAL
      FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
      WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
      GROUP BY CAR_ID
      HAVING COUNT(*) >= 5) s
WHERE f.CAR_ID = s.CAR_ID AND
      f.START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
GROUP BY MONTH, f.CAR_ID
HAVING RECORDS > 0
ORDER BY MONTH, f.CAR_ID DESC;

-- 오답
SELECT DATE_FORMAT(f.START_DATE, '%c') MONTH, f.CAR_ID, COUNT(*) RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY f,
     (SELECT CAR_ID, COUNT(*) TOTAL
      FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
      WHERE START_DATE >= '2022-08-01' AND
            START_DATE <= '2022-10-31'
      GROUP BY CAR_ID
      HAVING COUNT(*) >= 5) s
WHERE f.CAR_ID = s.CAR_ID
GROUP BY DATE_FORMAT(f.START_DATE, '%c'), f.CAR_ID
HAVING COUNT(*) > 0
ORDER BY MONTH, CAR_ID DESC;

-- 서브쿼리에만 날짜 조건문을 붙일 시, 만약 8~10월 사이에 5건 이상이 존재하고 7월에도 대여건이 존재한다면 결과값으로 7월에 해당하는 대여건까지 나옴
