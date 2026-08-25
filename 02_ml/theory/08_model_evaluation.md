Model Evaluation 개념 정리

1. Model Evaluation

Model Evaluation은 학습한 모델의 성능을 평가하는 과정이다.

모델이 학습 데이터에만 잘 맞는 것이 아니라, 새로운 데이터에서도 잘 예측하는지 확인하는 것이 중요하다.

모델 평가는 문제 유형에 따라 적절한 지표를 선택해야 한다.

---

2. 모델 평가가 필요한 이유

머신러닝 모델은 학습 데이터의 패턴을 학습한다.

하지만 학습 데이터에서 성능이 좋다고 해서 실제 새로운 데이터에서도 좋은 성능을 보장하지는 않는다.

모델 평가는 다음을 확인하기 위해 필요하다.

- 모델이 새로운 데이터에도 잘 일반화되는지
- 과대적합이 발생하지 않았는지
- 문제 목적에 맞는 성능을 보이는지
- 여러 모델 중 어떤 모델이 더 적합한지
- 하이퍼파라미터 튜닝 결과가 실제로 개선되었는지

---

3. Train / Validation / Test Data

머신러닝에서는 데이터를 보통 학습용, 검증용, 테스트용으로 나누어 사용한다.

데이터| 역할
Train Data| 모델을 학습하는 데 사용
Validation Data| 모델 선택과 하이퍼파라미터 튜닝에 사용
Test Data| 최종 모델 성능 평가에 사용

Test Data는 최종 성능 평가를 위해 마지막에 한 번만 사용하는 것이 좋다.

---

4. Train/Test Split

Train/Test Split은 전체 데이터를 학습 데이터와 테스트 데이터로 나누는 방법이다.

전체 데이터
→ Train Data
→ Test Data

모델은 Train Data로 학습하고, Test Data로 최종 성능을 평가한다.

데이터를 나누지 않고 전체 데이터로 학습과 평가를 모두 하면, 모델이 실제보다 좋은 성능을 보이는 것처럼 보일 수 있다.

---

5. Regression 평가 지표

Regression은 연속형 값을 예측하는 문제이다.

회귀 모델은 실제값과 예측값의 차이를 기준으로 성능을 평가한다.

지표| 설명
MAE| 오차 절댓값의 평균
MSE| 오차 제곱의 평균
RMSE| MSE의 제곱근
R²| 모델이 데이터의 변동성을 설명하는 정도
MAPE| 실제값 대비 오차 비율의 평균

---

6. MAE

MAE는 Mean Absolute Error의 약자로, 실제값과 예측값 차이의 절댓값 평균이다.

$$
MAE = \frac{1}{N} \sum_{i=1}^{N} |y_i - \hat{y}_i|
$$

특징

- 오차를 직관적으로 해석하기 쉽다.
- 실제 예측값과 같은 단위를 가진다.
- 이상치의 영향을 MSE보다 상대적으로 덜 받는다.

---

7. MSE

MSE는 Mean Squared Error의 약자로, 실제값과 예측값 차이를 제곱한 뒤 평균을 구한 값이다.

$$
MSE = \frac{1}{N} \sum_{i=1}^{N} (y_i - \hat{y}_i)^2
$$

특징

- 큰 오차에 더 큰 패널티를 준다.
- 이상치에 민감하다.
- 모델 학습 과정에서 손실 함수로 자주 사용된다.

---

8. RMSE

RMSE는 Root Mean Squared Error의 약자로, MSE에 제곱근을 씌운 값이다.

$$
RMSE = \sqrt{MSE}
$$

특징

- 실제 예측값과 같은 단위로 해석할 수 있다.
- 큰 오차에 민감하다.
- 회귀 모델 성능 비교에 자주 사용된다.

---

9. R² Score

R² Score는 결정계수라고 하며, 모델이 실제값의 변동성을 얼마나 잘 설명하는지 나타내는 지표이다.

값은 보통 1에 가까울수록 좋다.

R² 값| 의미
1에 가까움| 모델이 데이터를 잘 설명함
0에 가까움| 평균값으로 예측하는 것과 비슷함
음수| 평균값 예측보다 성능이 나쁠 수 있음

R² Score는 모델의 설명력을 확인하는 데 유용하지만, 단독으로만 판단하기보다는 MAE, RMSE와 함께 확인하는 것이 좋다.

---

10. MAPE

MAPE는 Mean Absolute Percentage Error의 약자로, 실제값 대비 예측 오차 비율의 평균이다.

$$
MAPE = \frac{1}{N} \sum_{i=1}^{N} \left| \frac{y_i - \hat{y}_i}{y_i} \right| \times 100
$$

특징

- 오차를 비율로 해석할 수 있다.
- 비즈니스 관점에서 이해하기 쉽다.
- 실제값이 0에 가까우면 값이 지나치게 커질 수 있다.

---

11. Classification 평가 지표

Classification은 데이터를 특정 클래스 중 하나로 분류하는 문제이다.

분류 모델은 예측 클래스와 실제 클래스를 비교하여 성능을 평가한다.

