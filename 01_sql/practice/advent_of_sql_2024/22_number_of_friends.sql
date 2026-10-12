-- Advent of SQL 2024
-- 22. 친구 수 집계하기

-- 문제
-- 모든 사용자의 친구 수를 계산한다.
-- 친구가 없는 사용자도 결과에 포함하며,
-- 친구 수가 많은 순서대로 정렬한다.
-- 친구 수가 같다면 user_id가 작은 사용자를 먼저 출력한다.


WITH relationship_all AS (
    SELECT
        user_a_id,
        user_b_id
    FROM edges

    UNION ALL

    SELECT
        user_b_id AS user_a_id,
        user_a_id AS user_b_id
    FROM edges
)

SELECT
    u.user_id,
    COUNT(r.user_b_id) AS num_friends
FROM users AS u
LEFT JOIN relationship_all AS r
    ON u.user_id = r.user_a_id
GROUP BY u.user_id
ORDER BY num_friends DESC, u.user_id;


-- 핵심 개념
-- 친구 관계는 양방향이므로
-- (A, B)뿐만 아니라 (B, A) 형태도 만들어야 한다.
--
-- UNION ALL
-- → 두 SELECT 결과를 중복 제거 없이 합친다.
-- → UNION은 중복을 제거하지만,
--   UNION ALL은 모든 행을 그대로 유지한다.
--
-- LEFT JOIN
-- → 친구 관계가 없는 사용자도 users 테이블에서 유지한다.
--
-- COUNT(*)
-- → LEFT JOIN으로 생성된 행 자체를 세기 때문에
--   친구가 없는 사용자도 1로 계산될 수 있다.
--
-- COUNT(r.user_b_id)
-- → 오른쪽 테이블에서 실제로 매칭된 NULL이 아닌 값만 계산
-- → 친구가 없는 사용자는 0으로 계산된다.
--
-- ORDER BY num_friends DESC, u.user_id
-- → 친구 수가 많은 순으로 정렬하고,
--   친구 수가 같으면 user_id 오름차순으로 정렬한다.


-- 풀이 기록
-- 처음에는 친구 관계를 한 방향으로만 집계했지만,
-- 친구 관계가 양방향이므로 반대 방향 데이터를 UNION해야 한다는 점을
-- 강의를 통해 확인했다.
--
-- 처음에는 LEFT JOIN 없이 친구 관계 테이블만 사용해
-- 친구가 없는 사용자가 결과에서 빠졌고,
-- COUNT(*)를 사용해 친구가 없는 사용자를 1명으로 세는 문제도 있었다.
--
-- LEFT JOIN과 COUNT(column)의 차이를 확인한 뒤
-- 모든 사용자의 친구 수를 올바르게 집계하도록 수정했다.