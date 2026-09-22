-- Advent of SQL 2024
-- 14. 전력 소비량 이동 평균 구하기

-- 문제
-- 10분 단위로 측정된 전력 소비량을 이용해
-- 각 시점의 최근 1시간 단순 이동 평균을 계산한다.
-- 결과는 소수점 둘째 자리까지 반올림한다.


SELECT
    DATE_ADD(measured_at, INTERVAL 10 MINUTE) AS end_at,
    ROUND(
        AVG(zone_quads) OVER (
            ORDER BY measured_at
            ROWS BETWEEN 5 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS zone_quads,
    ROUND(
        AVG(zone_smir) OVER (
            ORDER BY measured_at
            ROWS BETWEEN 5 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS zone_smir,
    ROUND(
        AVG(zone_boussafou) OVER (
            ORDER BY measured_at
            ROWS BETWEEN 5 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS zone_boussafou
FROM power_consumptions
WHERE measured_at BETWEEN '2017-01-01 00:00:00'
                      AND '2017-01-31 23:50:00';


-- 핵심 개념
-- DATE_ADD(date, INTERVAL 10 MINUTE)
-- → 측정 시각에서 10분 뒤를 이동 평균 범위의 끝 시각으로 표시
--
-- AVG() OVER (...)
-- → 원본 행을 유지하면서 이동 평균 계산
--
-- ROWS BETWEEN 5 PRECEDING AND CURRENT ROW
-- → 현재 행과 이전 5개 행, 총 6개 행을 평균에 사용
-- → 10분 간격 데이터이므로 총 1시간 범위
--
-- 데이터가 6개보다 적은 초반 구간에서는
-- 현재 존재하는 행만 이용해 평균을 계산한다.


-- 풀이 기록
-- DATE_ADD()는 검색을 통해 찾아서 적용했다.
-- 이동 평균의 개념은 알고 있었지만 Window Frame 문법을 몰라
-- 강의에서 ROWS BETWEEN 5 PRECEDING AND CURRENT ROW를 참고했다.
-- 나머지 AVG(), ROUND(), 조회 조건은 직접 작성했다.