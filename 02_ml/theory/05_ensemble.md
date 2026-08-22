Ensemble 개념 정리

1. Ensemble

Ensemble은 여러 개의 모델을 결합하여 하나의 모델처럼 사용하는 방법이다.

하나의 모델만 사용하는 것보다 여러 모델의 예측을 종합하면 더 안정적이고 좋은 성능을 얻을 수 있다.

한국어로는 앙상블이라고 한다.

---

2. Ensemble이 필요한 이유

단일 모델은 특정 데이터나 패턴에 치우칠 수 있다.

여러 모델을 함께 사용하면 각 모델의 약점을 보완하고, 예측의 안정성을 높일 수 있다.

장점

- 예측 성능을 높일 수 있다.
- 과대적합을 줄일 수 있다.
- 모델의 안정성을 높일 수 있다.
- 다양한 패턴을 함께 학습할 수 있다.

---

3. Ensemble의 주요 방식

Ensemble은 크게 다음과 같은 방식으로 나눌 수 있다.

방식| 설명| 대표 모델
Voting| 여러 모델의 예측을 투표로 결정| Voting Classifier
Bagging| 여러 모델을 병렬로 학습| Random Forest
Boosting| 이전 모델의 오차를 보완하며 순차 학습| Gradient Boosting, XGBoost, LightGBM
Stacking| 여러 모델의 예측값을 다시 학습| Stacking

---

4. Voting

Voting은 여러 모델의 예측 결과를 투표 방식으로 결합하는 방법이다.

서로 다른 모델을 학습시킨 뒤, 각 모델의 예측을 모아 최종 예측을 결정한다.

---

4.1. Hard Voting

Hard Voting은 각 모델이 예측한 클래스를 기준으로 다수결 투표를 하는 방식이다.

Model 1 → A
Model 2 → A
Model 3 → B

최종 예측 → A

특징

- 각 모델의 최종 클래스 예측을 사용한다.
- 가장 많이 예측된 클래스를 최종 결과로 선택한다.
- 단순하고 직관적이다.

---

4.2. Soft Voting

Soft Voting은 각 모델이 예측한 클래스 확률을 평균 내어 최종 클래스를 결정하는 방식이다.

Model 1 → A 확률 0.8
Model 2 → A 확률 0.6
Model 3 → A 확률 0.4

평균 확률 기준 최종 예측

특징

- 각 클래스에 대한 예측 확률을 사용한다.
- Hard Voting보다 더 부드러운 판단이 가능하다.
- 모델이 확률을 잘 예측할 때 유용하다.

---

5. Bagging

Bagging은 Bootstrap Aggregating의 줄임말이다.

전체 학습 데이터에서 여러 개의 샘플 데이터를 복원 추출하여 만들고, 각 데이터셋으로 여러 모델을 병렬 학습하는 방식이다.

전체 데이터
→ 샘플 데이터 1 → 모델 1
→ 샘플 데이터 2 → 모델 2
→ 샘플 데이터 3 → 모델 3
→ 예측 결과 결합

특징

- 여러 모델을 병렬로 학습한다.
- 각 모델은 서로 다른 샘플 데이터를 사용한다.
- 분산을 줄여 모델을 안정적으로 만든다.
- 과대적합을 줄이는 데 도움이 된다.

---

6. Bootstrap Sampling

Bootstrap Sampling은 원본 데이터에서 중복을 허용하여 데이터를 샘플링하는 방법이다.

즉, 같은 데이터가 여러 번 뽑힐 수도 있고, 어떤 데이터는 뽑히지 않을 수도 있다.

Bagging에서는 Bootstrap Sampling으로 여러 학습 데이터셋을 만든다.

---

7. Random Forest

Random Forest는 여러 개의 Decision Tree를 학습한 뒤, 그 결과를 결합하는 Bagging 기반 Ensemble 모델이다.

각 Tree는 서로 다른 Bootstrap Sample을 사용하고, 각 분할에서 일부 Feature만 고려한다.

