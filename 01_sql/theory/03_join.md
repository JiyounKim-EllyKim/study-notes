# JOIN 개념 정리

## 1. JOIN

`JOIN`은 두 개 이상의 테이블을 연결하여 데이터를 조회할 때 사용한다.

관계형 데이터베이스에서는 데이터가 여러 테이블에 나누어 저장되는 경우가 많다.
이때 공통 컬럼을 기준으로 테이블을 연결하여 필요한 데이터를 함께 조회할 수 있다.

예를 들어 `users` 테이블과 `orders` 테이블이 있다고 하자.

* `users`: 사용자 정보
* `orders`: 주문 정보

두 테이블에 공통으로 존재하는 `user_id`를 기준으로 연결하면, 사용자 정보와 주문 정보를 함께 조회할 수 있다.

---

## 2. JOIN 기본 형태

```sql
SELECT 컬럼명
FROM 테이블1
JOIN 테이블2
ON 테이블1.공통컬럼 = 테이블2.공통컬럼;
```

예시:

```sql
SELECT users.name,
       orders.order_id,
       orders.amount
FROM users
JOIN orders
ON users.user_id = orders.user_id;
```

위 쿼리는 `users` 테이블과 `orders` 테이블을 `user_id` 기준으로 연결한다.

---

## 3. INNER JOIN

`INNER JOIN`은 두 테이블에서 조건이 일치하는 데이터만 조회한다.

```sql
SELECT users.name,
       orders.order_id,
       orders.amount
FROM users
INNER JOIN orders
ON users.user_id = orders.user_id;
```

`users`에는 있지만 주문이 없는 사용자는 결과에 나오지 않는다.
`orders`에는 있지만 매칭되는 사용자가 없는 주문도 결과에 나오지 않는다.

즉, 양쪽 테이블에 모두 존재하는 데이터만 조회한다.

---

## 4. LEFT JOIN

`LEFT JOIN`은 왼쪽 테이블의 데이터는 모두 유지하고, 오른쪽 테이블에서 조건이 일치하는 데이터만 연결한다.

```sql
SELECT users.name,
       orders.order_id,
       orders.amount
FROM users
LEFT JOIN orders
ON users.user_id = orders.user_id;
```

이 경우 `users` 테이블의 모든 사용자가 조회된다.
주문이 없는 사용자는 `orders` 관련 컬럼이 `NULL`로 표시된다.

`LEFT JOIN`은 기준 테이블의 데이터를 모두 확인하고 싶을 때 자주 사용한다.

예를 들어 다음과 같은 상황에서 사용할 수 있다.

* 주문하지 않은 고객 찾기
* 게시글을 작성하지 않은 사용자 찾기
* 결제 이력이 없는 회원 찾기

---

## 5. RIGHT JOIN

`RIGHT JOIN`은 오른쪽 테이블의 데이터는 모두 유지하고, 왼쪽 테이블에서 조건이 일치하는 데이터만 연결한다.

```sql
SELECT users.name,
       orders.order_id,
       orders.amount
FROM users
RIGHT JOIN orders
ON users.user_id = orders.user_id;
```

이 경우 `orders` 테이블의 모든 주문이 조회된다.
매칭되는 사용자가 없는 주문은 `users` 관련 컬럼이 `NULL`로 표시된다.

실무에서는 `RIGHT JOIN`보다 `LEFT JOIN`을 더 자주 사용한다.
기준이 되는 테이블을 왼쪽에 두면 같은 결과를 `LEFT JOIN`으로 표현할 수 있기 때문이다.

---

## 6. FULL OUTER JOIN

`FULL OUTER JOIN`은 양쪽 테이블의 데이터를 모두 조회한다.

조건이 일치하는 데이터는 연결하고, 일치하지 않는 데이터도 모두 결과에 포함한다.

```sql
SELECT users.name,
       orders.order_id,
       orders.amount
FROM users
FULL OUTER JOIN orders
ON users.user_id = orders.user_id;
```

* 양쪽에 모두 있는 데이터는 연결되어 조회된다.
* `users`에만 있는 데이터도 조회된다.
* `orders`에만 있는 데이터도 조회된다.

단, DBMS에 따라 `FULL OUTER JOIN`을 지원하지 않을 수 있다.

---

## 7. CROSS JOIN

`CROSS JOIN`은 두 테이블의 모든 조합을 만든다.

```sql
SELECT users.name,
       products.product_name
FROM users
CROSS JOIN products;
```

예를 들어 `users`가 3행, `products`가 4행이면 결과는 12행이 된다.

`CROSS JOIN`은 모든 조합이 필요한 경우에 사용하지만, 결과 행 수가 매우 커질 수 있으므로 주의해야 한다.

