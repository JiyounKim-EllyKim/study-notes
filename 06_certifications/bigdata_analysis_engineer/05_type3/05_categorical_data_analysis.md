# 범주형 데이터 분석 (카이제곱 검정)

## 1. 적합도 검정

- **관찰도수와 기대도수의 차이**를 검정
- 데이터를 빈도(count) 형태의 **관찰값과 기대값**으로 준비
- 사용 함수:

```python
from scipy.stats import chisquare

chisquare(observed, expected)
```

- `observed`: 관찰된 빈도 리스트
- `expected`: 기대 빈도 리스트

---

## 2. 독립성 검정

- 두 범주형 변수가 서로 **독립적인지**, 즉 **연관성이 있는지** 확인
- 데이터를 **교차표(contingency table)** 형태로 준비
  - 문제에서 교차표가 직접 주어진 경우
  - 로우(raw) 데이터가 주어진 경우 교차표로 변환

- 사용 함수:

```python
from scipy.stats import chi2_contingency

chi2_contingency(table, correction=True)
```

- `table`: 교차표
- `correction`: 연속성 보정 여부 (기본값 `True`)

---

## 3. 동질성 검정

- 두 개 이상의 집단이 **동일한 분포 또는 비율을 갖는지** 확인
- 검정 목적은 독립성 검정과 다르지만, **검정 절차와 사용하는 함수는 동일**

```python
from scipy.stats import chi2_contingency

chi2_contingency(table, correction=True)
```
