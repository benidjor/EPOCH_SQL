SELECT c.CAR_ID, c.CAR_TYPE, ROUND(c.DAILY_FEE * 30 * (100 - d.DISCOUNT_RATE)/100) FEE
FROM CAR_RENTAL_COMPANY_CAR c
     LEFT JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY h
     ON c.CAR_ID = h.CAR_ID
     LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN d
     ON c.CAR_TYPE = d.CAR_TYPE
WHERE c.CAR_ID NOT IN (
      SELECT CAR_ID
      FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
      WHERE START_DATE <= "2022-11-30" AND END_DATE >= "2022-11-02"
      )
      AND d.DURATION_TYPE = "30일 이상"
GROUP BY c.CAR_ID
HAVING c.CAR_TYPE IN ("세단", "SUV") AND FEE BETWEEN 500000 AND 1999999
ORDER BY FEE DESC, c.CAR_TYPE, c.CAR_ID DESC;
