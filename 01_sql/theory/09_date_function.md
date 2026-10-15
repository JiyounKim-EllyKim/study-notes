# 날짜 함수 개념 정리

## 1. YEAR

`YEAR()`는 날짜에서 연도를 추출한다.

```sql
SELECT YEAR('2026-10-12');
```

결과:

```text
2026
```

테이블의 날짜 컬럼에서도 사용할 수 있다.

```sql
SELECT YEAR(acquisition_date) AS acquisition_year
FROM artworks;
```

연도별 데이터를 그룹화할 때도 사용할 수 있다.

```sql
SELECT YEAR(acquisition_date) AS acquisition_year,
       COUNT(*) AS cnt
FROM artworks
GROUP BY YEAR(acquisition_date);
```

---

## 2. WEEKDAY

`WEEKDAY()`는 날짜의 요일을 숫자로 반환한다.

```sql
SELECT WEEKDAY('2026-10-12');
```

MySQL에서 반환값은 다음과 같다.

| 값 | 요일 |
| ---: | --- |
| 0 | 월요일 |
| 1 | 화요일 |
| 2 | 수요일 |
| 3 | 목요일 |
| 4 | 금요일 |
| 5 | 토요일 |
| 6 | 일요일 |

`CASE`와 함께 사용하면 요일 이름으로 변환할 수 있다.

```sql
SELECT CASE WEEKDAY(measured_at)
           WHEN 0 THEN '월요일'
           WHEN 1 THEN '화요일'
           WHEN 2 THEN '수요일'
           WHEN 3 THEN '목요일'
           WHEN 4 THEN '금요일'
           WHEN 5 THEN '토요일'
           WHEN 6 THEN '일요일'
       END AS weekday
FROM measurements;
```

---

## 3. DATE_ADD

`DATE_ADD()`는 날짜나 시간에 일정 기간을 더할 때 사용한다.

기본 형태:

```sql
DATE_ADD(날짜, INTERVAL 값 단위)
```

예를 들어 측정 시각에서 10분 뒤의 시간을 구하려면 다음과 같이 작성한다.

```sql
SELECT DATE_ADD(measured_at, INTERVAL 10 MINUTE) AS end_at
FROM power_consumptions;
```

사용할 수 있는 단위에는 `DAY`, `HOUR`, `MINUTE`, `SECOND` 등이 있다.

---

## 4. TIMESTAMPDIFF

`TIMESTAMPDIFF()`는 두 날짜 또는 시간 사이의 차이를 계산한다.

기본 형태:

```sql
TIMESTAMPDIFF(단위, 시작시간, 종료시간)
```

예를 들어 두 이벤트 사이의 시간 차이를 초 단위로 계산하려면 다음과 같이 작성한다.

```sql
SELECT TIMESTAMPDIFF(
           SECOND,
           previous_event_time,
           event_time
       ) AS time_diff
FROM events;
```

`LAG()`와 함께 사용하면 현재 이벤트와 이전 이벤트 사이의 시간 차이를 구할 수 있다.

```sql
SELECT TIMESTAMPDIFF(
           SECOND,
           LAG(event_time) OVER (
               ORDER BY event_time
           ),
           event_time
       ) AS time_diff
FROM events;
```

예를 들어 `time_diff >= 600`이면 이전 이벤트와 10분 이상 차이가 난다고 판단할 수 있다.

---

## 5. 정리

- `YEAR(date)`는 날짜에서 연도를 추출한다.
- `WEEKDAY(date)`는 월요일부터 일요일을 `0~6`으로 반환한다.
- `DATE_ADD(date, INTERVAL ...)`는 날짜나 시간에 일정 기간을 더한다.
- `TIMESTAMPDIFF(unit, start, end)`는 두 날짜 또는 시간 사이의 차이를 계산한다.