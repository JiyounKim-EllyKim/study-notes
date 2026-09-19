-- Advent of SQL 2024
-- 10. 최대값을 가진 행 찾기

-- 문제
-- points 테이블에서 가장 큰 x 값을 가지거나
-- 가장 큰 y 값을 가지는 행의 id를 조회한다.
-- 결과는 id 기준 오름차순으로 정렬한다.


SELECT
    id
FROM points
WHERE x = (SELECT MAX(x) FROM points)
   OR y = (SELECT MAX(y) FROM points)
ORDER BY id;


-- 핵심 개념
-- MAX(column)
-- → 해당 컬럼의 최댓값을 구한다.
--
-- SELECT MAX(x) FROM points
-- → points 테이블에서 가장 큰 x 값을 반환
--
-- 서브쿼리의 결과를 WHERE 조건에서 사용할 수 있다.
--
-- x = (SELECT MAX(x) FROM points)
-- → x가 전체 x 중 최댓값인 행을 찾는다.
--
-- OR 조건을 사용해
-- x의 최댓값 또는 y의 최댓값을 가진 행을 모두 조회한다.
--
-- ORDER BY id
-- → 기본 정렬 방향은 ASC이므로 ASC는 생략 가능


-- 풀이 기록
-- MAX()를 구하는 서브쿼리를 WHERE 조건에 직접 사용해 해결했다.
-- 강의 풀이와 동일한 방식으로 작성했다.