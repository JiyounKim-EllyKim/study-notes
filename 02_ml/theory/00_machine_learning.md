Machine Learning 개념 정리

1. Machine Learning

Machine Learning은 데이터를 기반으로 패턴을 학습하고, 새로운 데이터에 대해 예측이나 판단을 수행하는 방법이다.

명시적으로 모든 규칙을 사람이 작성하는 것이 아니라, 데이터로부터 모델이 규칙이나 관계를 학습한다.

한국어로는 머신러닝 또는 기계학습이라고 한다.

---

2. Machine Learning이 필요한 이유

전통적인 프로그래밍은 사람이 규칙을 직접 작성한다.

입력 데이터 + 사람이 만든 규칙 → 결과

하지만 머신러닝은 데이터와 정답을 바탕으로 모델이 규칙을 학습한다.

입력 데이터 + 정답 → 학습된 모델

이후 학습된 모델은 새로운 입력 데이터에 대해 결과를 예측한다.

새로운 입력 데이터 + 학습된 모델 → 예측 결과

복잡한 패턴이나 규칙을 사람이 직접 정의하기 어려운 문제에서 머신러닝을 사용할 수 있다.

---

3. Machine Learning의 기본 구성 요소

머신러닝은 주로 다음 요소로 구성된다.

구성 요소| 설명
데이터 Data| 모델이 학습하는 대상
특성 Feature| 예측에 사용되는 입력 변수
정답 Label| 모델이 예측해야 하는 값
모델 Model| 데이터의 패턴을 학습하는 알고리즘
손실 함수 Loss Function| 예측값과 실제값의 차이를 측정하는 함수
평가 지표 Metric| 모델 성능을 평가하는 기준

---

4. Feature와 Label

4.1. Feature

Feature는 모델이 예측을 위해 사용하는 입력값이다.

예를 들어 집값을 예측하는 문제에서는 다음과 같은 값들이 Feature가 될 수 있다.

- 면적
- 방 개수
- 위치
- 건축 연도
- 역과의 거리

4.2. Label

Label은 모델이 예측해야 하는 정답값이다.

집값 예측 문제에서는 실제 집값이 Label이 된다.

Feature: 면적, 방 개수, 위치
Label: 집값

---

5. Machine Learning의 주요 유형

머신러닝은 학습 방식에 따라 크게 다음과 같이 나눌 수 있다.

유형| 설명| 예시
지도학습 Supervised Learning| 정답이 있는 데이터로 학습| 회귀, 분류
비지도학습 Unsupervised Learning| 정답 없이 데이터 구조를 찾음| 군집화, 차원 축소
강화학습 Reinforcement Learning| 보상을 기준으로 행동을 학습| 게임 AI, 로봇 제어

---

6. Supervised Learning 지도학습

지도학습은 입력 데이터와 정답 데이터가 함께 주어진 상태에서 모델을 학습하는 방법이다.

모델은 입력값과 정답 사이의 관계를 학습하고, 새로운 입력값에 대한 정답을 예측한다.

대표적인 문제는 다음과 같다.

문제 유형| 설명| 예시
회귀 Regression| 연속형 값 예측| 집값 예측, 매출 예측
분류 Classification| 클래스 예측| 스팸 메일 분류, 이탈 고객 예측

---

7. Unsupervised Learning 비지도학습

비지도학습은 정답 데이터 없이 입력 데이터만으로 패턴이나 구조를 찾는 방법이다.

정답이 없기 때문에 모델은 데이터 간의 유사성, 분포, 구조를 학습한다.

대표적인 문제는 다음과 같다.

문제 유형| 설명| 예시
군집화 Clustering| 비슷한 데이터끼리 그룹화| 고객 세분화
차원 축소 Dimensionality Reduction| 데이터의 차원을 줄임| PCA, 시각화

---

8. Regression 회귀

Regression은 연속형 값을 예측하는 문제이다.

예측 결과가 숫자 형태로 나오며, 값의 크기 자체가 의미를 가진다.

예시

- 주택 가격 예측
- 매출액 예측
- 기온 예측
- 시험 점수 예측

대표적인 회귀 모델은 다음과 같다.

- Linear Regression
- Ridge Regression
- Lasso Regression
- Decision Tree Regressor
- Random Forest Regressor

---

9. Classification 분류

Classification은 데이터를 특정 클래스 중 하나로 나누는 문제이다.

예측 결과는 정해진 범주 또는 클래스이다.

예시

- 스팸 메일 여부 분류
- 고객 이탈 여부 예측
- 질병 여부 예측
- 이미지 카테고리 분류

대표적인 분류 모델은 다음과 같다.

- Logistic Regression
- Decision Tree Classifier
- Random Forest Classifier
- Support Vector Machine
- K-Nearest Neighbors
- Gradient Boosting

