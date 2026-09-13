-- Advent of SQL 2024
-- 06. 게임을 10개 이상 발매한 게임 배급사 찾기

-- 문제
-- games와 companies 테이블을 연결하여
-- 게임을 10개 이상 발매한 배급사의 이름을 조회한다.


SELECT
    companies.name AS name
FROM games
JOIN companies
    ON games.publisher_id = companies.company_id
GROUP BY games.publisher_id
HAVING COUNT(*) >= 10;


-- 핵심 개념
-- JOIN + ON
-- → 두 테이블을 연결하고, ON에 연결 기준을 작성한다.
--
-- FROM games
-- JOIN companies
--     ON games.publisher_id = companies.company_id
-- → games의 publisher_id와 companies의 company_id가 같은 행을 연결
--
-- GROUP BY games.publisher_id
-- → 같은 배급사의 게임들을 하나의 그룹으로 묶는다.
--
-- HAVING COUNT(*) >= 10
-- → 배급사별 게임 수가 10개 이상인 그룹만 조회한다.
--
-- SQL에서 값이 같은지 비교할 때는 = 사용
-- Python의 ==와 혼동하지 않기
--
-- JOIN만 작성하면 기본적으로 INNER JOIN을 의미한다.


-- 다른 풀이
-- 강의에서는 publisher_id별 게임 수를 먼저 집계한 뒤
-- 그 결과를 companies 테이블과 JOIN했다.
--
-- SELECT name
-- FROM (
--     SELECT publisher_id,
--            COUNT(*) AS cnt
--     FROM games
--     GROUP BY publisher_id
--     HAVING cnt >= 10
-- ) AS p
-- INNER JOIN companies AS c
--     ON p.publisher_id = c.company_id;


-- 풀이 기록
-- JOIN을 FROM 뒤에 작성하고 JOIN + ON을 함께 사용하는 구조와
-- SQL의 동등 비교 연산자 =를 참고했다.
-- 나머지는 직접 작성했다.