-- Advent of SQL 2024
-- 04. 지자체별 따릉이 정류소 개수 세기

-- 문제
-- 각 지자체(local)에 속한 정류소의 개수를 구하고
-- num_stations 기준 오름차순으로 정렬한다.


SELECT
    local,
    COUNT(*) AS num_stations
FROM station
GROUP BY local
ORDER BY num_stations;


-- 핵심 개념
-- COUNT(column) : 해당 컬럼의 NULL이 아닌 값 개수를 계산
-- GROUP BY local : 같은 local 값을 가진 행을 하나의 그룹으로 묶음
-- AS num_stations : 집계 결과에 별칭 지정
-- ORDER BY num_stations : 정류소 개수를 기준으로 오름차순 정렬


-- 풀이 기록
-- GROUP BY와 정렬은 직접 작성했고,
-- COUNT() 사용법이 기억나지 않아 개념 노트를 참고했다.