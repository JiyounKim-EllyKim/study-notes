-- Advent of SQL 2024
-- 12. 3년간 들어온 소장품 집계하기

-- 문제
-- classification별로 2014년, 2015년, 2016년에
-- 추가된 소장품 수를 각각 집계한다.
-- 결과는 classification 기준 오름차순으로 정렬한다.


SELECT
    classification,
    SUM(
        CASE
            WHEN YEAR(acquisition_date) = 2014 THEN 1
            ELSE 0
        END
    ) AS '2014',
    SUM(
        CASE
            WHEN YEAR(acquisition_date) = 2015 THEN 1
            ELSE 0
        END
    ) AS '2015',
    SUM(
        CASE
            WHEN YEAR(acquisition_date) = 2016 THEN 1
            ELSE 0
        END
    ) AS '2016'
FROM artworks
GROUP BY classification
ORDER BY classification;


-- 핵심 개념
-- YEAR(date)
-- → 날짜에서 연도만 추출
--
-- SUM(CASE WHEN ... THEN 1 ELSE 0 END)
-- → 조건을 만족하는 행의 개수를 집계
--
-- GROUP BY classification
-- → 소장품 분류별로 묶어서 연도별 개수를 계산


-- 다른 풀이
-- 강의에서는 YEAR() 대신 날짜 범위를 직접 지정했다.
--
-- acquisition_date BETWEEN '2014-01-01' AND '2014-12-31'
--
-- 날짜 컬럼에 함수를 적용하지 않는 범위 조건은
-- 인덱스가 있는 경우 성능상 유리할 수 있다.


-- 풀이 기록
-- YEAR(), CASE WHEN, SUM(), GROUP BY를 조합해
-- 별도 검색이나 강의 참고 없이 직접 해결했다.