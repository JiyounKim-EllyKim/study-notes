-- Advent of SQL 2024
-- 21. 세션 유지 시간을 10분으로 재정의하기

-- 문제
-- 특정 사용자의 이벤트 로그에서
-- 이전 이벤트와 10분 이상 차이가 나면 새로운 세션으로 정의한다.
-- 새롭게 정의한 세션 ID를 1부터 순서대로 부여한다.


WITH preprocessed AS (
    SELECT
        user_pseudo_id,
        event_timestamp_kst,
        event_name,
        ga_session_id,
        TIMESTAMPDIFF(
            SECOND,
            LAG(event_timestamp_kst, 1) OVER (
                ORDER BY event_timestamp_kst
            ),
            event_timestamp_kst
        ) AS last_event,
        ROW_NUMBER() OVER (
            ORDER BY event_timestamp_kst
        ) AS id
    FROM ga
    WHERE user_pseudo_id = 'a8Xu9GO6TB'
)

SELECT
    user_pseudo_id,
    event_timestamp_kst,
    event_name,
    ga_session_id,
    DENSE_RANK() OVER (
        ORDER BY new_session_id
    ) AS new_session_id
FROM (
    SELECT
        user_pseudo_id,
        event_timestamp_kst,
        event_name,
        ga_session_id,
        MAX(
            CASE
                WHEN last_event >= 600 THEN id
                WHEN last_event IS NULL THEN id
            END
        ) OVER (
            ORDER BY event_timestamp_kst
        ) AS new_session_id
    FROM preprocessed
) AS t
ORDER BY event_timestamp_kst;


-- 핵심 개념
-- LAG()
-- → 현재 행의 이전 이벤트 시간을 가져온다.
--
-- TIMESTAMPDIFF(SECOND, 이전시간, 현재시간)
-- → 이전 이벤트와 현재 이벤트 사이의 시간 차이를 초 단위로 계산
--
-- 600초 = 10분
-- → last_event >= 600이면 새로운 세션 시작
--
-- last_event IS NULL
-- → 첫 번째 이벤트에는 이전 이벤트가 없으므로
--   첫 행 역시 새로운 세션의 시작점으로 처리
--
-- ROW_NUMBER()
-- → 이벤트를 시간 순서대로 정렬하여 고유한 id 부여
--
-- CASE WHEN ... THEN id
-- → 새로운 세션이 시작되는 행에만 시작 id를 남긴다.
--
-- MAX(...) OVER (ORDER BY event_timestamp_kst)
-- → 현재 행까지 등장한 가장 최근의 세션 시작 id를 유지
-- → 다음 세션이 시작될 때까지 같은 값을 가지므로
--   같은 세션의 이벤트들을 하나의 그룹으로 묶을 수 있다.
--
-- DENSE_RANK()
-- → 세션 시작 id를 1, 2, 3, ... 형태의 연속된 세션 번호로 변환


-- 풀이 기록
-- TIMESTAMPDIFF()와 LAG() 사용법은 검색해서 확인했다.
-- 이전 이벤트와 10분 이상 차이나면 새로운 세션으로
-- 구분해야 한다는 로직까지는 이해했지만,
-- 이를 실제 세션 ID로 만드는 방법은 강의를 참고했다.
--
-- ROW_NUMBER()로 이벤트별 id를 부여하고,
-- 새로운 세션이 시작되는 행의 id를 CASE WHEN으로 표시한 뒤
-- 누적 MAX()를 이용해 같은 세션의 이벤트에 동일한 시작 id를 부여했다.
-- 마지막으로 DENSE_RANK()를 사용해 세션 ID를 1부터 다시 매겼다.