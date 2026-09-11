-- Advent of SQL 2024
-- 03. 제목이 모음으로 끝나지 않는 영화

-- 문제
-- 17세 미만 학생이 혼자 대여할 수 없는 영화 중
-- 제목이 모음(A, E, I, O, U)으로 끝나지 않는 영화의
-- title을 조회한다.
--
-- R, NC-17 등급이 대상이다.


SELECT
    title
FROM film
WHERE rating IN ('R', 'NC-17')
  AND RIGHT(title, 1) NOT IN ('A', 'E', 'I', 'O', 'U');


-- 핵심 개념
-- IN
-- → 여러 값 중 하나에 해당하는지 확인한다.
--
-- rating IN ('R', 'NC-17')
-- → rating이 R 또는 NC-17인 행을 조회한다.
--
-- RIGHT(문자열, n)
-- → 문자열의 오른쪽에서 n개의 문자를 가져온다.
--
-- RIGHT(title, 1)
-- → 영화 제목의 마지막 글자를 가져온다.
--
-- NOT IN
-- → 지정한 값 중 어느 것에도 해당하지 않는 경우를 찾는다.
--
-- RIGHT(title, 1) NOT IN ('A', 'E', 'I', 'O', 'U')
-- → 제목의 마지막 글자가 모음이 아닌 영화만 조회한다.


-- 풀이 기록
-- 처음에는 각 모음에 대해 LIKE와 OR를 사용하여 해결했다.
--
-- AND NOT (
--     title LIKE '%A'
--     OR title LIKE '%E'
--     OR title LIKE '%I'
--     OR title LIKE '%O'
--     OR title LIKE '%U'
-- )
--
-- 정답으로 처리되었지만,
-- RIGHT()와 NOT IN을 사용하면 더 간결하게 표현할 수 있다.
