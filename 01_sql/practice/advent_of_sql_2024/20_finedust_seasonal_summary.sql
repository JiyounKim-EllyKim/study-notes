-- Advent of SQL 2024
-- 20. 미세먼지 수치의 계절간 차이

-- 문제
-- 2022년의 PM10 데이터를 계절별로 분류하고,
-- 각 계절의 PM10 중앙값과 평균을 계산한다.
--
-- 평균은 소수점 둘째 자리까지 표시한다.


WITH season_pm10 AS (
    SELECT
        CASE
            WHEN measured_at BETWEEN '2022-03-01' AND '2022-05-31'
                THEN 'spring'
            WHEN measured_at BETWEEN '2022-06-01' AND '2022-08-31'
                THEN 'summer'
            WHEN measured_at BETWEEN '2022-09-01' AND '2022-11-30'
                THEN 'autumn'
            ELSE 'winter'
        END AS season,
        pm10
    FROM measurements
)

SELECT
    season,
    AVG(pm10) AS pm10_median,
    MIN(pm10_average) AS pm10_average
FROM (
    SELECT
        season,
        pm10,
        ROW_NUMBER() OVER (
            PARTITION BY season
            ORDER BY pm10
        ) AS rn,
        COUNT(*) OVER (
            PARTITION BY season
        ) AS total_cnt,
        ROUND(
            AVG(pm10) OVER (
                PARTITION BY season
            ),
            2
        ) AS pm10_average
    FROM season_pm10
) AS t
WHERE rn BETWEEN total_cnt / 2
             AND (total_cnt / 2) + 1
GROUP BY season;


-- 핵심 개념
-- CASE WHEN
-- → 측정 날짜를 기준으로 spring, summer, autumn, winter로 분류
--
-- PARTITION BY season
-- → 윈도우 함수의 계산 범위를 계절별로 나눈다.
--
-- ROW_NUMBER() OVER (
--     PARTITION BY season
--     ORDER BY pm10
-- )
-- → 계절별로 PM10 값을 작은 순서대로 정렬한 뒤 순번을 부여
--
-- COUNT(*) OVER (PARTITION BY season)
-- → 각 계절에 포함된 전체 데이터 개수를 계산
--
-- 중앙값 계산
-- → 정렬된 데이터에서 가운데 위치의 행만 남긴다.
--
-- 홀수 개:
--   가운데 행 1개만 선택
--
-- 짝수 개:
--   가운데 행 2개를 선택
--
-- 선택된 가운데 값에 AVG(pm10)을 적용하면 중앙값이 된다.
--
-- AVG(pm10) OVER (PARTITION BY season)
-- → 계절별 평균을 원본 행을 유지한 상태로 계산
--
-- 같은 계절의 pm10_average 값은 모두 같으므로
-- GROUP BY 후 MIN(pm10_average)로 하나의 값만 가져온다.


-- 풀이 기록
-- 계절을 CASE WHEN으로 분류하고 평균을 구하는 부분은 직접 작성했다.
-- 중앙값을 SQL에서 구하는 방법을 떠올리지 못해 강의를 참고했다.
-- 이 과정에서 PARTITION BY를 이용해 계절별로
-- ROW_NUMBER()와 COUNT()를 계산하는 방법을 확인했다.