Cross Validation 개념 정리

1. Cross Validation

Cross Validation은 데이터를 여러 부분으로 나누어 모델을 여러 번 학습하고 평가하는 방법이다.

한국어로는 교차 검증이라고 한다.

한 번의 Train/Test Split 결과에만 의존하지 않고, 여러 번의 평가 결과를 평균내어 모델 성능을 더 안정적으로 확인할 수 있다.

---

2. Cross Validation이 필요한 이유

Train/Test Split을 한 번만 수행하면, 데이터가 어떻게 나뉘었는지에 따라 평가 결과가 달라질 수 있다.

특정 데이터가 우연히 Train Data나 Test Data에 몰리면 모델 성능이 실제보다 좋거나 나쁘게 보일 수 있다.

Cross Validation을 사용하면 여러 번 나누어 평가하기 때문에 더 신뢰할 수 있는 성능을 확인할 수 있다.

목적

- 평가 결과의 안정성 향상
- 과대적합 여부 확인
- 모델 선택
- 하이퍼파라미터 튜닝
- 데이터 분할에 따른 성능 변동 확인

---

3. Hold-out Validation

Hold-out Validation은 데이터를 한 번만 Train Data와 Validation Data로 나누어 평가하는 방법이다.

전체 데이터
→ Train Data
→ Validation Data

특징

- 가장 단순한 검증 방법이다.
- 계산 비용이 적다.
- 데이터 분할에 따라 성능이 달라질 수 있다.
- 데이터가 충분히 많을 때 사용하기 쉽다.

---

4. Train / Validation / Test Data

머신러닝에서는 데이터를 목적에 따라 나누어 사용한다.

데이터| 역할
Train Data| 모델 학습에 사용
Validation Data| 모델 선택과 하이퍼파라미터 튜닝에 사용
Test Data| 최종 성능 평가에 사용

Validation Data는 학습 과정에서 모델을 비교하고 조정하는 데 사용한다.

Test Data는 최종 모델을 선택한 뒤 마지막 성능을 확인하는 용도로 사용하는 것이 좋다.

---

5. K-Fold Cross Validation

K-Fold Cross Validation은 전체 데이터를 K개의 Fold로 나눈 뒤, K번 학습과 평가를 반복하는 방법이다.

각 반복에서 하나의 Fold는 Validation Data로 사용하고, 나머지 Fold는 Train Data로 사용한다.

1회차: Fold 1 → Validation, 나머지 → Train
2회차: Fold 2 → Validation, 나머지 → Train
3회차: Fold 3 → Validation, 나머지 → Train
...
K회차: Fold K → Validation, 나머지 → Train

최종 성능은 K번 평가 결과의 평균으로 계산한다.

---

6. K-Fold의 예시

예를 들어 데이터를 5개의 Fold로 나누면 5-Fold Cross Validation이 된다.

회차| Train Data| Validation Data
1회차| Fold 2, 3, 4, 5| Fold 1
2회차| Fold 1, 3, 4, 5| Fold 2
3회차| Fold 1, 2, 4, 5| Fold 3
4회차| Fold 1, 2, 3, 5| Fold 4
5회차| Fold 1, 2, 3, 4| Fold 5

각 데이터는 한 번씩 Validation Data로 사용된다.

---

7. K-Fold의 장점

K-Fold Cross Validation은 다음과 같은 장점이 있다.

- 모든 데이터를 학습과 검증에 활용할 수 있다.
- 한 번의 데이터 분할보다 평가 결과가 안정적이다.
- 데이터가 많지 않을 때 유용하다.
- 모델의 일반화 성능을 더 신뢰성 있게 확인할 수 있다.

---

8. K-Fold의 한계

K-Fold Cross Validation에도 한계가 있다.

- 모델을 K번 학습해야 하므로 계산 비용이 증가한다.
- 데이터가 매우 크면 시간이 오래 걸릴 수 있다.
- 시계열 데이터처럼 순서가 중요한 데이터에는 일반 K-Fold를 그대로 사용하면 안 된다.
- 데이터 누수 Data Leakage에 주의해야 한다.

---

9. Stratified K-Fold

Stratified K-Fold는 각 Fold의 클래스 비율이 전체 데이터의 클래스 비율과 비슷하게 유지되도록 나누는 방법이다.

분류 문제, 특히 클래스 불균형 데이터에서 자주 사용한다.

예를 들어 전체 데이터에서 Positive 클래스가 10%, Negative 클래스가 90%라면 각 Fold에서도 비슷한 비율을 유지한다.

