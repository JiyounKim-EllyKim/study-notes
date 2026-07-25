# Window Function 개념 정리

## 1. Window Function

윈도우 함수는 행을 그룹별로 나누어 계산하되, 기존 행을 유지한 상태로 집계나 순위 계산을 수행하는 함수이다.

`GROUP BY`는 그룹별로 행을 하나로 줄이지만, 윈도우 함수는 원본 행을 유지하면서 계산 결과를 새로운 컬럼처럼 추가한다.

---

## 2. 기본 형태

```sql
SELECT 컬럼명,
       윈도우함수() OVER (
           PARTITION BY 그룹기준컬럼
           ORDER BY 정렬기준컬럼
       ) AS 별칭
FROM 테이블명;
```

* `OVER`: 윈도우 함수 사용을 나타냄
* `PARTITION BY`: 계산할 그룹을 나누는 기준
* `ORDER BY`: 그룹 안에서 정렬 기준
* `AS`: 계산 결과에 붙이는 별칭

---

## 3. GROUP BY와 Window Function 비교

| 구분    | GROUP BY     | Window Function        |
| ----- | ------------ | ---------------------- |
| 행 유지  | 그룹별로 행이 줄어듦  | 원본 행 유지                |
| 사용 목적 | 그룹별 집계 결과 조회 | 행별로 집계/순위 결과 추가        |
| 예시    | 고객별 총 주문 금액  | 각 주문 행에 고객별 총 주문 금액 표시 |

---

## 4. ROW_NUMBER

`ROW_NUMBER()`는 정렬 기준에 따라 각 행에 고유한 순번을 부여한다.

```sql
SELECT user_id,
       order_id,
       amount,
       ROW_NUMBER() OVER (
           PARTITION BY user_id
           ORDER BY amount DESC
       ) AS rn
FROM orders;
```

위 쿼리는 사용자별로 주문 금액이 큰 순서대로 순번을 매긴다.

동일한 값이 있어도 순번은 중복되지 않는다.

---

## 5. RANK

`RANK()`는 순위를 부여하되, 동일한 값에는 같은 순위를 부여한다.

```sql
SELECT user_id,
       order_id,
       amount,
       RANK() OVER (
           PARTITION BY user_id
           ORDER BY amount DESC
       ) AS rank_num
FROM orders;
```

동점자가 있으면 같은 순위를 부여하고, 다음 순위는 건너뛴다.

예를 들어 점수가 `100, 90, 90, 80`이면 순위는 `1, 2, 2, 4`가 된다.

---

## 6. DENSE_RANK

`DENSE_RANK()`는 `RANK()`와 비슷하지만, 동점자가 있어도 다음 순위를 건너뛰지 않는다.

```sql
SELECT user_id,
       order_id,
       amount,
       DENSE_RANK() OVER (
           PARTITION BY user_id
           ORDER BY amount DESC
       ) AS dense_rank_num
FROM orders;
```

예를 들어 점수가 `100, 90, 90, 80`이면 순위는 `1, 2, 2, 3`이 된다.

---

## 7. 순위 함수 비교

| 함수         | 특징                      | 예시         |
| ---------- | ----------------------- | ---------- |
| ROW_NUMBER | 무조건 고유한 순번 부여           | 1, 2, 3, 4 |
| RANK       | 동점자는 같은 순위, 다음 순위 건너뜀   | 1, 2, 2, 4 |
| DENSE_RANK | 동점자는 같은 순위, 다음 순위 안 건너뜀 | 1, 2, 2, 3 |

---

## 8. 집계 함수와 OVER

집계 함수도 `OVER`와 함께 사용하면 원본 행을 유지한 채 그룹별 집계값을 추가할 수 있다.

```sql
SELECT user_id,
       order_id,
       amount,
       SUM(amount) OVER (
           PARTITION BY user_id
       ) AS user_total_amount
FROM orders;
```

위 쿼리는 각 주문 행에 사용자별 총 주문 금액을 함께 표시한다.

사용할 수 있는 대표 함수는 다음과 같다.

* `SUM()`
* `AVG()`
* `COUNT()`
* `MAX()`
* `MIN()`

---

## 9. 누적 합계

`ORDER BY`를 함께 사용하면 누적 합계를 구할 수 있다.

```sql
SELECT user_id,
       order_date,
       amount,
       SUM(amount) OVER (
           PARTITION BY user_id
           ORDER BY order_date
       ) AS cumulative_amount
FROM orders;
```