지표| 설명
Accuracy| 전체 데이터 중 맞게 예측한 비율
Precision| Positive로 예측한 것 중 실제 Positive 비율
Recall| 실제 Positive 중 모델이 맞게 찾은 비율
F1-score| Precision과 Recall의 조화 평균
ROC-AUC| Threshold 변화에 따른 분류 성능

---

12. Confusion Matrix

Confusion Matrix는 분류 모델의 예측 결과를 실제값과 비교하여 정리한 표이다.

구분| 실제 Positive| 실제 Negative
예측 Positive| TP| FP
예측 Negative| FN| TN

용어| 의미
TP| 실제 Positive를 Positive로 맞게 예측
TN| 실제 Negative를 Negative로 맞게 예측
FP| 실제 Negative를 Positive로 잘못 예측
FN| 실제 Positive를 Negative로 잘못 예측

Confusion Matrix는 Accuracy, Precision, Recall, F1-score를 계산하는 기본이 된다.

---

13. Accuracy

Accuracy는 전체 데이터 중 모델이 맞게 예측한 비율이다.

$$
Accuracy = \frac{TP + TN}{TP + TN + FP + FN}
$$

특징

- 가장 직관적인 분류 평가 지표이다.
- 클래스 비율이 균형 잡힌 경우 유용하다.
- 클래스 불균형 데이터에서는 성능을 왜곡해서 볼 수 있다.

예를 들어 이탈 고객이 전체의 5%뿐이라면, 모든 고객을 유지로 예측해도 Accuracy는 95%가 될 수 있다.

---

14. Precision

Precision은 모델이 Positive라고 예측한 것 중 실제 Positive인 비율이다.

$$
Precision = \frac{TP}{TP + FP}
$$

특징

- Positive 예측의 정확도를 나타낸다.
- False Positive를 줄이는 것이 중요할 때 사용한다.
- 스팸 메일 분류, 이상 거래 탐지 등에서 중요할 수 있다.

예를 들어 스팸이 아닌 메일을 스팸으로 잘못 분류하면 문제가 큰 상황에서는 Precision이 중요하다.

---

15. Recall

Recall은 실제 Positive 중 모델이 Positive로 맞게 찾은 비율이다.

$$
Recall = \frac{TP}{TP + FN}
$$

특징

- 실제 Positive를 얼마나 잘 찾아냈는지 나타낸다.
- False Negative를 줄이는 것이 중요할 때 사용한다.
- 질병 진단, 사기 탐지, 이탈 고객 탐지 등에서 중요할 수 있다.

예를 들어 실제 환자를 정상으로 잘못 예측하면 문제가 큰 상황에서는 Recall이 중요하다.

---

16. F1-score

F1-score는 Precision과 Recall의 조화 평균이다.

$$
F1 = 2 \times \frac{Precision \times Recall}{Precision + Recall}
$$

특징

- Precision과 Recall의 균형을 함께 고려한다.
- 클래스 불균형 데이터에서 자주 사용된다.
- Precision과 Recall 중 하나만 높고 다른 하나가 낮으면 F1-score도 낮아진다.

---

17. Precision과 Recall의 Trade-off

Precision과 Recall은 서로 Trade-off 관계를 가지는 경우가 많다.

Threshold를 낮추면 더 많은 데이터를 Positive로 예측하게 되어 Recall은 높아질 수 있지만, Precision은 낮아질 수 있다.

Threshold를 높이면 더 확실한 데이터만 Positive로 예측하게 되어 Precision은 높아질 수 있지만, Recall은 낮아질 수 있다.

Threshold 변화| Precision| Recall
낮춤| 낮아질 수 있음| 높아질 수 있음
높임| 높아질 수 있음| 낮아질 수 있음

문제 상황에 따라 Precision과 Recall 중 무엇이 더 중요한지 판단해야 한다.

---

18. ROC Curve와 ROC-AUC

ROC Curve는 Threshold를 바꿔가며 True Positive Rate와 False Positive Rate의 관계를 나타낸 곡선이다.

ROC-AUC는 ROC Curve 아래 면적을 의미한다.

값| 의미
1에 가까움| 분류 성능이 좋음
0.5에 가까움| 랜덤 예측과 비슷함
0.5보다 낮음| 모델 예측 방향이 좋지 않음

ROC-AUC는 모델이 Positive와 Negative를 얼마나 잘 구분하는지 평가할 때 사용한다.

---

19. PR-AUC

PR-AUC는 Precision-Recall Curve 아래 면적을 의미한다.

클래스 불균형이 심한 데이터에서는 ROC-AUC보다 PR-AUC가 더 유용할 수 있다.

특징

- Positive 클래스 성능에 더 집중한다.
- 불균형 데이터에서 유용하다.
- Precision과 Recall의 관계를 함께 확인할 수 있다.

---

20. Multi-class Classification 평가

다중 분류에서는 클래스가 여러 개이기 때문에 Precision, Recall, F1-score를 계산할 때 평균 방식이 필요하다.

