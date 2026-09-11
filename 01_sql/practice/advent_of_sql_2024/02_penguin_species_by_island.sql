-- Advent of SQL 2024
-- 02. 펭귄 조사하기

-- 문제
-- penguins 테이블에서 펭귄의 종(species)과 서식지(island)를 조회한다.
-- 동일한 species-island 조합은 한 번만 출력한다.
--
-- 정렬 기준
-- 1. island 오름차순
-- 2. 같은 island에서는 species 오름차순


SELECT DISTINCT
    species,
    island
FROM penguins
ORDER BY island, species;


-- 핵심 개념
-- DISTINCT
-- → SELECT 결과에서 중복되는 행을 제거한다.
--
-- SELECT DISTINCT species, island
-- → species와 island 각각의 중복을 따로 제거하는 것이 아니라,
--   두 컬럼의 '조합'이 동일한 행을 중복으로 판단한다.
--
-- 예)
-- species   island
-- Adelie    Biscoe
-- Adelie    Biscoe
-- Gentoo    Biscoe
--
-- DISTINCT 적용 결과
-- Adelie    Biscoe
-- Gentoo    Biscoe
--
-- ORDER BY island, species
-- → 먼저 island 기준으로 오름차순 정렬하고,
--   island가 같은 경우 species 기준으로 오름차순 정렬한다.


-- 풀이 기록
-- DISTINCT 문법이 기억나지 않아 검색 후 적용했다.
