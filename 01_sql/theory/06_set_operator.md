# Set Operator 개념 정리

## 1. 집합 연산자 Set Operator

집합 연산자는 두 개 이상의 `SELECT` 결과를 하나로 합치거나, 공통된 결과만 가져오거나, 차집합을 구할 때 사용한다.

대표적인 집합 연산자는 다음과 같다.

* `UNION`
* `UNION ALL`
* `INTERSECT`
* `EXCEPT`

집합 연산자를 사용할 때는 각 `SELECT`문의 컬럼 개수와 컬럼 순서가 같아야 한다.

---

## 2. UNION

`UNION`은 두 쿼리의 결과를 합친 뒤, 중복된 행을 제거한다.

```sql
SELECT name
FROM users

UNION

SELECT name
FROM customers;
```

위 쿼리는 `users` 테이블과 `customers` 테이블의 이름을 합쳐서 조회한다.
동일한 이름이 여러 번 나오더라도 결과에는 한 번만 표시된다.

---

## 3. UNION ALL

`UNION ALL`은 두 쿼리의 결과를 합치되, 중복된 행을 제거하지 않는다.

```sql
SELECT name
FROM users

UNION ALL

SELECT name
FROM customers;
```

`UNION ALL`은 중복 제거 과정이 없기 때문에 `UNION`보다 일반적으로 더 빠르다.

중복을 유지해야 하거나, 중복 제거가 필요 없는 경우에는 `UNION ALL`을 사용하는 것이 좋다.

---

## 4. UNION과 UNION ALL 비교

| 구분    | UNION         | UNION ALL       |
| ----- | ------------- | --------------- |
| 중복 제거 | 제거함           | 제거하지 않음         |
| 속도    | 상대적으로 느림      | 상대적으로 빠름        |
| 사용 상황 | 고유한 결과만 필요할 때 | 모든 결과를 그대로 합칠 때 |

---

## 5. INTERSECT

`INTERSECT`는 두 쿼리 결과에 공통으로 존재하는 행만 조회한다.

```sql
SELECT user_id
FROM users

INTERSECT

SELECT user_id
FROM orders;
```

위 쿼리는 `users`와 `orders` 양쪽에 모두 존재하는 `user_id`만 조회한다.

즉, 두 결과의 교집합을 구하는 연산이다.

---

## 6. EXCEPT

`EXCEPT`는 첫 번째 쿼리 결과에서 두 번째 쿼리 결과를 제외한다.

```sql
SELECT user_id
FROM users

EXCEPT

SELECT user_id
FROM orders;
```

위 쿼리는 `users`에는 있지만 `orders`에는 없는 `user_id`를 조회한다.

즉, 주문 이력이 없는 사용자를 찾을 때 사용할 수 있다.

---

## 7. 집합 연산자 사용 조건

집합 연산자를 사용할 때는 다음 조건을 맞춰야 한다.

1. 각 `SELECT`문의 컬럼 개수가 같아야 한다.
2. 컬럼 순서가 같아야 한다.
3. 대응되는 컬럼의 데이터 타입이 서로 호환되어야 한다.

예를 들어 다음과 같은 쿼리는 사용할 수 있다.

```sql
SELECT user_id, name
FROM users

UNION

SELECT customer_id, customer_name
FROM customers;
```

두 쿼리 모두 컬럼이 2개이고, 컬럼의 의미와 타입이 비슷하기 때문이다.

반면 컬럼 개수가 다르면 오류가 발생한다.

```sql
SELECT user_id, name
FROM users

UNION

SELECT customer_id
FROM customers;
```

---

## 8. 컬럼명 기준

집합 연산 결과의 컬럼명은 보통 첫 번째 `SELECT`문의 컬럼명을 따른다.

```sql
SELECT user_id, name
FROM users

UNION

SELECT customer_id, customer_name
FROM customers;
```

이 경우 최종 결과의 컬럼명은 첫 번째 쿼리의 `user_id`, `name`을 따른다.

따라서 결과 컬럼명을 명확하게 하고 싶다면 첫 번째 `SELECT`문에서 별칭을 지정하는 것이 좋다.

```sql
SELECT user_id AS id,
       name AS user_name
FROM users

UNION

SELECT customer_id,
       customer_name
FROM customers;
```

---

## 9. ORDER BY 사용

집합 연산 결과를 정렬할 때는 마지막에 `ORDER BY`를 작성한다.

```sql
SELECT user_id, name
FROM users

UNION

SELECT customer_id, customer_name
FROM customers

ORDER BY name;
```

각 `SELECT`문마다 `ORDER BY`를 따로 쓰는 것이 아니라, 전체 결과에 대해 한 번만 정렬한다.

---

## 10. JOIN과 집합 연산자의 차이

`JOIN`은 여러 테이블을 가로로 연결하여 컬럼을 추가하는 방식이다.
반면 집합 연산자는 여러 쿼리 결과를 세로로 합치거나 비교하는 방식이다.

| 구분    | JOIN              | 집합 연산자            |
| ----- | ----------------- | ----------------- |
| 결합 방향 | 가로 방향             | 세로 방향             |
| 목적    | 여러 테이블의 컬럼을 함께 조회 | 여러 쿼리 결과를 합치거나 비교 |
| 기준    | 공통 컬럼 기준 연결       | SELECT 결과 구조 기준   |
| 예시    | 사용자 정보 + 주문 정보    | 사용자 목록 + 고객 목록    |

---

## 11. 집합 연산자 정리

| 연산자       | 의미                   | 중복 처리 |
| --------- | -------------------- | ----- |
| UNION     | 두 결과를 합침             | 중복 제거 |
| UNION ALL | 두 결과를 그대로 합침         | 중복 유지 |
| INTERSECT | 두 결과의 공통 부분 조회       | 중복 제거 |
| EXCEPT    | 첫 번째 결과에서 두 번째 결과 제외 | 중복 제거 |

---

## 12. 정리

* 집합 연산자는 여러 `SELECT` 결과를 합치거나 비교할 때 사용한다.
* `UNION`은 결과를 합치고 중복을 제거한다.
* `UNION ALL`은 결과를 합치고 중복을 유지한다.
* `INTERSECT`는 두 결과의 공통 부분을 조회한다.
* `EXCEPT`는 첫 번째 결과에서 두 번째 결과를 제외한다.
* 집합 연산을 사용할 때는 각 `SELECT`문의 컬럼 개수와 순서가 같아야 한다.
* 결과 컬럼명은 보통 첫 번째 `SELECT`문의 컬럼명을 따른다.
* `ORDER BY`는 전체 집합 연산 결과의 마지막에 작성한다.
