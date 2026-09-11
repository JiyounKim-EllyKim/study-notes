-- Advent of SQL 2024
-- 01. 크리스마스 게임 찾기

-- 문제
-- games 테이블에서 게임 이름에
-- 'Christmas' 또는 'Santa'가 포함된 게임을 찾는다.
--
-- 출력 컬럼
-- game_id, name, year


SELECT
    game_id,
    name,
    year
FROM games
WHERE name LIKE '%Christmas%'
   OR name LIKE '%Santa%';


-- 핵심 개념
-- SELECT : 조회할 컬럼 지정
-- FROM   : 조회할 테이블 지정
-- WHERE  : 행을 필터링할 조건 지정
--
-- LIKE : 문자열 패턴 검색
-- %    : 0개 이상의 임의의 문자열
--
-- '%Christmas%'
-- → 문자열 어디에든 'Christmas'가 포함된 경우
--
-- OR
-- → 두 조건 중 하나 이상을 만족하면 조회
