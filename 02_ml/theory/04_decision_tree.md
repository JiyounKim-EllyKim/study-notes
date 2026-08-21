Decision Tree 개념 정리

1. Decision Tree

Decision Tree는 데이터를 여러 조건으로 나누어 예측을 수행하는 모델이다.

한국어로는 의사결정나무라고 한다.

트리 구조를 사용하여 질문을 순차적으로 던지고, 조건에 따라 데이터를 나누면서 최종 예측값을 결정한다.

---

2. Decision Tree의 기본 아이디어

Decision Tree는 데이터를 가장 잘 구분할 수 있는 기준을 찾아 분할한다.

예를 들어 고객 이탈 여부를 예측한다고 하면 다음과 같은 질문을 순서대로 할 수 있다.

최근 30일 접속 횟수가 적은가?
→ 결제 금액이 낮은가?
→ 가입 기간이 짧은가?
→ 이탈 가능성 예측

이처럼 조건을 따라 내려가며 최종 예측을 수행한다.

---

3. Decision Tree의 구조

Decision Tree는 다음 요소로 구성된다.

구성 요소| 설명
Root Node| 트리의 시작 노드
Internal Node| 조건을 기준으로 데이터를 나누는 중간 노드
Branch| 조건에 따라 나뉘는 가지
Leaf Node| 최종 예측 결과가 나오는 노드

Root Node
├─ 조건 True
│  └─ Leaf Node
└─ 조건 False
   └─ Leaf Node

---

4. Decision Tree의 학습 과정

Decision Tree는 데이터를 잘 나눌 수 있는 Feature와 기준값을 찾으며 학습한다.

1. 전체 데이터를 Root Node에 둔다.
2. 데이터를 가장 잘 나누는 Feature를 선택한다.
3. 선택한 Feature의 기준값으로 데이터를 분할한다.
4. 분할된 각 노드에서 다시 좋은 분할 기준을 찾는다.
5. 더 이상 나눌 수 없거나 정해진 조건에 도달하면 Leaf Node를 만든다.
6. Leaf Node에서 최종 예측값을 결정한다.

---

5. 분할 기준 Split Criterion

Decision Tree에서 중요한 것은 어떤 기준으로 데이터를 나눌지 결정하는 것이다.

분류 문제에서는 클래스가 잘 섞이지 않도록 데이터를 나누는 것이 중요하다.

회귀 문제에서는 각 노드 안의 예측값 차이가 작아지도록 데이터를 나누는 것이 중요하다.

문제 유형| 분할 기준
Classification| Gini Impurity, Entropy
Regression| MSE, MAE

---

6. Impurity 불순도

불순도는 하나의 노드 안에 서로 다른 클래스가 얼마나 섞여 있는지를 나타낸다.

- 한 노드에 하나의 클래스만 있으면 불순도가 낮다.
- 여러 클래스가 섞여 있으면 불순도가 높다.

Decision Tree는 분할 후 불순도가 낮아지는 방향으로 데이터를 나눈다.

---

7. Gini Impurity

Gini Impurity는 분류 문제에서 자주 사용하는 불순도 지표이다.

$$
Gini = 1 - \sum_{k=1}^{K} p_k^2
$$

- $K$: 클래스 개수
- $p_k$: 노드 안에서 k번째 클래스가 차지하는 비율

특징

- 값이 낮을수록 클래스가 잘 분리되어 있다.
- 하나의 클래스만 있으면 Gini Impurity는 0이다.
- Decision Tree Classifier에서 기본 분할 기준으로 자주 사용된다.

---

8. Entropy

Entropy는 데이터의 불확실성이나 혼잡도를 나타내는 지표이다.

$$
Entropy = - \sum_{k=1}^{K} p_k \log_2 p_k
$$

- $p_k$: k번째 클래스의 비율

특징

- 값이 낮을수록 한 클래스에 가깝게 모여 있다.
- 값이 높을수록 여러 클래스가 섞여 있다.
- Information Gain을 계산할 때 사용된다.

---

9. Information Gain

Information Gain은 분할 전과 분할 후의 Entropy 차이를 의미한다.

즉, 데이터를 나누었을 때 불확실성이 얼마나 줄어들었는지를 나타낸다.

$$
Information\ Gain = Entropy(parent) - Entropy(children)
$$

Information Gain이 클수록 더 좋은 분할이라고 볼 수 있다.

---

10. Classification Tree

Classification Tree는 분류 문제에 사용하는 Decision Tree이다.

Leaf Node에서 특정 클래스를 예측한다.

예를 들어 고객 이탈 예측 문제에서는 Leaf Node에서 "이탈" 또는 "유지"를 예측할 수 있다.

예시

접속 횟수 <= 3
├─ True  → 이탈
└─ False → 유지

---

11. Regression Tree

Regression Tree는 회귀 문제에 사용하는 Decision Tree이다.

Leaf Node에서 연속형 값을 예측한다.

각 Leaf Node에 속한 데이터들의 평균값을 예측값으로 사용하는 경우가 많다.

예시

면적 <= 60
├─ True  → 평균 집값 3억
└─ False → 평균 집값 5억

---

12. 주요 Hyperparameter

Decision Tree는 트리의 깊이나 분할 조건에 따라 성능이 크게 달라질 수 있다.

Hyperparameter| 설명
max_depth| 트리의 최대 깊이
min_samples_split| 노드를 분할하기 위한 최소 샘플 수
min_samples_leaf| Leaf Node에 있어야 하는 최소 샘플 수
max_features| 분할에 사용할 Feature 개수
criterion| 분할 기준