---

10. Clustering 군집화

Clustering은 정답 없이 비슷한 데이터끼리 그룹으로 묶는 방법이다.

고객 세분화, 패턴 탐색, 이상치 탐지 등에 사용할 수 있다.

대표적인 군집화 알고리즘은 다음과 같다.

- K-Means
- DBSCAN
- Hierarchical Clustering

---

11. Training Data와 Test Data

머신러닝에서는 모델을 학습시키는 데이터와 성능을 평가하는 데이터를 분리해야 한다.

데이터| 설명
Training Data| 모델 학습에 사용하는 데이터
Validation Data| 학습 중 모델 선택과 튜닝에 사용하는 데이터
Test Data| 최종 성능 평가에 사용하는 데이터

모델이 학습 데이터만 잘 맞추는 것이 아니라, 새로운 데이터에서도 잘 작동하는지 확인하기 위해 데이터를 분리한다.

---

12. Overfitting과 Underfitting

12.1. Overfitting 과대적합

Overfitting은 모델이 학습 데이터에 지나치게 맞춰져 새로운 데이터에서는 성능이 떨어지는 현상이다.

특징

- 학습 데이터 성능은 높다.
- 테스트 데이터 성능은 낮다.
- 모델이 데이터의 일반적인 패턴보다 노이즈까지 학습한다.

---

12.2. Underfitting 과소적합

Underfitting은 모델이 데이터의 패턴을 충분히 학습하지 못한 상태이다.

특징

- 학습 데이터 성능도 낮다.
- 테스트 데이터 성능도 낮다.
- 모델이 너무 단순하거나 학습이 부족한 경우 발생한다.

---

13. Model Evaluation 모델 평가

모델 평가는 문제 유형에 따라 다른 지표를 사용해야 한다.

문제 유형| 대표 평가 지표
회귀| MAE, MSE, RMSE, R²
분류| Accuracy, Precision, Recall, F1-score, ROC-AUC
군집화| Silhouette Score

예를 들어 분류 문제에서 데이터가 불균형하면 Accuracy만으로 성능을 판단하기 어렵다.
이 경우 Precision, Recall, F1-score 등을 함께 확인해야 한다.

---

14. Hyperparameter

Hyperparameter는 모델이 학습하기 전에 사람이 직접 설정하는 값이다.

모델이 학습하면서 자동으로 찾는 가중치와 달리, Hyperparameter는 사용자가 실험을 통해 조정해야 한다.

예시

- 학습률
- 트리 깊이
- 이웃 개수
- 정규화 강도
- 배치 크기
- 에포크 수

Hyperparameter 설정에 따라 모델 성능이 크게 달라질 수 있다.

---

15. Machine Learning과 Deep Learning 비교

구분| Machine Learning| Deep Learning
특징 추출| 사람이 직접 설계하는 경우 많음| 모델이 자동으로 학습
데이터 필요량| 상대적으로 적음| 많이 필요
연산 자원| 상대적으로 적음| 많이 필요
해석 가능성| 상대적으로 높음| 상대적으로 낮음
활용 예시| 정형 데이터 분석| 이미지, 음성, 자연어 처리

Deep Learning은 Machine Learning의 한 분야이며, 인공 신경망을 여러 층으로 쌓아 복잡한 패턴을 학습한다.

---

16. Machine Learning 프로젝트 흐름

머신러닝 프로젝트는 보통 다음 순서로 진행된다.

1. 문제 정의
2. 데이터 수집
3. 데이터 탐색 EDA
4. 데이터 전처리
5. Feature Engineering
6. 학습 데이터와 테스트 데이터 분리
7. 모델 학습
8. 모델 평가
9. Hyperparameter 튜닝
10. 최종 모델 선택
11. 결과 해석 및 활용

---

17. 정리

- Machine Learning은 데이터를 기반으로 패턴을 학습하는 방법이다.
- 지도학습은 정답이 있는 데이터로 학습한다.
- 비지도학습은 정답 없이 데이터의 구조를 찾는다.
- 회귀는 연속형 값을 예측하는 문제이다.
- 분류는 특정 클래스를 예측하는 문제이다.
- 군집화는 비슷한 데이터끼리 그룹으로 묶는 방법이다.
- 머신러닝에서는 학습 데이터와 테스트 데이터를 분리해야 한다.
- 과대적합은 학습 데이터에 지나치게 맞춰진 상태이다.
- 과소적합은 데이터의 패턴을 충분히 학습하지 못한 상태이다.
- 모델 평가는 문제 유형에 맞는 지표를 선택해야 한다.
- Hyperparameter 설정은 모델 성능에 큰 영향을 줄 수 있다.