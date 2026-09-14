-- Advent of SQL 2024
-- 07. 기증품 비율 계산하기

-- 문제
-- artworks 테이블에서 credit에 'gift'가 포함된 작품의 비율을
-- 백분율로 계산하고 소수점 셋째 자리까지 반올림한다.


SELECT ROUND(
    (SELECT COUNT(*)
     FROM artworks
     WHERE LOWER(credit) LIKE '%gift%') * 100.0
    / (SELECT COUNT(*)
       FROM artworks),
    3
) AS ratio;


-- 핵심 개념
-- LOWER(column)
-- → 문자열을 소문자로 변환
-- → Gift, GIFT 등 대소문자가 다른 경우도 '%gift%'로 검색 가능
--
-- 서브쿼리
-- → 하나의 SQL 문 안에 또 다른 SELECT 문을 작성할 수 있다.
--
-- (기증 작품 수 * 100) / 전체 작품 수
-- → 기증품의 비율을 백분율로 계산
--
-- ROUND(value, 3)
-- → 계산 결과를 소수점 셋째 자리까지 반올림


-- 풀이 기록
-- 비율을 계산하기 위해 서브쿼리를 사용하는 방법은 떠올렸지만,
-- LOWER()가 기억나지 않았고 서브쿼리 작성 중 문법 오류가 있어
-- 강의 풀이를 참고해 마무리했다.