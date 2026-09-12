-- Advent of SQL 2024
-- 05. 언더스코어(_)가 포함되지 않은 데이터 찾기

-- 문제
-- page_location에 언더스코어(_)가 포함되지 않은 값만 조회한다.
-- 중복을 제거하고 오름차순으로 정렬한다.


SELECT
    page_location
FROM ga
WHERE page_location NOT LIKE '%\_%'
GROUP BY page_location
ORDER BY page_location;


-- 핵심 개념
-- LIKE에서 _ : 정확히 한 개의 임의의 문자
-- \_ : 와일드카드가 아닌 실제 언더스코어(_) 문자
--
-- NOT LIKE '%\_%'
-- → 언더스코어가 포함되지 않은 문자열만 조회
--
-- GROUP BY로도 중복 제거가 가능하지만,
-- 중복 제거만 목적이라면 DISTINCT가 더 직관적이다.


-- 다른 풀이
SELECT DISTINCT
    page_location
FROM ga
WHERE page_location NOT LIKE '%\_%' ESCAPE '\\'
ORDER BY page_location;

-- ESCAPE '\\'
-- → LIKE 패턴에서 \를 escape 문자로 사용한다고 명시
-- → 현재 MySQL 환경에서는 백슬래시 자체를 표현하기 위해 \\로 작성


-- 풀이 기록
-- 별도 참고 없이 GROUP BY를 이용해 중복을 제거했다.
-- 이후 DISTINCT와 ESCAPE를 사용하는 풀이도 확인했다.