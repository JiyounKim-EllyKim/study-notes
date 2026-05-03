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