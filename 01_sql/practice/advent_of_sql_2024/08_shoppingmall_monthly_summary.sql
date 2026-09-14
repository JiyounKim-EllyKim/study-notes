-- Advent of SQL 2024
-- 08. 온라인 쇼핑몰의 월 별 매출액 집계

-- 문제
-- 월별로 정상 주문 금액, 취소 주문 금액,
-- 전체 주문 금액을 계산한다.
-- order_id가 C로 시작하면 취소 주문이다.


SELECT
    LEFT(o.order_date, 7) AS order_month,
    SUM(
        CASE
            WHEN o.order_id NOT LIKE 'C%'
            THEN oi.price * oi.quantity
            ELSE 0
        END
    ) AS ordered_amount,
    SUM(
        CASE
            WHEN o.order_id LIKE 'C%'
            THEN oi.price * oi.quantity
            ELSE 0
        END
    ) AS canceled_amount,
    SUM(oi.price * oi.quantity) AS total_amount
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY LEFT(o.order_date, 7)
ORDER BY order_month;


-- 핵심 개념
-- LEFT(order_date, 7)
-- → 날짜의 앞 7자리인 YYYY-MM을 추출
--
-- CASE WHEN ... THEN ... ELSE ... END
-- → 조건에 따라 서로 다른 값을 반환
--
-- SUM(CASE WHEN ... THEN price * quantity ELSE 0 END)
-- → 조건에 해당하는 주문 금액만 합산
--
-- 주문 금액 = 상품 가격(price) × 수량(quantity)


-- 다른 풀이
-- 강의에서는 YYYY-MM 추출에 TO_CHAR()를 사용했다.
-- 현재 MySQL에서는 LEFT()로 해결했으며,
-- DATE_FORMAT(order_date, '%Y-%m')도 사용할 수 있다.
--
-- CASE WHEN에서 ELSE를 생략하면 조건에 맞지 않는 경우 NULL이 되고,
-- SUM()은 NULL을 제외하고 합산하므로 같은 결과를 낼 수 있다.


-- 풀이 기록
-- SUM 안에서 CASE WHEN을 사용하는 방법은 떠올렸지만
-- 문법과 LEFT() 사용법을 검색해서 확인했다.
-- 처음에는 price만 사용했고, 강의를 확인한 뒤
-- price * quantity로 수정했다.