-- Advent of SQL 2024
-- 24. 세 명이 서로 친구인 관계 찾기

-- 문제
-- ID가 3820인 사용자를 포함하면서,
-- 세 명의 사용자가 서로 모두 친구인 관계를 찾는다.
--
-- 중복된 세 친구 관계를 제거하기 위해
-- user_a_id < user_b_id < user_c_id인 경우만 출력한다.


SELECT
    t1.user_a_id AS user_a_id,
    t1.user_b_id AS user_b_id,
    t2.user_b_id AS user_c_id
FROM edges AS t1
INNER JOIN edges AS t2
    ON t1.user_b_id = t2.user_a_id
INNER JOIN edges AS t3
    ON t1.user_a_id = t3.user_a_id
   AND t2.user_b_id = t3.user_b_id
WHERE (
       t1.user_a_id = 3820
    OR t1.user_b_id = 3820
    OR t2.user_b_id = 3820
)
  AND t1.user_a_id < t1.user_b_id
  AND t1.user_b_id < t2.user_b_id;


-- 핵심 개념
-- 같은 edges 테이블을 여러 번 JOIN하는 SELF JOIN 형태로
-- 세 사용자 사이의 친구 관계를 확인한다.
--
-- t1
-- → A와 B의 친구 관계
--
-- t2
-- → B와 C의 친구 관계
--
-- t1.user_b_id = t2.user_a_id
-- → A-B-C로 이어지는 관계를 만든다.
--
-- 하지만 여기까지만 확인하면
-- A-B와 B-C가 친구라는 것만 알 수 있고
-- A-C가 친구인지는 알 수 없다.
--
-- 따라서 edges를 한 번 더 JOIN한다.
--
-- t3
-- → A와 C의 친구 관계가 실제로 존재하는지 확인
--
-- t1.user_a_id = t3.user_a_id
-- t2.user_b_id = t3.user_b_id
--
-- → A-C 관계까지 존재해야 JOIN에 성공하므로
--   A-B, B-C, A-C가 모두 친구인 세 명만 남는다.


-- 특정 사용자 포함 여부
-- 세 사용자 중 한 명이라도 3820이면 조건을 만족한다.
--
-- WHERE (
--        user_a_id = 3820
--     OR user_b_id = 3820
--     OR user_c_id = 3820
-- )


-- 중복 제거
-- 같은 세 사람은 순서만 바뀌어 여러 번 표현될 수 있다.
--
-- 예)
-- (1, 2, 3)
-- (2, 1, 3)
-- (3, 2, 1)
--
-- user_a_id < user_b_id < user_c_id 조건을 사용하면
-- 하나의 정렬된 조합만 남길 수 있다.


-- 풀이 기록
-- 세 명의 친구 관계를 찾기 위해 SELF JOIN을 사용하는 방법은 떠올렸지만,
-- 처음에는 edges 테이블을 한 번만 JOIN하여
-- A-B와 B-C 관계까지만 확인했다.
--
-- 강의 풀이를 참고한 뒤 edges를 한 번 더 JOIN하여
-- A-C 관계까지 확인해야 세 명이 서로 모두 친구인 관계가 된다는 점을 이해했다.