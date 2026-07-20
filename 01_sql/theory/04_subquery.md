# Subquery 개념 정리

## 1. Subquery

Subquery는 SQL 문 안에 포함된 또 다른 SQL 문을 의미한다.

즉, 하나의 쿼리 결과를 다른 쿼리에서 조건이나 테이블처럼 활용하는 방식이다.

```sql
SELECT 컬럼명
FROM 테이블명
WHERE 컬럼명 = (
    SELECT 컬럼명
    FROM 테이블명
    WHERE 조건
);
```

서브쿼리는 주로 다음 위치에서 사용된다.

* `WHERE` 절
* `FROM` 절
* `SELECT` 절

---

## 2. WHERE 절 서브쿼리

`WHERE` 절의 서브쿼리는 특정 조건값을 다른 쿼리 결과로부터 가져올 때 사용한다.

예를 들어 평균 주문 금액보다 큰 주문만 조회하려면 다음과 같이 작성할 수 있다.

```sql
SELECT *
FROM orders
WHERE amount > (
    SELECT AVG(amount)
    FROM orders
);
```

위 쿼리는 먼저 전체 주문의 평균 금액을 구한 뒤, 그 값보다 큰 주문만 조회한다.

---

## 3. 단일 행 서브쿼리

단일 행 서브쿼리는 결과가 하나의 값만 나오는 서브쿼리이다.

```sql
SELECT *
FROM users
WHERE age = (
    SELECT MAX(age)
    FROM users
);
```

위 쿼리는 가장 나이가 많은 사용자를 조회한다.

단일 행 서브쿼리에서는 주로 다음 연산자를 사용한다.

| 연산자 | 의미     |
| --- | ------ |
| =   | 같다     |
| !=  | 같지 않다  |
| >   | 크다     |
| >=  | 크거나 같다 |
| <   | 작다     |
| <=  | 작거나 같다 |

---

## 4. 다중 행 서브쿼리

다중 행 서브쿼리는 결과가 여러 행으로 나오는 서브쿼리이다.

이 경우 `=`, `>` 같은 단일 비교 연산자 대신 `IN`, `ANY`, `ALL` 등을 사용한다.

---

### 4.1. IN

`IN`은 서브쿼리 결과 중 하나라도 일치하는 값을 조회할 때 사용한다.

```sql
SELECT *
FROM users
WHERE user_id IN (
    SELECT user_id
    FROM orders
);
```

위 쿼리는 주문 이력이 있는 사용자만 조회한다.

---

### 4.2. NOT IN

`NOT IN`은 서브쿼리 결과에 포함되지 않는 값을 조회할 때 사용한다.

```sql
SELECT *
FROM users
WHERE user_id NOT IN (
    SELECT user_id
    FROM orders
);
```

위 쿼리는 주문 이력이 없는 사용자를 조회한다.

단, 서브쿼리 결과에 `NULL`이 포함되면 의도와 다르게 동작할 수 있으므로 주의해야 한다.

---

## 5. EXISTS

`EXISTS`는 서브쿼리 결과가 존재하는지 여부를 확인할 때 사용한다.

```sql
SELECT *
FROM users u
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.user_id = u.user_id
);
```

위 쿼리는 주문 이력이 있는 사용자를 조회한다.

`EXISTS`는 서브쿼리에서 조건에 맞는 행이 하나라도 존재하면 `TRUE`를 반환한다.

---

## 6. NOT EXISTS

`NOT EXISTS`는 서브쿼리 결과가 존재하지 않는 경우를 조회할 때 사용한다.

```sql
SELECT *
FROM users u
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.user_id = u.user_id
);
```

위 쿼리는 주문 이력이 없는 사용자를 조회한다.

`NOT IN`은 `NULL`에 영향을 받을 수 있으므로, 실무에서는 `NOT EXISTS`를 더 안전하게 사용하는 경우가 많다.

---

## 7. FROM 절 서브쿼리

`FROM` 절의 서브쿼리는 서브쿼리 결과를 하나의 임시 테이블처럼 사용할 때 사용한다.

```sql
SELECT user_id, total_amount
FROM (
    SELECT user_id, SUM(amount) AS total_amount
    FROM orders
    GROUP BY user_id
) AS order_summary
WHERE total_amount >= 100000;
```

위 쿼리는 먼저 사용자별 총 주문 금액을 계산한 뒤, 총 주문 금액이 100000 이상인 사용자만 조회한다.

`FROM` 절 서브쿼리에는 반드시 별칭을 붙이는 것이 좋다.

---

## 8. SELECT 절 서브쿼리

`SELECT` 절의 서브쿼리는 각 행마다 계산된 값을 함께 출력할 때 사용한다.

```sql
SELECT 
    u.user_id,
    u.name,
    (
        SELECT COUNT(*)
        FROM orders o
        WHERE o.user_id = u.user_id
    ) AS order_count
FROM users u;
```

위 쿼리는 사용자 정보와 함께 각 사용자의 주문 횟수를 조회한다.

다만 `SELECT` 절 서브쿼리는 행마다 반복 실행될 수 있어 데이터가 많을 경우 성능에 주의해야 한다.

---

## 9. 상관 서브쿼리 Correlated Subquery

상관 서브쿼리는 바깥 쿼리의 컬럼을 서브쿼리 안에서 참조하는 서브쿼리이다.

```sql
SELECT *
FROM orders o1
WHERE amount > (
    SELECT AVG(amount)
    FROM orders o2
    WHERE o2.user_id = o1.user_id
);
```

위 쿼리는 각 사용자의 평균 주문 금액보다 큰 주문만 조회한다.

서브쿼리 안에서 바깥 쿼리의 `o1.user_id`를 참조하고 있으므로 상관 서브쿼리이다.

---

## 10. Subquery와 JOIN 비교

서브쿼리와 JOIN은 비슷한 결과를 만들 수 있는 경우가 많다.

| 구분   | Subquery       | JOIN             |
| ---- | -------------- | ---------------- |
| 특징   | 쿼리 안에 쿼리를 포함   | 테이블을 직접 연결       |
| 장점   | 단계적으로 이해하기 쉬움  | 여러 테이블 조회에 효율적   |
| 단점   | 복잡해지면 성능 저하 가능 | JOIN 구조를 이해해야 함  |
| 사용 예 | 특정 조건값 조회      | 여러 테이블의 컬럼 함께 조회 |

일반적으로 단순 조건 확인은 서브쿼리로, 여러 테이블의 컬럼을 함께 조회할 때는 JOIN을 많이 사용한다.

---

## 11. 정리

* Subquery는 SQL 안에 포함된 또 다른 SQL이다.
* `WHERE` 절에서는 조건값을 계산할 때 자주 사용한다.
* `FROM` 절에서는 서브쿼리 결과를 임시 테이블처럼 사용한다.
* `SELECT` 절에서는 각 행마다 계산된 값을 함께 출력할 수 있다.
* 단일 행 서브쿼리는 하나의 값만 반환한다.
* 다중 행 서브쿼리는 여러 값을 반환하며 `IN`, `EXISTS` 등을 함께 사용한다.
* `NOT IN`은 `NULL`에 주의해야 한다.
* 상관 서브쿼리는 바깥 쿼리의 컬럼을 서브쿼리에서 참조한다.
