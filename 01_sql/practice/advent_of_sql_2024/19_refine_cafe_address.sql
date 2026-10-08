-- Advent of SQL 2024
-- 19. 전국 카페 주소 데이터 정제하기

-- 문제
-- address에서 시도(sido)와 시군구(sigungu)를 추출하고,
-- 각 행정구역에 포함된 카페 수를 집계한다.
-- 결과는 카페 수가 많은 순서대로 정렬한다.


WITH sido_sigungu AS (
    SELECT
        address,
        SUBSTRING_INDEX(address, ' ', 1) AS sido,
        SUBSTRING_INDEX(
            SUBSTRING_INDEX(address, ' ', 2),
            ' ',
            -1
        ) AS sigungu
    FROM cafes
)

SELECT
    sido,
    sigungu,
    COUNT(*) AS cnt
FROM sido_sigungu
GROUP BY sido, sigungu
ORDER BY cnt DESC;


-- 핵심 개념
-- SUBSTRING_INDEX(str, delimiter, count)
-- → 구분자를 기준으로 문자열의 일부를 추출한다.
--
-- SUBSTRING_INDEX(address, ' ', 1)
-- → 첫 번째 공백 앞까지 가져와 시도 추출
--
-- 예) '경기도 성남시 분당구 ...'
--     → '경기도'
--
-- SUBSTRING_INDEX(address, ' ', 2)
-- → 앞에서 두 번째 공백까지 가져옴
-- → '경기도 성남시'
--
-- 다시 SUBSTRING_INDEX(..., ' ', -1)
-- → 오른쪽에서 첫 번째 공백 뒤의 값을 가져옴
-- → '성남시'
--
-- COUNT(*) + GROUP BY
-- → 시도와 시군구별 카페 수 집계
--
-- ORDER BY cnt DESC
-- → 카페 수가 많은 행정구역부터 정렬


-- 풀이 기록
-- 주소에서 시도와 시군구를 분리하기 위해
-- SUBSTRING_INDEX() 사용법을 검색해서 적용했다.
-- 이후 GROUP BY와 COUNT()를 이용한 집계는 직접 작성했다.
-- 처음에는 정렬 방향을 놓쳤다가 DESC를 추가했다.