특징

- 클래스 비율을 유지한다.
- 분류 문제에 적합하다.
- 클래스 불균형 데이터에서 일반 K-Fold보다 안정적이다.

---

10. K-Fold와 Stratified K-Fold 비교

구분| K-Fold| Stratified K-Fold
분할 기준| 데이터를 K개로 나눔| 클래스 비율을 유지하며 K개로 나눔
주요 사용| 회귀, 일반 문제| 분류 문제
클래스 불균형 대응| 약할 수 있음| 상대적으로 강함
예시| 회귀 모델 평가| 이탈 여부 분류 평가

분류 문제에서는 일반적으로 Stratified K-Fold를 사용하는 것이 더 안정적이다.

---

11. Leave-One-Out Cross Validation

Leave-One-Out Cross Validation은 데이터 하나만 Validation Data로 사용하고, 나머지 전체 데이터를 Train Data로 사용하는 방법이다.

데이터 개수가 N개이면 총 N번 학습과 평가를 반복한다.

1회차: 1번 데이터 Validation
2회차: 2번 데이터 Validation
...
N회차: N번 데이터 Validation

특징

- 데이터가 매우 적을 때 사용할 수 있다.
- 거의 모든 데이터를 학습에 사용할 수 있다.
- 계산 비용이 매우 크다.
- 데이터가 많으면 현실적으로 사용하기 어렵다.

---

12. Time Series Cross Validation

Time Series Cross Validation은 시계열 데이터에 사용하는 교차 검증 방법이다.

시계열 데이터는 시간 순서가 중요하기 때문에 미래 데이터를 이용해 과거를 예측하면 안 된다.

일반 K-Fold처럼 데이터를 섞으면 Data Leakage가 발생할 수 있다.

---

13. Time Series Split

Time Series Split은 과거 데이터로 학습하고, 이후 시점의 데이터로 검증하는 방식이다.

1회차: 과거 1구간 Train → 다음 구간 Validation
2회차: 과거 1~2구간 Train → 다음 구간 Validation
3회차: 과거 1~3구간 Train → 다음 구간 Validation

특징

- 시간 순서를 유지한다.
- 미래 정보를 학습에 사용하지 않는다.
- 매출 예측, 수요 예측, 주가 예측 등 시계열 문제에 적합하다.

---

14. Group K-Fold

Group K-Fold는 같은 그룹에 속한 데이터가 Train과 Validation에 동시에 들어가지 않도록 나누는 방법이다.

예를 들어 한 사용자의 여러 기록이 있을 때, 같은 사용자의 데이터가 Train과 Validation에 동시에 들어가면 평가 성능이 실제보다 좋게 나올 수 있다.

사용 예시

- 사용자별 로그 데이터
- 환자별 의료 데이터
- 기업별 거래 데이터
- 같은 상품의 반복 측정 데이터

Group K-Fold는 그룹 단위로 데이터를 분리하여 Data Leakage를 줄인다.

---

15. Cross Validation과 Hyperparameter Tuning

Cross Validation은 하이퍼파라미터 튜닝에서 자주 사용된다.

하이퍼파라미터 조합마다 Cross Validation을 수행하고, 평균 검증 성능이 가장 좋은 조합을 선택한다.

하이퍼파라미터 조합 1 → CV 평균 성능
하이퍼파라미터 조합 2 → CV 평균 성능
하이퍼파라미터 조합 3 → CV 평균 성능

가장 좋은 조합 선택

Grid Search, Random Search, Bayesian Optimization 등에서 Cross Validation을 함께 사용할 수 있다.

---

16. Grid Search CV

Grid Search CV는 사용자가 지정한 하이퍼파라미터 후보를 모두 조합해보고, Cross Validation으로 성능을 평가하는 방법이다.

특징

- 가능한 조합을 모두 탐색한다.
- 가장 좋은 조합을 찾기 쉽다.
- 후보가 많으면 계산 비용이 매우 커질 수 있다.
- 작은 탐색 범위에서 사용하기 좋다.

---

17. Random Search CV

Random Search CV는 하이퍼파라미터 후보 중 일부 조합을 무작위로 선택하여 평가하는 방법이다.

특징

- Grid Search보다 계산 비용을 줄일 수 있다.
- 탐색 범위가 넓을 때 유용하다.
- 모든 조합을 확인하지는 않는다.
- 제한된 시간 안에서 좋은 조합을 찾을 때 사용할 수 있다.

---

18. Nested Cross Validation

