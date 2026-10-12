-- Advent of SQL 2024
-- 23. 유량(Flow)과 저량(Stock)

-- 문제
-- 작품이 소장된 연도별로 새롭게 소장된 작품 수(Flow)와
-- 해당 연도까지의 누적 소장 작품 수(Stock)를 구한다.
--
-- acquisition_date가 없는 작품은 제외하고,
-- 결과는 소장 연도 기준 오름차순으로 정렬한다.


WITH stats AS (
    SELECT
        YEAR(acquisition_date) AS acquisition_year,
        COUNT(*) AS cnt
    FROM artworks
    GROUP BY YEAR(acquisition_date)
)

SELECT
    acquisition_year AS 'Acquisition year',
    cnt AS 'New acquisitions this year (Flow)',
    SUM(cnt) OVER (
        ORDER BY acquisition_year
    ) AS 'Total collection size (Stock)'
FROM stats
WHERE acquisition_year IS NOT NULL
ORDER BY acquisition_year;


-- 핵심 개념
-- YEAR(acquisition_date)
-- → 날짜에서 연도를 추출
--
-- COUNT(*) + GROUP BY
-- → 연도별로 새롭게 소장된 작품 수를 계산
-- → 이 값이 해당 연도의 Flow
--
-- SUM(cnt) OVER (ORDER BY acquisition_year)
-- → acquisition_year 순서로 cnt의 누적 합계를 계산
-- → 해당 연도까지의 전체 소장 작품 수인 Stock을 구한다.
--
-- 예)
-- year    cnt    누적합
-- 1929     9       9
-- 1930     8      17
-- 1931     3      20
-- 1932    18      38
--
-- 집계 윈도우 함수에 ORDER BY를 사용하면
-- 첫 행부터 현재 행까지의 값을 누적해서 계산할 수 있다.
--
-- 누적 범위를 명시적으로 작성하면 다음과 같이 표현할 수 있다.
--
-- SUM(cnt) OVER (
--     ORDER BY acquisition_year
--     ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
-- )
--
-- UNBOUNDED PRECEDING
-- → 첫 번째 행부터
--
-- CURRENT ROW
-- → 현재 행까지
--
-- 따라서 현재 행을 포함해 이전 행의 cnt가 계속 누적된다.
--
-- OVER 절의 ORDER BY
-- → 윈도우 함수의 계산 순서를 지정
--
-- SELECT 문의 마지막 ORDER BY
-- → 최종 결과의 출력 순서를 지정
--
-- 두 ORDER BY는 역할이 다르므로
-- 최종 결과 정렬이 필요하면 마지막 ORDER BY도 작성한다.


-- 다른 풀이
-- 강의에서는 acquisition_date가 NULL인 행을
-- CTE 내부의 WHERE 절에서 먼저 제외했다.
--
-- WHERE acquisition_date IS NOT NULL
--
-- 현재 풀이에서는 연도별 집계 후
-- acquisition_year IS NOT NULL 조건으로 제외했다.


-- 풀이 기록
-- 연도별 소장 작품 수를 구하기 위해
-- YEAR(), COUNT(), GROUP BY를 사용한 CTE는 직접 작성했다.
--
-- 해당 연도까지의 누적 소장 작품 수를 계산하는
-- SUM(cnt) OVER (ORDER BY acquisition_year) 부분은
-- 강의 풀이를 참고했다.
--
-- 이후 ORDER BY가 포함된 집계 윈도우 함수가
-- 첫 행부터 현재 행까지의 값을 누적하여 계산한다는 원리를 확인했다.