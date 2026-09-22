-- Advent of SQL 2024
-- 13. 게임 개발사의 주력 플랫폼 찾기

-- 문제
-- 개발사와 플랫폼별 게임 판매량을 합산한 뒤,
-- 각 개발사에서 판매량이 가장 높은 플랫폼을 조회한다.
-- 최대 판매량이 같은 플랫폼이 여러 개라면 모두 출력한다.


WITH stats AS (
    SELECT
        c.name AS developer,
        p.name AS platform,
        SUM(g.sales_na)
        + SUM(g.sales_eu)
        + SUM(g.sales_jp)
        + SUM(g.sales_other) AS sales
    FROM games AS g
    JOIN companies AS c
        ON g.developer_id = c.company_id
    JOIN platforms AS p
        ON g.platform_id = p.platform_id
    GROUP BY c.name, p.name
)

SELECT
    s.*
FROM stats AS s
JOIN (
    SELECT
        developer,
        MAX(sales) AS max_sales
    FROM stats
    GROUP BY developer
) AS m
    ON s.developer = m.developer
WHERE s.sales = m.max_sales;


-- 핵심 개념
-- CTE(stats)
-- → 개발사와 플랫폼별 판매량 합계를 먼저 계산한다.
--
-- MAX(sales)
-- → 각 개발사의 플랫폼별 판매량 중 최댓값을 구한다.
--
-- 집계 결과를 다시 JOIN한 뒤
-- sales = max_sales인 행만 남겨 개발사의 주력 플랫폼을 찾는다.
--
-- 최대 판매량이 같은 플랫폼이 여러 개라면
-- 조건을 모두 만족하므로 공동 1위가 함께 출력된다.


-- 다른 풀이
-- 강의에서는 DENSE_RANK() 윈도우 함수를 사용했다.
--
-- WITH sales_by_platform AS (
--     SELECT
--         developer_id,
--         platform_id,
--         SUM(sales_na + sales_eu + sales_jp + sales_other) AS sales
--     FROM games
--     GROUP BY developer_id, platform_id
-- )
--
-- SELECT
--     c.name AS developer,
--     p.name AS platform,
--     rk.sales
-- FROM (
--     SELECT
--         *,
--         DENSE_RANK() OVER (
--             PARTITION BY developer_id
--             ORDER BY sales DESC
--         ) AS rk
--     FROM sales_by_platform
-- ) AS rk
-- JOIN companies AS c
--     ON c.company_id = rk.developer_id
-- JOIN platforms AS p
--     ON p.platform_id = rk.platform_id
-- WHERE rk.rk = 1;
--
-- PARTITION BY developer_id
-- → 개발사별로 순위를 따로 계산
--
-- ORDER BY sales DESC
-- → 판매량이 많은 플랫폼부터 순위를 부여
--
-- DENSE_RANK()
-- → 판매량이 같으면 같은 순위를 부여하므로 공동 1위도 모두 조회 가능


-- 풀이 기록
-- 개발사와 플랫폼별 판매량을 집계하는 CTE는 직접 작성했다.
-- 이후 개발사별 최대 판매량을 구한 뒤 다시 JOIN하는 방법은
-- 검색을 참고하여 완성했다.
-- 강의에서는 같은 문제를 DENSE_RANK()를 이용해 해결했다.