---

13. max_depth

"max_depth"는 트리의 최대 깊이를 제한하는 값이다.

트리가 너무 깊어지면 학습 데이터를 지나치게 세밀하게 나누어 과대적합이 발생할 수 있다.

max_depth 작음 → 모델 단순, 과소적합 가능
max_depth 큼 → 모델 복잡, 과대적합 가능

---

14. min_samples_split

"min_samples_split"은 하나의 노드를 다시 분할하기 위해 필요한 최소 샘플 수이다.

값을 크게 설정하면 노드가 쉽게 분할되지 않아 트리가 단순해진다.

특징

- 값이 작으면 트리가 복잡해질 수 있다.
- 값이 크면 과대적합을 줄일 수 있다.
- 너무 크면 과소적합이 발생할 수 있다.

---

15. min_samples_leaf

"min_samples_leaf"는 Leaf Node에 포함되어야 하는 최소 샘플 수이다.

Leaf Node에 너무 적은 데이터만 남으면 학습 데이터에 과하게 맞춰질 수 있다.

"min_samples_leaf" 값을 조정하면 트리가 너무 세부적으로 나뉘는 것을 방지할 수 있다.

---

16. Pruning 가지치기

Pruning은 불필요하게 복잡한 가지를 제거하여 트리를 단순하게 만드는 방법이다.

Decision Tree는 학습 데이터에 맞춰 계속 분할하면 과대적합이 발생하기 쉽다.
Pruning은 이런 과대적합을 줄이기 위해 사용된다.

목적

- 트리 복잡도 감소
- 과대적합 방지
- 일반화 성능 향상
- 해석 용이성 증가

---

17. Feature Importance

Decision Tree는 각 Feature가 분할에 얼마나 많이 기여했는지를 바탕으로 Feature Importance를 계산할 수 있다.

Feature Importance를 통해 모델이 어떤 변수를 중요하게 사용했는지 확인할 수 있다.

주의할 점

- Feature Importance는 모델 기준의 중요도이다.
- 변수 간 상관관계가 높으면 해석에 주의해야 한다.
- 중요도가 높다고 해서 반드시 인과관계를 의미하지는 않는다.

---

18. Decision Tree의 장점

Decision Tree는 다음과 같은 장점이 있다.

- 구조가 직관적이고 해석하기 쉽다.
- 시각화가 가능하다.
- 데이터의 비선형 관계를 표현할 수 있다.
- 변수 스케일링의 영향을 상대적으로 덜 받는다.
- 회귀와 분류 문제 모두에 사용할 수 있다.
- 수치형 변수와 범주형 변수를 모두 다룰 수 있다.

---

19. Decision Tree의 한계

Decision Tree는 다음과 같은 한계가 있다.

- 과대적합이 발생하기 쉽다.
- 데이터가 조금만 바뀌어도 트리 구조가 크게 달라질 수 있다.
- 단일 트리는 예측 성능이 불안정할 수 있다.
- 복잡한 문제에서는 성능이 제한적일 수 있다.
- 더 좋은 성능을 위해 Random Forest나 Gradient Boosting 같은 Ensemble 모델을 사용하는 경우가 많다.

---

20. Decision Tree 사용 시 주의할 점

- 트리 깊이를 제한하여 과대적합을 방지해야 한다.
- "max_depth", "min_samples_split", "min_samples_leaf"를 조정해야 한다.
- 학습 데이터와 테스트 데이터 성능 차이를 확인해야 한다.
- Feature Importance를 해석할 때 인과관계로 오해하지 않아야 한다.
- 단일 Decision Tree의 성능이 불안정하면 Ensemble 모델을 고려할 수 있다.

---

21. Decision Tree와 Ensemble

Decision Tree는 단독 모델로 사용할 수도 있지만, 여러 개의 Decision Tree를 결합하면 더 강력한 모델을 만들 수 있다.

대표적인 Ensemble 모델은 다음과 같다.

모델| 설명
Random Forest| 여러 Decision Tree를 독립적으로 학습한 뒤 결과를 평균 또는 투표
Gradient Boosting| 이전 모델의 오차를 보완하는 방식으로 Tree를 순차적으로 학습
XGBoost| Gradient Boosting을 개선한 고성능 모델
LightGBM| 빠른 학습 속도를 가진 Gradient Boosting 계열 모델
CatBoost| 범주형 변수 처리에 강한 Gradient Boosting 계열 모델

---

22. 정리

- Decision Tree는 조건을 기준으로 데이터를 나누며 예측하는 모델이다.
- Root Node는 트리의 시작점이고, Leaf Node는 최종 예측 결과가 나오는 노드이다.
- 분류 문제에서는 Gini Impurity나 Entropy를 기준으로 데이터를 나눈다.
- 회귀 문제에서는 MSE나 MAE를 기준으로 데이터를 나눈다.
- Gini Impurity와 Entropy는 노드 안의 클래스가 얼마나 섞여 있는지 나타낸다.
- Information Gain은 분할을 통해 불확실성이 얼마나 줄었는지 나타낸다.
- Decision Tree는 해석하기 쉽지만 과대적합이 발생하기 쉽다.
- "max_depth", "min_samples_split", "min_samples_leaf"를 조정하여 트리 복잡도를 제어할 수 있다.
- Feature Importance를 통해 모델이 중요하게 사용한 변수를 확인할 수 있다.
- Random Forest, Gradient Boosting 등 Ensemble 모델은 Decision Tree를 기반으로 한다.