특징

- Decision Tree보다 과대적합에 강하다.
- 여러 Tree를 사용하여 예측 안정성이 높다.
- Feature Importance를 확인할 수 있다.
- 회귀와 분류 문제 모두에 사용할 수 있다.
- 정형 데이터에서 자주 사용되는 기본 Ensemble 모델이다.

---

8. Random Forest의 예측 방식

Random Forest는 문제 유형에 따라 예측 결과를 결합하는 방식이 다르다.

문제 유형| 예측 방식
Classification| 여러 Tree의 예측을 투표하여 최종 클래스 결정
Regression| 여러 Tree의 예측값을 평균하여 최종 값 결정

---

9. Boosting

Boosting은 여러 모델을 순차적으로 학습시키는 Ensemble 방법이다.

이전 모델이 잘못 예측한 데이터에 더 집중하면서 다음 모델을 학습한다.

모델 1 학습
→ 모델 1의 오차 확인
→ 오차를 보완하는 모델 2 학습
→ 모델 2의 오차 확인
→ 오차를 보완하는 모델 3 학습

특징

- 모델을 순차적으로 학습한다.
- 이전 모델의 약점을 다음 모델이 보완한다.
- 성능이 좋은 경우가 많다.
- 과대적합에 주의해야 한다.
- 학습 시간이 상대적으로 길 수 있다.

---

10. Bagging과 Boosting 비교

구분| Bagging| Boosting
학습 방식| 병렬 학습| 순차 학습
핵심 아이디어| 여러 모델의 평균으로 안정성 향상| 이전 모델의 오차를 다음 모델이 보완
대표 모델| Random Forest| Gradient Boosting, XGBoost, LightGBM
주요 효과| 분산 감소| 편향 감소
과대적합 위험| 상대적으로 낮음| 설정에 따라 높아질 수 있음

---

11. Gradient Boosting

Gradient Boosting은 이전 모델의 오차를 줄이는 방향으로 새로운 모델을 순차적으로 추가하는 Boosting 모델이다.

각 단계에서 이전 모델이 잘 맞추지 못한 부분을 다음 모델이 학습한다.

특징

- 예측 성능이 좋은 편이다.
- 약한 모델을 여러 개 결합한다.
- 일반적으로 Decision Tree를 기반 모델로 사용한다.
- 학습률, 트리 개수, 트리 깊이 등의 조절이 중요하다.
- 과대적합에 주의해야 한다.

---

12. XGBoost

XGBoost는 Gradient Boosting을 개선한 고성능 모델이다.

정형 데이터 분석 대회나 실무에서 많이 사용되는 모델 중 하나이다.

특징

- 성능이 좋고 안정적이다.
- 정규화 기능을 포함하여 과대적합을 줄일 수 있다.
- 결측값 처리를 지원한다.
- 병렬 처리를 통해 학습 속도를 개선했다.
- 다양한 하이퍼파라미터 조정이 가능하다.

---

13. LightGBM

LightGBM은 Gradient Boosting 계열의 모델로, 빠른 학습 속도와 높은 성능을 목표로 한다.

대용량 데이터에서 효율적으로 학습할 수 있다.

특징

- 학습 속도가 빠르다.
- 메모리 사용량이 상대적으로 적다.
- 대용량 데이터에 적합하다.
- Leaf-wise 방식으로 트리를 성장시킨다.
- 작은 데이터에서는 과대적합에 주의해야 한다.

---

14. CatBoost

CatBoost는 Gradient Boosting 계열의 모델로, 범주형 변수 처리에 강점을 가진다.

범주형 변수를 별도로 복잡하게 인코딩하지 않아도 사용할 수 있는 경우가 많다.

특징

- 범주형 변수 처리에 강하다.
- 기본 설정만으로도 성능이 안정적인 편이다.
- 과대적합을 줄이기 위한 기법이 포함되어 있다.
- 정형 데이터에서 좋은 성능을 보이는 경우가 많다.

---