평균 방식| 설명
Macro Average| 클래스별 지표를 단순 평균
Micro Average| 전체 TP, FP, FN을 합쳐 계산
Weighted Average| 클래스별 데이터 수를 가중치로 반영

클래스 불균형이 있는 경우 Macro Average와 Weighted Average를 함께 확인하는 것이 좋다.

---

21. Clustering 평가 지표

Clustering은 정답 Label이 없는 경우가 많기 때문에 지도학습처럼 실제값과 예측값을 직접 비교하기 어렵다.

대신 군집 내부의 응집도와 군집 간 분리도를 기준으로 평가한다.

지표| 설명
Silhouette Score| 군집 내부 응집도와 군집 간 분리도 평가
Davies-Bouldin Index| 군집 간 분리와 내부 응집도 평가
Calinski-Harabasz Index| 군집 간 분산과 내부 분산 비율 평가

Clustering 결과는 지표뿐만 아니라 실제 도메인 관점에서 해석 가능한지도 확인해야 한다.

---

22. Silhouette Score

Silhouette Score는 각 데이터가 자신의 군집에 얼마나 잘 속해 있고, 다른 군집과 얼마나 잘 분리되어 있는지를 나타낸다.

값은 -1부터 1 사이를 가진다.

값| 의미
1에 가까움| 군집이 잘 형성됨
0에 가까움| 군집 경계에 위치
-1에 가까움| 잘못된 군집에 속했을 가능성

Silhouette Score가 높을수록 군집화 결과가 좋다고 볼 수 있다.

---

23. 평가 지표 선택 기준

문제 유형과 목적에 따라 평가 지표를 다르게 선택해야 한다.

상황| 추천 지표
회귀 문제| MAE, RMSE, R²
큰 오차를 강하게 줄이고 싶을 때| MSE, RMSE
오차를 직관적으로 해석하고 싶을 때| MAE
이진 분류, 클래스 균형| Accuracy
이진 분류, 클래스 불균형| Precision, Recall, F1-score, PR-AUC
Positive를 놓치면 안 되는 문제| Recall
Positive 예측의 정확도가 중요한 문제| Precision
분류 기준 전반의 성능 확인| ROC-AUC
군집화 문제| Silhouette Score

---

24. Data Leakage

Data Leakage는 모델이 학습 과정에서 원래 알 수 없어야 하는 정보를 사용하게 되는 문제이다.

Data Leakage가 발생하면 평가 성능이 실제보다 과하게 좋게 나올 수 있다.

예시

- Test Data 정보를 전처리 과정에서 미리 사용한 경우
- 미래 시점의 정보를 Feature로 사용한 경우
- Target과 직접적으로 연결된 변수를 Feature로 사용한 경우
- Train/Test Split 전에 전체 데이터 기준으로 Scaling한 경우

Data Leakage를 방지하려면 전처리, Feature Engineering, Scaling, 모델 학습 과정을 Train Data 기준으로 수행해야 한다.

---

25. Cross Validation

Cross Validation은 데이터를 여러 부분으로 나누어 모델을 여러 번 학습하고 평가하는 방법이다.

한 번의 Train/Test Split 결과에만 의존하지 않고, 여러 번의 평가 결과를 평균내어 더 안정적인 성능을 확인할 수 있다.

대표적으로 K-Fold Cross Validation을 사용한다.

Cross Validation은 다음 파일에서 더 자세히 정리한다.

---

26. 모델 평가 시 주의할 점

- 문제 유형에 맞는 평가 지표를 선택해야 한다.
- 학습 데이터 성능과 테스트 데이터 성능을 함께 확인해야 한다.
- Accuracy만으로 분류 모델을 평가하지 않도록 주의해야 한다.
- 클래스 불균형 여부를 확인해야 한다.
- Test Data는 최종 평가 용도로만 사용하는 것이 좋다.
- Data Leakage가 발생하지 않도록 주의해야 한다.
- 평가 지표뿐만 아니라 실제 비즈니스 목적에 맞는지도 함께 고려해야 한다.

---

27. 정리

- Model Evaluation은 모델이 새로운 데이터에서도 잘 작동하는지 확인하는 과정이다.
- Train Data는 학습에, Validation Data는 모델 선택에, Test Data는 최종 평가에 사용한다.
- 회귀 문제에서는 MAE, MSE, RMSE, R² 등을 사용한다.
- 분류 문제에서는 Accuracy, Precision, Recall, F1-score, ROC-AUC 등을 사용한다.
- Confusion Matrix는 분류 평가 지표의 기본이 된다.
- Precision은 Positive로 예측한 것 중 실제 Positive 비율이다.
- Recall은 실제 Positive 중 모델이 맞게 찾은 비율이다.
- F1-score는 Precision과 Recall의 균형을 보는 지표이다.
- 클래스 불균형 데이터에서는 Accuracy만으로 평가하면 안 된다.
- Clustering은 Silhouette Score 등으로 군집 품질을 평가할 수 있다.
- Data Leakage가 발생하면 평가 성능이 실제보다 좋게 나올 수 있다.
- 평가 지표는 문제 목적과 데이터 특성에 맞게 선택해야 한다.