위 쿼리는 사용자별로 주문일 순서에 따라 누적 주문 금액을 계산한다.

---

## 10. LAG

`LAG()`는 현재 행보다 이전 행의 값을 가져온다.

```sql
SELECT user_id,
       order_date,
       amount,
       LAG(amount) OVER (
           PARTITION BY user_id
           ORDER BY order_date
       ) AS previous_amount
FROM orders;
```

위 쿼리는 사용자별로 이전 주문 금액을 가져온다.

이전 값과 현재 값을 비교할 때 자주 사용한다.

---

## 11. LEAD

`LEAD()`는 현재 행보다 다음 행의 값을 가져온다.

```sql
SELECT user_id,
       order_date,
       amount,
       LEAD(amount) OVER (
           PARTITION BY user_id
           ORDER BY order_date
       ) AS next_amount
FROM orders;
```

위 쿼리는 사용자별로 다음 주문 금액을 가져온다.

---

## 12. 이전 값과 비교하기

`LAG()`를 사용하면 이전 값 대비 변화량을 계산할 수 있다.

```sql
SELECT user_id,
       order_date,
       amount,
       amount - LAG(amount) OVER (
           PARTITION BY user_id
           ORDER BY order_date
       ) AS amount_diff
FROM orders;
```

위 쿼리는 현재 주문 금액과 이전 주문 금액의 차이를 계산한다.

---

## 13. FIRST_VALUE / LAST_VALUE

`FIRST_VALUE()`는 윈도우 안에서 첫 번째 값을 가져온다.

```sql
SELECT user_id,
       order_date,
       amount,
       FIRST_VALUE(amount) OVER (
           PARTITION BY user_id
           ORDER BY order_date
       ) AS first_amount
FROM orders;
```

`LAST_VALUE()`는 윈도우 안에서 마지막 값을 가져온다.

다만 `LAST_VALUE()`는 윈도우 범위 설정에 따라 결과가 달라질 수 있으므로 주의해야 한다.

---

## 14. Window Frame

윈도우 프레임은 현재 행을 기준으로 계산 범위를 지정하는 문법이다.

예를 들어 최근 3개 행의 이동 평균을 구할 수 있다.

```sql
SELECT order_date,
       amount,
       AVG(amount) OVER (
           ORDER BY order_date
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS moving_avg_3
FROM orders;
```

위 쿼리는 현재 행과 이전 2개 행을 포함하여 총 3개 행의 평균을 계산한다.

자주 쓰는 범위는 다음과 같다.

| 문법                  | 의미             |
| ------------------- | -------------- |
| CURRENT ROW         | 현재 행           |
| N PRECEDING         | 현재 행보다 N개 앞의 행 |
| N FOLLOWING         | 현재 행보다 N개 뒤의 행 |
| UNBOUNDED PRECEDING | 처음 행부터         |
| UNBOUNDED FOLLOWING | 마지막 행까지        |

---

## 15. Window Function 활용 예시

### 15.1. 사용자별 가장 큰 주문 찾기

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

사용자별 주문 금액이 가장 큰 주문만 조회한다.

---

### 15.2. 월별 매출 누적 합계

```sql
SELECT sales_month,
       monthly_sales,
       SUM(monthly_sales) OVER (
           ORDER BY sales_month
       ) AS cumulative_sales
FROM monthly_sales;
```

월별 매출과 누적 매출을 함께 조회한다.

---

## 16. 정리

* 윈도우 함수는 원본 행을 유지하면서 순위, 집계, 이전/다음 값을 계산한다.
* `OVER` 절을 사용하여 윈도우 함수의 계산 범위를 지정한다.
* `PARTITION BY`는 그룹을 나누는 기준이다.
* `ORDER BY`는 그룹 안에서 순서를 정하는 기준이다.
* `ROW_NUMBER`, `RANK`, `DENSE_RANK`는 순위 계산에 사용한다.
* `SUM() OVER`, `AVG() OVER` 등은 행을 유지한 채 집계값을 추가할 때 사용한다.
* `LAG`, `LEAD`는 이전 행과 다음 행의 값을 가져올 때 사용한다.
* 윈도우 함수는 순위 분석, 누적 합계, 이동 평균, 전월 대비 변화량 계산 등에 자주 사용된다.