---

## 8. SELF JOIN

`SELF JOIN`은 같은 테이블을 자기 자신과 연결하는 방식이다.

예를 들어 직원 테이블에서 직원과 매니저 정보를 함께 조회할 때 사용할 수 있다.

```sql
SELECT e.name AS employee_name,
       m.name AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;
```

같은 테이블을 두 번 사용하므로 별칭을 반드시 사용하는 것이 좋다.

* `e`: 직원
* `m`: 매니저

---

## 9. 테이블 별칭 Alias

JOIN을 사용할 때는 테이블명이 길어질 수 있으므로 별칭을 자주 사용한다.

```sql
SELECT u.name,
       o.order_id,
       o.amount
FROM users AS u
JOIN orders AS o
ON u.user_id = o.user_id;
```

별칭을 사용하면 쿼리를 더 간결하게 작성할 수 있다.

`AS`는 생략할 수 있다.

```sql
SELECT u.name,
       o.order_id,
       o.amount
FROM users u
JOIN orders o
ON u.user_id = o.user_id;
```

---

## 10. ON과 WHERE의 차이

`ON`은 테이블을 연결하는 조건을 작성하는 곳이다.

```sql
SELECT *
FROM users u
JOIN orders o
ON u.user_id = o.user_id;
```

`WHERE`는 JOIN이 끝난 뒤 조회 결과를 필터링하는 조건이다.

```sql
SELECT *
FROM users u
JOIN orders o
ON u.user_id = o.user_id
WHERE o.amount >= 10000;
```

즉, 역할은 다음과 같다.

| 구분    | 역할                   |
| ----- | -------------------- |
| ON    | 테이블을 연결하는 조건         |
| WHERE | 연결된 결과에서 행을 필터링하는 조건 |

---

## 11. JOIN 사용 시 주의할 점

### 11.1. 연결 기준 컬럼 확인

JOIN을 할 때는 두 테이블을 어떤 컬럼으로 연결할지 정확히 확인해야 한다.

예를 들어 사용자와 주문은 보통 `user_id`를 기준으로 연결한다.

```sql
ON users.user_id = orders.user_id
```

연결 기준이 잘못되면 결과가 틀리거나 행 수가 비정상적으로 늘어날 수 있다.

---

### 11.2. 중복 행 발생

JOIN 결과는 원본 테이블보다 행 수가 늘어날 수 있다.

예를 들어 한 명의 사용자가 여러 번 주문했다면, `users`와 `orders`를 JOIN했을 때 해당 사용자는 주문 수만큼 반복해서 나타난다.

| user_id | name |
| ------- | ---- |
| 1       | Kim  |

| order_id | user_id | amount |
| -------- | ------- | -----: |
| 101      | 1       |  10000 |
| 102      | 1       |  20000 |

JOIN 결과:

| user_id | name | order_id | amount |
| ------- | ---- | -------- | -----: |
| 1       | Kim  | 101      |  10000 |
| 1       | Kim  | 102      |  20000 |

이는 오류가 아니라 관계형 데이터에서 자연스러운 결과이다.

---

## 12. JOIN 종류 정리

| JOIN 종류         | 설명                           |
| --------------- | ---------------------------- |
| INNER JOIN      | 양쪽 테이블에서 조건이 일치하는 데이터만 조회    |
| LEFT JOIN       | 왼쪽 테이블은 모두 유지하고, 오른쪽 테이블을 연결 |
| RIGHT JOIN      | 오른쪽 테이블은 모두 유지하고, 왼쪽 테이블을 연결 |
| FULL OUTER JOIN | 양쪽 테이블의 모든 데이터를 조회           |
| CROSS JOIN      | 두 테이블의 모든 조합을 생성             |
| SELF JOIN       | 같은 테이블을 자기 자신과 연결            |

---

## 13. 정리

* `JOIN`은 여러 테이블을 연결하여 조회할 때 사용한다.
* `INNER JOIN`은 양쪽에 모두 존재하는 데이터만 조회한다.
* `LEFT JOIN`은 왼쪽 테이블을 기준으로 데이터를 유지한다.
* `RIGHT JOIN`은 오른쪽 테이블을 기준으로 데이터를 유지한다.
* `FULL OUTER JOIN`은 양쪽 테이블의 모든 데이터를 조회한다.
* `CROSS JOIN`은 모든 조합을 만든다.
* `SELF JOIN`은 같은 테이블을 자기 자신과 연결한다.
* `ON`은 테이블 연결 조건, `WHERE`는 결과 필터링 조건이다.
* JOIN 결과는 관계에 따라 행 수가 늘어날 수 있다.
