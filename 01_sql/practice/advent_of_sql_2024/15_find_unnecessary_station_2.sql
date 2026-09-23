-- Advent of SQL 2024
-- 15. 폐쇄할 따릉이 정류소 찾기 2

-- 문제
-- 2018년 10월과 2019년 10월의 정류소별 대여/반납 건수를 비교하여
-- 2019년 이용량이 2018년 이용량의 50% 이하인 정류소를 찾는다.
--
-- 두 연도 중 대여/반납 건수의 합이 0인 경우는 제외한다.


WITH rent_stats AS (
    SELECT
        rent_station_id,
        SUM(
            CASE
                WHEN rent_at BETWEEN '2018-10-01 00:00:00'
                                 AND '2018-10-31 23:59:59'
                THEN 1 ELSE 0
            END
        ) AS rent_2018,
        SUM(
            CASE
                WHEN rent_at BETWEEN '2019-10-01 00:00:00'
                                 AND '2019-10-31 23:59:59'
                THEN 1 ELSE 0
            END
        ) AS rent_2019
    FROM rental_history
    WHERE rent_at BETWEEN '2018-10-01 00:00:00'
                      AND '2018-10-31 23:59:59'
       OR rent_at BETWEEN '2019-10-01 00:00:00'
                      AND '2019-10-31 23:59:59'
    GROUP BY rent_station_id
),
return_stats AS (
    SELECT
        return_station_id,
        SUM(
            CASE
                WHEN return_at BETWEEN '2018-10-01 00:00:00'
                                   AND '2018-10-31 23:59:59'
                THEN 1 ELSE 0
            END
        ) AS return_2018,
        SUM(
            CASE
                WHEN return_at BETWEEN '2019-10-01 00:00:00'
                                   AND '2019-10-31 23:59:59'
                THEN 1 ELSE 0
            END
        ) AS return_2019
    FROM rental_history
    WHERE return_at BETWEEN '2018-10-01 00:00:00'
                        AND '2018-10-31 23:59:59'
       OR return_at BETWEEN '2019-10-01 00:00:00'
                        AND '2019-10-31 23:59:59'
    GROUP BY return_station_id
)

SELECT
    station.station_id AS station_id,
    station.name AS name,
    station.local AS local,
    ROUND(
        (rent_2019 + return_2019) * 100.0
        / (rent_2018 + return_2018),
        2
    ) AS usage_pct
FROM rent_stats
INNER JOIN return_stats
    ON rent_stats.rent_station_id = return_stats.return_station_id
INNER JOIN station
    ON rent_stats.rent_station_id = station.station_id
WHERE (rent_2019 + return_2019) != 0
  AND (rent_2018 + return_2018) != 0
  AND ROUND(
        (rent_2019 + return_2019) * 100.0
        / (rent_2018 + return_2018),
        2
      ) <= 50;


-- 핵심 개념
-- 여러 CTE를 하나의 WITH 절에서 사용할 때는
-- WITH cte1 AS (...), cte2 AS (...) 형태로 쉼표로 연결한다.
--
-- rent_stats
-- → rent_station_id 기준으로 연도별 대여 건수를 집계
--
-- return_stats
-- → return_station_id 기준으로 연도별 반납 건수를 집계
--
-- SUM(CASE WHEN ... THEN 1 ELSE 0 END)
-- → 특정 기간에 해당하는 행의 개수를 조건부 집계
--
-- 이용률
-- → (2019년 대여 + 반납) / (2018년 대여 + 반납) * 100
--
-- INNER JOIN
-- → 대여 통계와 반납 통계를 정류소 기준으로 연결하고,
--   station 테이블에서 정류소 이름과 지자체 정보를 가져온다.


-- 풀이 기록
-- 대여 건수와 반납 건수를 각각 CTE로 집계하는 구조를 만들었다.
-- 여러 CTE를 쉼표로 연결하는 문법은 강의를 참고했다.
--
-- 처음에는 반납 통계에서도 rent_station_id를 사용해
-- 결과가 맞지 않았고, return_station_id로 수정했다.
--
-- 또한 각 항목이 각각 0이 아닌지를 확인하려 했지만,
-- 연도별 대여/반납 합계가 0이 아닌지를 확인하도록 수정했다.
--
-- 여러 번 수정한 끝에 최종 제출을 통과했다.