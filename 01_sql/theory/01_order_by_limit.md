# ORDER BY / LIMIT 개념 정리

## 1. ORDER BY

`ORDER BY`는 조회 결과를 특정 컬럼 기준으로 정렬할 때 사용한다.

기본 형태는 다음과 같다.

```sql
SELECT 컬럼명
FROM 테이블명
ORDER BY 정렬기준컬럼;
```

기본 정렬 방식은 오름차순이다.

---

## 2. 오름차순 ASC

오름차순은 작은 값에서 큰 값 순서로 정렬하는 방식이다.

```sql
SELECT *
FROM users
ORDER BY age ASC;
```

`ASC`는 생략할 수 있다.

```sql
SELECT *
FROM users
ORDER BY age;
```

위 두 쿼리는 같은 의미이다.

---

## 3. 내림차순 DESC

내림차순은 큰 값에서 작은 값 순서로 정렬하는 방식이다.

```sql
SELECT *
FROM users
ORDER BY age DESC;
```

예를 들어 나이가 많은 사용자부터 조회하고 싶을 때 사용할 수 있다.

---

## 4. 여러 컬럼 기준 정렬

정렬 기준은 여러 개를 지정할 수 있다.

```sql
SELECT *
FROM users
ORDER BY city ASC, age DESC;
```

위 쿼리는 먼저 `city` 기준으로 오름차순 정렬하고, 같은 도시 안에서는 `age` 기준으로 내림차순 정렬한다.

즉, 앞에 있는 정렬 기준이 우선순위가 더 높다.

---

## 5. 문자열 정렬

문자열 컬럼도 정렬할 수 있다.

```sql
SELECT *
FROM users
ORDER BY name ASC;
```

문자열은 보통 알파벳순 또는 사전순으로 정렬된다.

---

## 6. 날짜 정렬

날짜 컬럼도 정렬할 수 있다.

```sql
SELECT *
FROM orders
ORDER BY order_date DESC;
```

위 쿼리는 주문일이 가장 최근인 데이터부터 조회한다.

날짜 데이터에서는 `DESC`를 사용해 최신순 정렬을 자주 한다.

---

## 7. LIMIT

`LIMIT`은 조회할 행의 개수를 제한할 때 사용한다.

```sql
SELECT *
FROM users
LIMIT 10;
```

위 쿼리는 `users` 테이블에서 최대 10개의 행만 조회한다.

---

## 8. ORDER BY와 LIMIT 함께 사용

`ORDER BY`와 `LIMIT`은 함께 자주 사용된다.

예를 들어 나이가 많은 사용자 5명을 조회하려면 다음과 같이 작성한다.

```sql
SELECT *
FROM users
ORDER BY age DESC
LIMIT 5;
```

이 쿼리는 먼저 나이 기준으로 내림차순 정렬한 뒤, 상위 5개 행만 조회한다.

---

## 9. OFFSET

`OFFSET`은 몇 개의 행을 건너뛸지 지정할 때 사용한다.

```sql
SELECT *
FROM users
ORDER BY user_id
LIMIT 10 OFFSET 10;
```

위 쿼리는 앞의 10개 행을 건너뛰고, 그다음 10개 행을 조회한다.

페이지네이션을 구현할 때 자주 사용한다.

예를 들어 한 페이지에 10개씩 보여준다면 다음과 같이 사용할 수 있다.

| 페이지  | LIMIT | OFFSET |
| ---- | ----: | -----: |
| 1페이지 |    10 |      0 |
| 2페이지 |    10 |     10 |
| 3페이지 |    10 |     20 |

---

## 10. 작성 순서와 실행 순서

SQL 작성 순서는 다음과 같다.

```sql
SELECT 컬럼명
FROM 테이블명
WHERE 조건
ORDER BY 정렬기준
LIMIT 개수;
```

실제 실행 순서는 대략 다음과 같다.

1. `FROM`: 테이블 선택
2. `WHERE`: 조건에 맞는 행 필터링
3. `SELECT`: 조회할 컬럼 선택
4. `ORDER BY`: 결과 정렬
5. `LIMIT`: 조회할 행 개수 제한

---

## 11. 정리

* `ORDER BY`는 조회 결과를 정렬할 때 사용한다.
* `ASC`는 오름차순 정렬이다.
* `DESC`는 내림차순 정렬이다.
* 여러 컬럼을 기준으로 정렬할 수 있다.
* `LIMIT`은 조회할 행의 개수를 제한한다.
* `OFFSET`은 앞에서부터 몇 개의 행을 건너뛸지 지정한다.
* `ORDER BY`와 `LIMIT`을 함께 사용하면 상위 N개 데이터를 조회할 수 있다.
