# 문자열 함수 개념 정리

## 1. LOWER

`LOWER()`는 문자열을 모두 소문자로 변환한다.

```sql
SELECT LOWER(name)
FROM users;
```

문자열 검색 시 대소문자 차이를 줄이기 위해 사용할 수 있다.

```sql
SELECT *
FROM artworks
WHERE LOWER(credit) LIKE '%gift%';
```

위 쿼리는 `Gift`, `GIFT`, `gift`처럼 대소문자가 다른 값도
소문자로 변환한 뒤 검색할 수 있다.

---

## 2. UPPER

`UPPER()`는 문자열을 모두 대문자로 변환한다.

```sql
SELECT UPPER(name)
FROM users;
```

`LOWER()`와 반대로 문자열을 대문자로 통일할 때 사용한다.

---

## 3. LEFT

`LEFT()`는 문자열의 왼쪽에서 지정한 개수만큼 문자를 가져온다.

```sql
SELECT LEFT('2026-09-19', 7);
```

결과:

```text
2026-09
```

예를 들어 날짜에서 연도와 월만 추출할 때 사용할 수 있다.

```sql
SELECT LEFT(order_date, 7) AS order_month
FROM orders;
```

---

## 4. RIGHT

`RIGHT()`는 문자열의 오른쪽에서 지정한 개수만큼 문자를 가져온다.

```sql
SELECT RIGHT('SQL', 1);
```

결과:

```text
L
```

문자열의 마지막 문자를 확인할 때 사용할 수 있다.

```sql
SELECT *
FROM film
WHERE RIGHT(title, 1) NOT IN ('A', 'E', 'I', 'O', 'U');
```

위 쿼리는 제목의 마지막 글자가 모음이 아닌 데이터를 조회한다.

---

## 5. SUBSTRING_INDEX

`SUBSTRING_INDEX()`는 특정 구분자를 기준으로 문자열의 일부를 추출할 때 사용한다.

```sql
SUBSTRING_INDEX(문자열, 구분자, count)
```

`count`가 양수이면 문자열의 왼쪽부터 구분자를 세고,
음수이면 오른쪽부터 구분자를 센다.

```sql
SELECT SUBSTRING_INDEX('경기도 성남시 분당구', ' ', 1);
```

결과:

```text
경기도
```

```sql
SELECT SUBSTRING_INDEX('경기도 성남시 분당구', ' ', -1);
```

결과:

```text
분당구
```

함수를 중첩하면 중간에 있는 값도 추출할 수 있다.

```sql
SELECT SUBSTRING_INDEX(
    SUBSTRING_INDEX('경기도 성남시 분당구', ' ', 2),
    ' ',
    -1
);
```

결과:

```text
성남시
```

즉,

1. 안쪽 `SUBSTRING_INDEX()`로 `경기도 성남시`를 가져오고
2. 바깥 `SUBSTRING_INDEX()`로 마지막 값인 `성남시`를 가져온다.

---

## 6. 정리

- `LOWER()`는 문자열을 소문자로 변환한다.
- `UPPER()`는 문자열을 대문자로 변환한다.
- `LEFT(str, n)`은 문자열의 왼쪽에서 `n`개의 문자를 가져온다.
- `RIGHT(str, n)`은 문자열의 오른쪽에서 `n`개의 문자를 가져온다.
- `SUBSTRING_INDEX(str, delimiter, count)`는 구분자를 기준으로 문자열의 일부를 추출한다.