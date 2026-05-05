# Regression 개념 정리

## 1. KNN (K-최근접 이웃) 분류 모델
- 데이터 포인트 간의 거리를 기반으로 분류하는 모델
- 보통 k=5를 많이 사용하고, k는 주로 홀수 값을 가진다.
- k=1인 경우는 bias가 작고 variance가 커지고, k=50인 경우는 bias가 크고 variance가 작아지는 문제가 생긴다.
- classification과는 달리, regression은 예측 값이 가까운 k개의 y값 평균이 된다.
- 한계: 학습용 데이터를 넘어가는 문제가 나올 때는 예측이 불가능하다. 주변 이웃이 계속 똑같이 나와서 예측 값도 동일하게 나오기 때문이다.


## 2. Linear Regression
- 종속 변수와 한 개 이상의 독립 변수 사이의 선형 관계를 모델링하는 방법
- 주어진 독립 변수 값에 대해 종속 변수를 예측할 수 있다.

### 2.1. Simple Linear Regression
- 독립 변수가 하나인 경우

### 2.2. Multiple Linear Regression
- 독립 변수가 여러 개인 경우


## 3. Non-Linear Regression
- 회귀식이 독립 변수의 단항식이 아닌 2차, 3차 방정식과 같이 다항식으로 표현되는 것.
- 단순 직선형으로 표현하는 것보다 다항 회귀 곡선형으로 표현하는 것이 예측 성능이 좋다.

### 3.1. 지수 회귀(Exponential Regression)
- $y = a \times e^{bx}$
- 로그 변환하면 $ln(y) = ln(a) + bx$ 형태로 선형 회귀식이 된다
- 기하급수적으로 증가하거나 감소하는 패턴에 주로 사용
- 예: 인구 성장, 바이러스 전파, 방사능 붕괴, 자연 증가율 등

### 3.2. 로그 회귀(Logarithmic Regression)
- $y = a + b \times log(x)$
- 학습 효과 곡선(Learning Curve): 처음엔 급격히 증가하다가 점점 느려지는 경우 주로 사용
- 예: 수익과 마케팅 비용, 광고 효과 분석, 감소하는 수익률

### 3.3. 다항 회귀
- `PolynomialFeatures`를 사용해서 다항회귀식으로 변경 가능하다.