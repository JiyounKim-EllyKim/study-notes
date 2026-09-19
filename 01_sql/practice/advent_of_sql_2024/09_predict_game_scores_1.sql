-- Advent of SQL 2024
-- 09. 게임 평점 예측하기 1

-- 문제
-- 2015년 이후 출시된 게임 중 평점 정보가 누락된 게임을 찾고,
-- 같은 장르의 게임 평균값을 이용해 누락된 값을 채운다.
--
-- 평점 평균은 소수점 셋째 자리까지 반올림하고,
-- 평가자 수는 올림하여 정수로 표시한다.


WITH avg_table AS (
    SELECT
        genre_id,
        ROUND(AVG(critic_score), 3) AS avg_critic_score,
        CEIL(AVG(critic_count)) AS avg_critic_count,
        ROUND(AVG(user_score), 3) AS avg_user_score,
        CEIL(AVG(user_count)) AS avg_user_count
    FROM games
    GROUP BY genre_id
)

SELECT
    g.game_id,
    g.name,
    CASE
        WHEN g.critic_score IS NULL THEN a.avg_critic_score
        ELSE g.critic_score
    END AS critic_score,
    CASE
        WHEN g.critic_count IS NULL THEN a.avg_critic_count
        ELSE g.critic_count
    END AS critic_count,
    CASE
        WHEN g.user_score IS NULL THEN a.avg_user_score
        ELSE g.user_score
    END AS user_score,
    CASE
        WHEN g.user_count IS NULL THEN a.avg_user_count
        ELSE g.user_count
    END AS user_count
FROM games AS g
JOIN avg_table AS a
    ON g.genre_id = a.genre_id
WHERE g.year >= 2015
  AND (
      g.critic_score IS NULL
      OR g.critic_count IS NULL
      OR g.user_score IS NULL
      OR g.user_count IS NULL
  );


-- 핵심 개념
-- WITH ... AS : CTE를 만들어 복잡한 쿼리를 단계별로 작성
-- AVG()       : 장르별 평균 계산
-- ROUND(x, 3) : 소수점 셋째 자리까지 반올림
-- CEIL()      : 평균 인원수를 올림하여 정수로 변환
--
-- CASE WHEN ... IS NULL
-- → 값이 없으면 같은 장르의 평균값으로 대체
--
-- 장르별 평균값을 먼저 CTE로 계산한 뒤
-- genre_id를 기준으로 원본 games 테이블과 JOIN한다.


-- 다른 풀이
-- 강의에서는 CASE WHEN 대신 COALESCE()를 사용했다.
-- COALESCE는 앞에서부터 NULL이 아닌 첫 번째 값을 반환한다.
--
-- COALESCE(g.critic_score, a.avg_critic_score) AS critic_score
-- COALESCE(g.critic_count, a.avg_critic_count) AS critic_count
-- COALESCE(g.user_score, a.avg_user_score) AS user_score
-- COALESCE(g.user_count, a.avg_user_count) AS user_count


-- 풀이 기록
-- 장르별 평균값을 CTE로 만든 뒤 JOIN하고,
-- CASE WHEN을 이용해 NULL 값을 평균값으로 대체하는 구조를 직접 구성했다.
-- 시간이 오래 걸렸지만 별도 풀이 참고 없이 해결했다.
-- 이후 강의에서 COALESCE()를 이용하면 같은 로직을 더 간결하게
-- 표현할 수 있다는 점을 확인했다.