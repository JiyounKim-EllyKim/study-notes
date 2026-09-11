-- Advent of SQL 2024
-- 03. 제목이 모음으로 끝나지 않는 영화

-- 문제
-- R, NC-17 등급 중 제목이 모음(A, E, I, O, U)으로 끝나지 않는 영화의 title을 조회한다.


SELECT
    title
FROM film
WHERE rating IN ('R', 'NC-17')
  AND NOT (
      title LIKE '%A'
      OR title LIKE '%E'
      OR title LIKE '%I'
      OR title LIKE '%O'
      OR title LIKE '%U'
  );


-- 핵심 개념
-- IN : 여러 값 중 하나에 해당하는지 확인
-- LIKE '%A' : 문자열이 A로 끝나는 경우
-- NOT (...) : 괄호 안 조건 전체를 반전
--
-- NOT (A OR B)는
-- (NOT A) AND (NOT B)와 같다.
-- 따라서 강의의 NOT LIKE + AND 방식과 동일하다.
--
-- 다른 풀이:
-- RIGHT(title, 1) NOT IN ('A', 'E', 'I', 'O', 'U')
-- → 제목의 마지막 한 글자를 가져와 모음 여부를 확인한다.


-- 풀이 기록
-- 모음으로 끝나는 조건들을 OR로 묶은 뒤
-- 전체에 NOT을 적용해 해결했다.
