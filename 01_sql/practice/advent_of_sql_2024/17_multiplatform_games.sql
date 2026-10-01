-- Advent of SQL 2024
-- 17. 멀티 플랫폼 게임 찾기

-- 문제
-- 2012년 이후 출시된 게임 중
-- Sony, Nintendo, Microsoft 계열 가운데
-- 2개 이상의 플랫폼 계열에서 출시된 게임을 찾는다.
-- 같은 게임은 한 번만 출력한다.


WITH game_platform AS (
    SELECT
        g.name AS name,
        CASE
            WHEN p.name IN ('PS3', 'PS4', 'PSP', 'PSV')
                THEN 'Sony'
            WHEN p.name IN ('Wii', 'WiiU', 'DS', '3DS')
                THEN 'Nintendo'
            WHEN p.name IN ('X360', 'XONE')
                THEN 'Microsoft'
        END AS company
    FROM games AS g
    JOIN platforms AS p
        ON g.platform_id = p.platform_id
    WHERE g.year >= 2012
)

SELECT
    name
FROM (
    SELECT DISTINCT
        name,
        company
    FROM game_platform
    WHERE company IS NOT NULL
) AS t
GROUP BY name
HAVING COUNT(*) >= 2
ORDER BY name;


-- 핵심 개념
-- CASE WHEN
-- → 각 플랫폼을 Sony, Nintendo, Microsoft 계열로 분류
--
-- DISTINCT name, company
-- → 같은 게임이 같은 회사 계열의 여러 플랫폼에 출시되었더라도
--   해당 회사는 한 번만 계산한다.
--
-- GROUP BY name + HAVING COUNT(*) >= 2
-- → 게임별 플랫폼 계열 수를 세어
--   2개 이상의 회사 계열에 출시된 게임만 조회한다.
--
-- Derived Table Alias
-- → FROM 절에서 서브쿼리를 테이블처럼 사용할 때는
--   반드시 별칭을 붙여야 한다.
--
-- FROM (
--     SELECT ...
-- ) AS t


-- 다른 풀이
-- 강의에서는 별도의 CTE와 중복 제거 서브쿼리를 만들지 않고
-- COUNT(DISTINCT CASE ...)를 이용해 한 번에 계산했다.
--
-- SELECT DISTINCT name
-- FROM (
--     SELECT
--         g.name,
--         COUNT(
--             DISTINCT CASE
--                 WHEN p.name IN ('PS3', 'PS4', 'PSP', 'PSV')
--                     THEN 'Sony'
--                 WHEN p.name IN ('Wii', 'WiiU', 'DS', '3DS')
--                     THEN 'Nintendo'
--                 WHEN p.name IN ('X360', 'XONE')
--                     THEN 'Microsoft'
--             END
--         ) AS cnt
--     FROM games AS g
--     JOIN platforms AS p
--         ON g.platform_id = p.platform_id
--     WHERE g.year >= 2012
--     GROUP BY g.name
--     HAVING cnt >= 2
-- ) AS t;


-- 풀이 기록
-- CTE에서 플랫폼을 회사 계열별로 분류한 뒤,
-- 게임-회사 조합의 중복을 제거하고 회사 수를 세는 방식으로 직접 해결했다.
--
-- FROM 절의 서브쿼리에 별칭을 붙이지 않아
-- 'Every derived table must have its own alias' 오류가 발생했고,
-- 검색을 통해 derived table에는 반드시 alias가 필요하다는 점을 확인했다.