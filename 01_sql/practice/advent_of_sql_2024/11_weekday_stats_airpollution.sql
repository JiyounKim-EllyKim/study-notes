-- Advent of SQL 2024
-- 11. 서울숲 요일별 대기오염도 계산하기

-- 문제
-- measurements 테이블의 데이터를 요일별로 그룹화하여
-- 각 대기오염도 지표의 평균을 소수점 넷째 자리까지 구한다.
-- 결과는 월요일부터 일요일 순서로 정렬한다.


SELECT
    CASE WEEKDAY(measured_at)
        WHEN 0 THEN '월요일'
        WHEN 1 THEN '화요일'
        WHEN 2 THEN '수요일'
        WHEN 3 THEN '목요일'
        WHEN 4 THEN '금요일'
        WHEN 5 THEN '토요일'
        WHEN 6 THEN '일요일'
    END AS weekday,
    ROUND(AVG(no2), 4) AS no2,
    ROUND(AVG(o3), 4) AS o3,
    ROUND(AVG(co), 4) AS co,
    ROUND(AVG(so2), 4) AS so2,
    ROUND(AVG(pm10), 4) AS pm10,
    ROUND(AVG(pm2_5), 4) AS pm2_5
FROM measurements
GROUP BY weekday
ORDER BY FIELD(
    weekday,
    '월요일', '화요일', '수요일', '목요일',
    '금요일', '토요일', '일요일'
);


-- 핵심 개념
-- WEEKDAY(date)
-- → 월요일부터 일요일까지 0~6의 정수로 반환
-- → 월요일 = 0, 화요일 = 1, ... , 일요일 = 6
--
-- CASE 값 WHEN ...
-- → 하나의 값을 여러 경우와 비교할 때 사용할 수 있다.
--
-- AVG() + ROUND(..., 4)
-- → 그룹별 평균을 계산하고 소수점 넷째 자리까지 반올림
--
-- FIELD(value, v1, v2, ...)
-- → value가 목록에서 몇 번째에 있는지 반환
-- → ORDER BY와 함께 사용하면 원하는 순서로 정렬할 수 있다.


-- 풀이 기록
-- GROUP BY와 평균 계산, ROUND()는 직접 작성했다.
-- WEEKDAY()의 요일별 반환값을 잘못 기억해 강의를 참고했고,
-- 월요일부터 일요일까지 원하는 순서로 정렬하기 위해
-- ORDER BY FIELD() 사용법을 강의에서 확인했다.