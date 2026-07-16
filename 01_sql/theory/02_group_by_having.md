# GROUP BY / HAVING 개념 정리

## 1. GROUP BY

`GROUP BY`는 데이터를 특정 컬럼 기준으로 그룹화할 때 사용한다.

주로 집계 함수와 함께 사용하여 그룹별 합계, 평균, 개수 등을 구할 수 있다.

기본 형태는 다음과 같다.

```sql
SELECT 그룹기준컬럼, 집계함수(컬럼명)
FROM 테이블명
GROUP BY 그룹기준컬럼;
```

예를 들어 도시별 사용자 수를 구하려면 다음과 같이 작성한다.

```sql
SELECT city, COUNT(*) AS user_count
FROM users
GROUP BY city;
```

---

## 2. 집계 함수

집계 함수는 여러 행의 값을 하나의 결과값으로 요약할 때 사용한다.

| 함수      | 의미    |
| ------- | ----- |
| COUNT() | 행의 개수 |
| SUM()   | 합계    |
| AVG()   | 평균    |
| MAX()   | 최댓값   |
| MIN()   | 최솟값   |

---

## 3. COUNT

`COUNT`는 행의 개수를 셀 때 사용한다.

```sql
SELECT COUNT(*) AS total_count
FROM users;
```

`COUNT(*)`는 전체 행의 개수를 센다.

특정 컬럼을 기준으로 개수를 셀 수도 있다.

```sql
SELECT COUNT(email) AS email_count
FROM users;
```

이 경우 `email` 값이 `NULL`이 아닌 행만 센다.

---

## 4. SUM / AVG / MAX / MIN

수치형 컬럼에 대해 합계, 평균, 최댓값, 최솟값을 구할 수 있다.

```sql
SELECT 
    SUM(amount) AS total_amount,
    AVG(amount) AS avg_amount,
    MAX(amount) AS max_amount,
    MIN(amount) AS min_amount
FROM orders;
```

---

## 5. GROUP BY 사용 예시

주문 테이블에서 고객별 총 주문 금액을 구하려면 다음과 같이 작성한다.

```sql
SELECT user_id, SUM(amount) AS total_amount
FROM orders
GROUP BY user_id;
```

카테고리별 평균 가격을 구할 수도 있다.

```sql
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category;
```

---

## 6. 여러 컬럼으로 GROUP BY

`GROUP BY`는 여러 컬럼을 기준으로 그룹화할 수 있다.

```sql
SELECT city, gender, COUNT(*) AS user_count
FROM users
GROUP BY city, gender;
```

위 쿼리는 도시와 성별 조합별로 사용자 수를 계산한다.

즉, `city`만 기준으로 묶는 것이 아니라 `city + gender` 조합을 기준으로 그룹을 만든다.

---

## 7. WHERE와 GROUP BY

`WHERE`는 그룹화하기 전에 행을 필터링한다.

예를 들어 2024년 주문 데이터만 대상으로 고객별 총 주문 금액을 구하려면 다음과 같이 작성한다.

```sql
SELECT user_id, SUM(amount) AS total_amount
FROM orders
WHERE order_date >= '2024-01-01'
  AND order_date < '2025-01-01'
GROUP BY user_id;
```

실행 흐름은 다음과 같다.

1. `orders` 테이블에서 데이터를 가져온다.
2. `WHERE` 조건에 맞는 행만 남긴다.
3. 남은 데이터를 `user_id` 기준으로 그룹화한다.
4. 그룹별 `SUM(amount)`를 계산한다.

---

## 8. HAVING

`HAVING`은 그룹화된 결과에 조건을 적용할 때 사용한다.

`WHERE`가 그룹화 전 행을 필터링한다면, `HAVING`은 그룹화 후 집계 결과를 필터링한다.

기본 형태는 다음과 같다.

```sql
SELECT 그룹기준컬럼, 집계함수(컬럼명)
FROM 테이블명
GROUP BY 그룹기준컬럼
HAVING 조건;
```

예를 들어 주문 횟수가 3회 이상인 고객만 조회하려면 다음과 같이 작성한다.

```sql
SELECT user_id, COUNT(*) AS order_count
FROM orders
GROUP BY user_id
HAVING COUNT(*) >= 3;
```

---

## 9. WHERE와 HAVING 비교

| 구분       | WHERE           | HAVING              |
| -------- | --------------- | ------------------- |
| 적용 시점    | 그룹화 전           | 그룹화 후               |
| 대상       | 개별 행            | 그룹화된 결과             |
| 집계 함수 사용 | 일반적으로 불가        | 가능                  |
| 예시       | 특정 날짜 이후 주문만 조회 | 주문 수가 3건 이상인 고객만 조회 |

예를 들어 다음 쿼리는 2024년 주문만 대상으로 고객별 총 주문 금액을 계산한 뒤, 총 주문 금액이 100000 이상인 고객만 조회한다.

```sql
SELECT user_id, SUM(amount) AS total_amount
FROM orders
WHERE order_date >= '2024-01-01'
  AND order_date < '2025-01-01'
GROUP BY user_id
HAVING SUM(amount) >= 100000;
```

---

## 10. GROUP BY와 ORDER BY 함께 사용

그룹화 결과를 정렬할 때는 `ORDER BY`를 함께 사용할 수 있다.

```sql
SELECT user_id, SUM(amount) AS total_amount
FROM orders
GROUP BY user_id
ORDER BY total_amount DESC;
```

위 쿼리는 고객별 총 주문 금액을 계산한 뒤, 총 주문 금액이 큰 순서대로 정렬한다.

상위 N개만 보고 싶다면 `LIMIT`을 함께 사용할 수 있다.

```sql
SELECT user_id, SUM(amount) AS total_amount
FROM orders
GROUP BY user_id
ORDER BY total_amount DESC
LIMIT 10;
```

---

## 11. SQL 작성 순서와 실행 순서

SQL 작성 순서는 다음과 같다.

```sql
SELECT 컬럼명, 집계함수
FROM 테이블명
WHERE 조건
GROUP BY 그룹기준컬럼
HAVING 그룹조건
ORDER BY 정렬기준
LIMIT 개수;
```

실제 실행 순서는 대략 다음과 같다.

1. `FROM`: 테이블 선택
2. `WHERE`: 행 필터링
3. `GROUP BY`: 그룹화
4. `HAVING`: 그룹 조건 필터링
5. `SELECT`: 조회할 컬럼과 집계 결과 선택
6. `ORDER BY`: 정렬
7. `LIMIT`: 행 개수 제한

---

## 12. 정리

* `GROUP BY`는 데이터를 특정 컬럼 기준으로 그룹화한다.
* 집계 함수는 여러 행의 값을 하나의 결과로 요약한다.
* `COUNT`, `SUM`, `AVG`, `MAX`, `MIN` 등이 대표적인 집계 함수이다.
* `WHERE`는 그룹화 전에 개별 행을 필터링한다.
* `HAVING`은 그룹화 후 집계 결과를 필터링한다.
* 그룹화 결과는 `ORDER BY`로 정렬할 수 있다.
* 집계 결과 상위 N개를 보고 싶을 때는 `ORDER BY`와 `LIMIT`을 함께 사용한다.