Nested Cross Validation은 모델 선택과 최종 성능 평가를 분리하기 위해 사용하는 방법이다.

안쪽 Cross Validation은 하이퍼파라미터 튜닝에 사용하고, 바깥쪽 Cross Validation은 최종 성능 평가에 사용한다.

Outer CV: 최종 성능 평가
Inner CV: 하이퍼파라미터 튜닝

특징

- 모델 선택 과정에서 발생할 수 있는 평가 편향을 줄인다.
- 성능 평가가 더 엄격하다.
- 계산 비용이 크다.
- 연구나 모델 비교에서 유용하다.

---

19. Cross Validation과 Data Leakage

Cross Validation을 사용할 때 가장 주의해야 할 점은 Data Leakage이다.

특히 전처리나 Feature Engineering을 전체 데이터에 먼저 적용한 뒤 Cross Validation을 수행하면, Validation Fold의 정보가 Train Fold에 반영될 수 있다.

잘못된 예시

전체 데이터로 Scaling
→ K-Fold Cross Validation

이 경우 Validation Data의 정보가 Scaling 기준에 포함되어 Data Leakage가 발생할 수 있다.

---

20. Pipeline 사용

Data Leakage를 방지하려면 전처리와 모델 학습을 Pipeline으로 묶어 Cross Validation 안에서 함께 수행하는 것이 좋다.

각 Fold마다
Train Fold 기준으로 전처리 기준 학습
→ Train Fold 변환
→ Validation Fold 변환
→ 모델 학습 및 평가

Pipeline을 사용하면 각 Fold에서 Train Data 기준으로만 전처리 기준을 학습할 수 있다.

---

21. Cross Validation 결과 해석

Cross Validation 결과는 보통 평균과 표준편차를 함께 확인한다.

값| 의미
평균 성능| 모델의 전반적인 성능
표준편차| Fold별 성능 변동성

평균 성능이 높고 표준편차가 낮으면, 모델이 여러 데이터 분할에서 안정적으로 작동한다고 볼 수 있다.

평균 성능은 높지만 표준편차가 크다면, 데이터 분할에 따라 성능이 크게 달라지는 모델일 수 있다.

---

22. Cross Validation 사용 시 주의할 점

- Test Data는 최종 평가용으로 따로 남겨두는 것이 좋다.
- Cross Validation은 Train Data 안에서 수행한다.
- 분류 문제에서는 Stratified K-Fold를 고려한다.
- 시계열 데이터에서는 일반 K-Fold를 사용하지 않는다.
- 그룹 구조가 있는 데이터에서는 Group K-Fold를 고려한다.
- 전처리와 Feature Engineering은 각 Fold의 Train Data 기준으로 수행해야 한다.
- Cross Validation 성능이 좋아도 최종 Test 성능을 따로 확인해야 한다.

---

23. Cross Validation 방법 선택 기준

상황| 추천 방법
일반적인 회귀 문제| K-Fold
일반적인 분류 문제| Stratified K-Fold
클래스 불균형 분류 문제| Stratified K-Fold
데이터가 매우 적은 경우| Leave-One-Out CV
시계열 데이터| Time Series Split
사용자나 환자 등 그룹이 있는 데이터| Group K-Fold
하이퍼파라미터 튜닝| Grid Search CV, Random Search CV
엄격한 모델 비교| Nested Cross Validation

---

24. 정리

- Cross Validation은 데이터를 여러 번 나누어 모델 성능을 평가하는 방법이다.
- 한 번의 Train/Test Split보다 안정적인 성능 평가가 가능하다.
- K-Fold Cross Validation은 데이터를 K개로 나누고, 각 Fold를 한 번씩 Validation Data로 사용한다.
- Stratified K-Fold는 클래스 비율을 유지하며 Fold를 나누기 때문에 분류 문제에 적합하다.
- Leave-One-Out CV는 데이터 하나씩 검증에 사용하는 방식으로, 데이터가 매우 적을 때 사용할 수 있다.
- 시계열 데이터에서는 시간 순서를 유지하는 Time Series Split을 사용해야 한다.
- 그룹 구조가 있는 데이터에서는 Group K-Fold를 고려해야 한다.
- Cross Validation은 하이퍼파라미터 튜닝과 모델 비교에 자주 사용된다.
- 전처리와 Feature Engineering은 각 Fold의 Train Data 기준으로 수행해야 한다.
- Data Leakage를 방지하기 위해 Pipeline을 사용하는 것이 좋다.
- 최종 성능은 별도로 남겨둔 Test Data에서 평가하는 것이 좋다.