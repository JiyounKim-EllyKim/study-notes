-- Advent of SQL 2024
-- 05. 언더스코어(_)가 포함되지 않은 데이터 찾기

-- 문제
-- page_location에 언더스코어(_)가 포함되지 않은 값만 조회한다.
-- 중복은 제거하고 오름차순으로 정렬한다.


SELECT
    page_location
FROM ga
WHERE page_location NOT LIKE '%\_%'
GROUP BY page_location
ORDER BY page_location;


-- 핵심 개념
-- \_ : LIKE에서 _는 한 글자를 의미하는 와일드카드이므로,
--      \_로 작성해 실제 언더스코어 문자(_)를 검색한다.
--
-- NOT LIKE '%\_%'
-- → 문자열 어디에도 언더스코어가 포함되지 않은 값만 조회
--
-- GROUP BY page_location
-- → 같은 page_location 값을 하나의 그룹으로 묶어 중복 제거


-- 다른 풀이
-- 중복 제거만 목적이라면 DISTINCT를 사용하는 것이 더 직관적이다.
--
-- SELECT DISTINCT
--     page_location
-- FROM ga
-- WHERE page_location NOT LIKE '%\_%'
-- ORDER BY page_location;


-- 풀이 기록
-- 별도 참고 없이 GROUP BY를 이용해 중복을 제거해 해결했다.