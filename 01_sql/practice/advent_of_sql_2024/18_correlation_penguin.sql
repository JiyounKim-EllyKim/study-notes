-- Advent of SQL 2024
-- 18. 펭귄 날개와 몸무게의 상관 계수

-- 문제
-- 펭귄 종(species)별로
-- 날개 길이(flipper_length_mm)와 몸무게(body_mass_g)의
-- 피어슨 상관계수를 계산하고 소수점 셋째 자리까지 반올림한다.


WITH stats AS (
    SELECT
        species,
        AVG(flipper_length_mm) AS flipper_mean,
        AVG(body_mass_g) AS mass_mean
    FROM penguins
    GROUP BY species
)

SELECT
    p.species,
    ROUND(
        SUM(
            (p.flipper_length_mm - s.flipper_mean)
            * (p.body_mass_g - s.mass_mean)
        )
        /
        SQRT(
            SUM(POWER(p.flipper_length_mm - s.flipper_mean, 2))
            * SUM(POWER(p.body_mass_g - s.mass_mean, 2))
        ),
        3
    ) AS corr
FROM penguins AS p
JOIN stats AS s
    ON p.species = s.species
GROUP BY p.species;


-- 핵심 개념
-- AVG()
-- → 종별 날개 길이와 몸무게의 평균을 계산
--
-- POWER(value, 2)
-- → 값을 제곱
-- → Python의 ** 연산자와 달리 SQL에서는 POWER()를 사용할 수 있다.
--
-- SQRT(value)
-- → 제곱근을 계산
--
-- 피어슨 상관계수
--
--            Σ((x - x̄)(y - ȳ))
-- r = --------------------------------
--     √(Σ(x - x̄)² × Σ(y - ȳ)²)
--
-- 종별 평균을 CTE에서 먼저 구한 뒤,
-- 원본 데이터와 JOIN하여 편차와 상관계수를 계산한다.


-- 다른 풀이
-- 강의에서는 계산에 필요한 값을 먼저 각각 집계했다.
--
-- x  = Σ(flipper_length_mm - 평균)²
-- y  = Σ(body_mass_g - 평균)²
-- xy = Σ((flipper_length_mm - 평균) * (body_mass_g - 평균))
--
-- 이후 바깥 쿼리에서
--
-- xy / (SQRT(x) * SQRT(y))
--
-- 형태로 상관계수를 계산했다.
--
-- 또한 계산 대상에 NULL이 포함되지 않도록
-- flipper_length_mm과 body_mass_g의 NULL 여부를 명시적으로 확인했다.


-- 풀이 기록
-- 피어슨 상관계수 공식이 기억나지 않아 확인한 뒤 SQL로 구현했다.
-- 제곱 표현도 Python의 **와 헷갈려 POWER() 사용법을 검색했다.
-- 그 외에는 종별 평균을 CTE로 계산하고 JOIN한 뒤
-- 상관계수를 구하는 구조를 직접 작성했다.