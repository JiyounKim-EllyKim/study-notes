# SELECT / WHERE 개념 정리

## 1. SELECT 문

`SELECT` 문은 데이터베이스 테이블에서 원하는 데이터를 조회할 때 사용하는 SQL 문법이다.

가장 기본적인 형태는 다음과 같다.

```sql
SELECT 컬럼명
FROM 테이블명;
```

예를 들어 `users` 테이블에서 이름과 나이를 조회하려면 다음과 같이 작성한다.

```sql
SELECT name, age
FROM users;
```

---

## 2. 전체 컬럼 조회

테이블의 모든 컬럼을 조회할 때는 `*`를 사용한다.

```sql
SELECT *
FROM users;
```

`*`는 모든 컬럼을 의미한다.

다만 실무에서는 필요한 컬럼만 명시하는 것이 좋다.
불필요한 컬럼까지 조회하면 성능이 떨어질 수 있고, 결과를 해석하기 어려워질 수 있다.

---

## 3. 특정 컬럼 조회

필요한 컬럼만 선택해서 조회할 수 있다.

```sql
SELECT name, email
FROM users;
```

이 쿼리는 `users` 테이블에서 `name`, `email` 컬럼만 조회한다.

---

## 4. 컬럼 별칭 Alias

컬럼명에 별칭을 붙일 때는 `AS`를 사용한다.

```sql
SELECT name AS user_name,
       age AS user_age
FROM users;
```

별칭을 사용하면 결과 컬럼명을 더 이해하기 쉽게 바꿀 수 있다.

`AS`는 생략할 수도 있다.

```sql
SELECT name user_name,
       age user_age
FROM users;
```

하지만 가독성을 위해 `AS`를 명시하는 것이 좋다.

---

## 5. WHERE 문

`WHERE` 문은 특정 조건을 만족하는 행만 조회할 때 사용한다.

```sql
SELECT 컬럼명
FROM 테이블명
WHERE 조건;
```

예를 들어 나이가 20세 이상인 사용자만 조회하려면 다음과 같이 작성한다.

```sql
SELECT *
FROM users
WHERE age >= 20;
```

---

## 6. 비교 연산자

`WHERE` 문에서는 비교 연산자를 사용하여 조건을 지정할 수 있다.

| 연산자 | 의미     |
| --- | ------ |
| =   | 같다     |
| !=  | 같지 않다  |
| <>  | 같지 않다  |
| >   | 크다     |
| >=  | 크거나 같다 |
| <   | 작다     |
| <=  | 작거나 같다 |

예시:

```sql
SELECT *
FROM users
WHERE age = 25;
```

```sql
SELECT *
FROM users
WHERE age != 25;
```

```sql
SELECT *
FROM users
WHERE age >= 20;
```

---

## 7. 문자열 조건

문자열 값을 조건으로 사용할 때는 작은따옴표를 사용한다.

```sql
SELECT *
FROM users
WHERE gender = 'female';
```

```sql
SELECT *
FROM users
WHERE city = 'Seoul';
```

숫자는 따옴표 없이 작성하고, 문자열은 따옴표로 감싸는 것이 기본이다.

---

## 8. AND / OR 조건

여러 조건을 함께 사용할 때는 `AND`, `OR`를 사용한다.

### AND

`AND`는 모든 조건을 만족하는 행만 조회한다.

```sql
SELECT *
FROM users
WHERE age >= 20
  AND city = 'Seoul';
```

위 쿼리는 나이가 20세 이상이고, 도시가 Seoul인 사용자만 조회한다.

### OR

`OR`는 여러 조건 중 하나라도 만족하면 조회한다.

```sql
SELECT *
FROM users
WHERE city = 'Seoul'
   OR city = 'Busan';
```

위 쿼리는 도시가 Seoul이거나 Busan인 사용자를 조회한다.

---

## 9. BETWEEN

`BETWEEN`은 특정 범위 안에 있는 값을 조회할 때 사용한다.

```sql
SELECT *
FROM users
WHERE age BETWEEN 20 AND 29;
```

위 쿼리는 나이가 20세 이상 29세 이하인 사용자를 조회한다.

`BETWEEN A AND B`는 A와 B를 모두 포함한다.

---

## 10. IN

`IN`은 여러 값 중 하나에 해당하는 데이터를 조회할 때 사용한다.

```sql
SELECT *
FROM users
WHERE city IN ('Seoul', 'Busan', 'Daegu');
```

위 쿼리는 도시가 Seoul, Busan, Daegu 중 하나인 사용자를 조회한다.

`OR`를 여러 번 사용하는 것보다 간결하게 작성할 수 있다.

---

## 11. LIKE

`LIKE`는 문자열에서 특정 패턴을 검색할 때 사용한다.

| 기호 | 의미         |
| -- | ---------- |
| %  | 0개 이상의 문자  |
| _  | 정확히 1개의 문자 |

예시:

```sql
SELECT *
FROM users
WHERE name LIKE 'Kim%';
```

이 쿼리는 이름이 `Kim`으로 시작하는 사용자를 조회한다.

```sql
SELECT *
FROM users
WHERE email LIKE '%gmail.com';
```

이 쿼리는 이메일이 `gmail.com`으로 끝나는 사용자를 조회한다.

```sql
SELECT *
FROM users
WHERE name LIKE '_im';
```

이 쿼리는 세 글자이고, 두 번째와 세 번째 글자가 `im`인 이름을 조회한다.

---

## 12. NULL 값 조회

`NULL`은 값이 없음을 의미한다.

`NULL`은 `=`로 비교하지 않고, `IS NULL` 또는 `IS NOT NULL`을 사용한다.

```sql
SELECT *
FROM users
WHERE phone IS NULL;
```

위 쿼리는 전화번호가 없는 사용자를 조회한다.

```sql
SELECT *
FROM users
WHERE phone IS NOT NULL;
```

위 쿼리는 전화번호가 있는 사용자를 조회한다.

---

## 13. SELECT / WHERE 실행 순서

SQL 작성 순서와 실제 실행 순서는 다르다.

작성 순서:

```sql
SELECT 컬럼명
FROM 테이블명
WHERE 조건;
```

실행 순서:

1. `FROM`: 어떤 테이블에서 가져올지 결정
2. `WHERE`: 조건에 맞는 행 필터링
3. `SELECT`: 조회할 컬럼 선택

즉, SQL은 먼저 테이블을 찾고, 조건에 맞는 행을 걸러낸 뒤, 필요한 컬럼을 보여준다.

---

## 14. 정리

* `SELECT`는 조회할 컬럼을 지정한다.
* `FROM`은 데이터를 가져올 테이블을 지정한다.
* `WHERE`는 조건에 맞는 행만 필터링한다.
* 문자열 조건은 작은따옴표로 감싼다.
* 여러 조건은 `AND`, `OR`로 연결할 수 있다.
* 범위 조건은 `BETWEEN`을 사용할 수 있다.
* 여러 값 중 하나를 찾을 때는 `IN`을 사용할 수 있다.
* 문자열 패턴 검색은 `LIKE`를 사용한다.
* `NULL` 값은 `IS NULL`, `IS NOT NULL`로 비교한다.
* SQL 실행 순서는 `FROM → WHERE → SELECT` 순서이다.
