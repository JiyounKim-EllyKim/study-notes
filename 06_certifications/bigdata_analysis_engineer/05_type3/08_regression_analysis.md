# 회귀분석

## 상관관계

- 두 변수 간의 선형적인 관계

### 상관계수

> 두 변수 간의 선형 관계의 강도와 방향 (-1 ≤ r ≤ 1)
>
> - r = 1: 강한 양의 선형관계
> - r = 0: 선형 관계 없음
> - r = -1: 강한 음의 상관관계

- `df.corr()` : 피어슨 (기본값)
- `df.corr(method='spearman')` : 스피어만
- `df.corr(method='kendall')` : 켄달타우

### 상관계수에 대한 t검정

> 귀무가설: 두 변수 간에 상관관계가 없다.
>
> 대립가설: 두 변수 간에 상관관계가 있다.

- `stats.pearsonr(x, y)` : 피어슨
- `stats.spearmanr(x, y)` : 스피어만
- `stats.kendalltau(x, y)` : 켄달타우

## 단순 선형 회귀 분석

- OLS: 최소제곱법(Ordinary Least Squares)
- `ols('종속변수 ~ 독립변수', data=df).fit()`
- `model.summary()` : 회귀 모델 통계적 요약
- `model.predict()` : 예측값
- `model.get_prediction()` : 예측값과 예측값에 대한 신뢰구간, 예측구간
- `df['잔차'] = df['종속변수'] - model.predict(df)`

## 다중 선형 회귀 분석

- `ols('종속변수 ~ 독립변수1 + 독립변수2', data=df).fit()`

## 범주형 변수

- pandas의 `pd.get_dummies(drop_first=True)`로 원핫인코딩 처리
