# CTE 개념 정리

## 1. CTE

CTE는 Common Table Expression의 약자로, SQL 안에서 임시 결과 집합을 정의하여 사용하는 문법이다.

복잡한 쿼리를 여러 단계로 나누어 작성할 수 있기 때문에 쿼리의 가독성을 높이는 데 유용하다.

CTE는 `WITH` 절을 사용하여 작성한다.

```sql
WITH cte_name AS (
    SELECT 컬럼명
    FROM 테이블명
    WHERE 조건
)
SELECT *
FROM cte_name;
```

---

## 2. CTE 기본 예시

예를 들어 주문 테이블에서 사용자별 총 주문 금액을 먼저 계산한 뒤, 총 주문 금액이 100000 이상인 사용자만 조회한다고 하자.

```sql
WITH order_summary AS (
    SELECT user_id,
           SUM(amount) AS total_amount
    FROM orders
    GROUP BY user_id
)
SELECT user_id,
       total_amount
FROM order_summary
WHERE total_amount >= 100000;
```

위 쿼리는 다음 순서로 이해할 수 있다.

1. `order_summary`라는 임시 결과를 만든다.
2. 사용자별 총 주문 금액을 계산한다.
3. 그 결과에서 총 주문 금액이 100000 이상인 사용자만 조회한다.

---

## 3. CTE를 사용하는 이유

CTE를 사용하면 복잡한 쿼리를 단계별로 나눌 수 있다.

서브쿼리를 중첩해서 작성하면 쿼리가 길고 복잡해질 수 있는데, CTE를 사용하면 각 단계에 이름을 붙여서 더 읽기 쉽게 만들 수 있다.

### 장점

* 복잡한 쿼리를 단계별로 나눌 수 있다.
* 쿼리 가독성이 좋아진다.
* 중간 결과에 이름을 붙일 수 있다.
* 같은 CTE를 뒤에서 여러 번 참조할 수 있다.
* 서브쿼리보다 구조를 이해하기 쉽다.

---

## 4. CTE와 서브쿼리 비교

CTE와 서브쿼리는 모두 쿼리 결과를 다른 쿼리에서 활용할 수 있다는 점에서 비슷하다.

| 구분     | CTE              | 서브쿼리                         |
| ------ | ---------------- | ---------------------------- |
| 작성 위치  | `WITH` 절         | `SELECT`, `FROM`, `WHERE` 내부 |
| 가독성    | 복잡한 쿼리에서 좋음      | 중첩되면 복잡해질 수 있음               |
| 재사용    | 같은 쿼리 안에서 재사용 가능 | 보통 한 번만 사용                   |
| 적합한 경우 | 단계별 분석 쿼리        | 간단한 조건 조회                    |

---

## 5. 여러 개의 CTE 사용

하나의 쿼리에서 여러 개의 CTE를 정의할 수 있다.

```sql
WITH user_orders AS (
    SELECT user_id,
           COUNT(*) AS order_count,
           SUM(amount) AS total_amount
    FROM orders
    GROUP BY user_id
),
high_value_users AS (
    SELECT user_id,
           total_amount
    FROM user_orders
    WHERE total_amount >= 100000
)
SELECT *
FROM high_value_users;
```

이 쿼리는 다음과 같이 동작한다.

1. `user_orders`에서 사용자별 주문 횟수와 총 주문 금액을 계산한다.
2. `high_value_users`에서 총 주문 금액이 100000 이상인 사용자만 필터링한다.
3. 최종적으로 `high_value_users`를 조회한다.

---

## 6. CTE와 JOIN 함께 사용

CTE는 JOIN과 함께 자주 사용된다.

예를 들어 사용자별 총 주문 금액을 계산한 뒤, 사용자 이름과 함께 조회할 수 있다.

```sql
WITH order_summary AS (
    SELECT user_id,
           SUM(amount) AS total_amount
    FROM orders
    GROUP BY user_id
)
SELECT u.user_id,
       u.name,
       os.total_amount
FROM users u
JOIN order_summary os
ON u.user_id = os.user_id;
```

이 쿼리는 주문 데이터를 먼저 사용자별로 요약한 뒤, `users` 테이블과 연결하여 사용자 이름을 함께 보여준다.

---

## 7. CTE와 윈도우 함수 함께 사용

CTE는 윈도우 함수 결과를 다시 필터링할 때도 자주 사용된다.

예를 들어 사용자별 주문 금액 순위를 구한 뒤, 각 사용자별 가장 큰 주문만 조회할 수 있다.

```sql
WITH ranked_orders AS (
    SELECT order_id,
           user_id,
           amount,
           ROW_NUMBER() OVER (
               PARTITION BY user_id
               ORDER BY amount DESC
           ) AS rn
    FROM orders
)
SELECT order_id,
       user_id,
       amount
FROM ranked_orders
WHERE rn = 1;
```

이 쿼리는 다음과 같이 동작한다.

1. `ranked_orders`에서 사용자별 주문 금액 순위를 계산한다.
2. `rn = 1`인 행만 조회하여 사용자별 가장 큰 주문을 가져온다.

---

## 8. Recursive CTE

Recursive CTE는 자기 자신을 참조하는 CTE이다.

계층 구조 데이터를 다룰 때 사용할 수 있다.

예를 들어 조직도, 카테고리 구조, 댓글 대댓글 구조처럼 부모-자식 관계가 있는 데이터를 조회할 때 활용할 수 있다.

기본 형태는 다음과 같다.

```sql
WITH RECURSIVE cte_name AS (
    -- 시작 조건
    SELECT 컬럼명
    FROM 테이블명
    WHERE 조건

    UNION ALL

    -- 반복 조건
    SELECT 컬럼명
    FROM 테이블명
    JOIN cte_name
    ON 연결조건
)
SELECT *
FROM cte_name;
```

Recursive CTE는 일반 CTE보다 복잡하므로, 기본 CTE를 먼저 이해한 뒤 학습하는 것이 좋다.

---

## 9. CTE 사용 시 주의할 점

* CTE는 해당 SQL 문 안에서만 사용할 수 있다.
* 쿼리가 끝나면 CTE 결과는 저장되지 않는다.
* CTE는 임시 테이블처럼 보이지만 실제 테이블은 아니다.
* DBMS에 따라 CTE 최적화 방식이 다를 수 있다.
* 매우 큰 데이터를 다룰 때는 성능을 확인하는 것이 좋다.

---

## 10. 정리

* CTE는 `WITH` 절을 사용하여 임시 결과 집합을 정의하는 문법이다.
* 복잡한 쿼리를 단계별로 나누어 작성할 수 있다.
* 서브쿼리보다 가독성이 좋은 경우가 많다.
* 여러 개의 CTE를 한 쿼리 안에서 사용할 수 있다.
* JOIN, 집계 함수, 윈도우 함수와 함께 자주 사용된다.
* Recursive CTE는 계층 구조 데이터를 다룰 때 사용할 수 있다.
