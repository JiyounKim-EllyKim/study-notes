-- Advent of SQL 2024
-- 16. 스테디셀러 작가 찾기

-- 문제
-- Fiction 장르의 베스트셀러 중
-- 5년 이상 연속으로 베스트셀러에 오른 작가를 찾는다.
--
-- year  : 연속 베스트셀러 기간의 마지막 연도
-- depth : 연속 베스트셀러 연수


WITH author_history AS (
    SELECT DISTINCT
        author,
        year
    FROM books
    WHERE genre = 'Fiction'
)

SELECT
    author,
    MAX(year) AS year,
    COUNT(*) AS depth
FROM (
    SELECT
        *,
        year - ROW_NUMBER() OVER (
            PARTITION BY author
            ORDER BY year
        ) AS rn
    FROM author_history
) AS make_group
GROUP BY author, rn
HAVING COUNT(*) >= 5;


-- 핵심 개념
-- DISTINCT author, year
-- → 같은 작가가 같은 해에 여러 권의 책을 올렸더라도
--   해당 연도는 한 번만 계산한다.
--
-- ROW_NUMBER() OVER (
--     PARTITION BY author
--     ORDER BY year
-- )
-- → 작가별 연도에 순번을 부여한다.
--
-- year - ROW_NUMBER()
-- → 연속된 연도에서는 같은 값이 만들어진다.
--
-- 예)
-- year    row_number    year - row_number
-- 2010        1               2009
-- 2011        2               2009
-- 2012        3               2009
-- 2014        4               2010
-- 2015        5               2010
--
-- 따라서 author와 rn으로 GROUP BY하면
-- 작가별 연속된 연도 구간을 하나의 그룹으로 묶을 수 있다.
--
-- COUNT(*) AS depth
-- → 연속된 베스트셀러 연수를 계산
--
-- MAX(year) AS year
-- → 해당 연속 구간의 마지막 연도를 구한다.
--
-- HAVING COUNT(*) >= 5
-- → 5년 이상 연속된 구간만 조회


-- 풀이 기록
-- 처음에는 작가별 출현 횟수를 COUNT하는 방법을 생각했지만,
-- 단순 COUNT만으로는 연도가 연속되었는지 판단할 수 없었다.
--
-- 연속된 값을 그룹화하는 방법을 떠올리지 못해 강의를 참고했고,
-- year - ROW_NUMBER() 값이 연속 구간에서 동일해지는 원리를 이용해 해결했다.
--
-- 강의에서는 집계 결과를 한 번 더 서브쿼리로 감쌌지만,
-- 최종적으로 author, year, depth만 필요한 현재 쿼리에서는
-- 가장 바깥쪽 서브쿼리를 생략해도 동일하게 처리할 수 있다.