15. Stacking

Stacking은 여러 모델의 예측값을 다시 새로운 모델의 입력으로 사용하여 최종 예측을 만드는 Ensemble 방법이다.

기본 모델들의 예측 결과를 모아 Meta Model이 최종 예측을 수행한다.

Model 1 예측값
Model 2 예측값
Model 3 예측값
→ Meta Model
→ 최종 예측

특징

- 여러 모델의 장점을 결합할 수 있다.
- 성능 향상을 기대할 수 있다.
- 구조가 복잡해질 수 있다.
- 데이터 누수 Data Leakage에 주의해야 한다.

---

16. 주요 Hyperparameter

Ensemble 모델은 하이퍼파라미터에 따라 성능이 크게 달라질 수 있다.

Hyperparameter| 설명
n_estimators| 사용할 모델 또는 Tree의 개수
max_depth| Tree의 최대 깊이
learning_rate| Boosting에서 각 모델의 반영 정도
subsample| 학습에 사용할 데이터 샘플 비율
max_features| 각 분할에서 사용할 Feature 개수
min_samples_split| 노드 분할에 필요한 최소 샘플 수
min_samples_leaf| Leaf Node에 필요한 최소 샘플 수

---

17. n_estimators

"n_estimators"는 Ensemble에 사용할 모델 또는 Tree의 개수이다.

값이 클수록 더 많은 모델을 사용한다.

특징

- 너무 작으면 성능이 부족할 수 있다.
- 너무 크면 학습 시간이 길어진다.
- Boosting에서는 너무 크면 과대적합이 발생할 수 있다.

---

18. learning_rate

"learning_rate"는 Boosting 모델에서 각 모델의 예측을 얼마나 강하게 반영할지 결정하는 값이다.

특징

- 값이 작으면 천천히 학습한다.
- 값이 크면 빠르게 학습하지만 불안정할 수 있다.
- 보통 "n_estimators"와 함께 조정한다.
- 낮은 learning rate와 많은 tree를 함께 사용하는 경우가 많다.

---

19. Ensemble 모델 선택 기준

상황| 추천 모델
해석이 쉽고 기본 성능을 확인하고 싶을 때| Random Forest
높은 예측 성능이 필요할 때| XGBoost, LightGBM, CatBoost
데이터가 크고 빠른 학습이 필요할 때| LightGBM
범주형 변수가 많을 때| CatBoost
여러 다른 모델을 결합하고 싶을 때| Voting, Stacking

---

20. Ensemble 사용 시 주의할 점

- 성능은 좋지만 모델이 복잡해질 수 있다.
- 단일 Decision Tree보다 해석이 어려울 수 있다.
- Boosting 모델은 하이퍼파라미터 튜닝이 중요하다.
- 데이터가 작을 때는 과대적합에 주의해야 한다.
- Stacking을 사용할 때는 Data Leakage가 발생하지 않도록 해야 한다.
- 모델 성능뿐만 아니라 학습 시간, 추론 시간, 해석 가능성도 함께 고려해야 한다.

---

21. 정리

- Ensemble은 여러 모델을 결합하여 성능과 안정성을 높이는 방법이다.
- Voting은 여러 모델의 예측을 투표로 결합한다.
- Bagging은 여러 모델을 병렬로 학습하여 예측을 결합한다.
- Random Forest는 Bagging 기반의 대표적인 Ensemble 모델이다.
- Boosting은 이전 모델의 오차를 다음 모델이 보완하는 방식이다.
- Gradient Boosting은 Boosting의 대표적인 방식이다.
- XGBoost, LightGBM, CatBoost는 Gradient Boosting 계열의 고성능 모델이다.
- Stacking은 여러 모델의 예측값을 Meta Model이 다시 학습하는 방식이다.
- Bagging은 주로 분산을 줄이고, Boosting은 주로 편향을 줄이는 데 도움이 된다.
- Ensemble 모델은 성능이 좋지만 해석과 튜닝에 주의해야 한다.