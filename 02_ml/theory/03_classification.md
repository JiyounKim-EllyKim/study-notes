Classification 개념 정리

1. Classification

Classification은 데이터를 정해진 클래스 중 하나로 분류하는 지도학습 문제이다.

예측 결과가 연속형 숫자가 아니라, 특정 범주나 클래스라는 점에서 Regression과 다르다.

예를 들어 고객이 이탈할지 여부를 예측하거나, 이메일이 스팸인지 아닌지 분류하는 문제는 Classification에 해당한다.

---

2. Classification 문제 예시

Classification은 예측 결과가 범주형 값일 때 사용한다.

문제| 예측값
스팸 메일 분류| 스팸 / 정상
고객 이탈 예측| 이탈 / 유지
질병 여부 예측| 양성 / 음성
합격 여부 예측| 합격 / 불합격
이미지 분류| 고양이 / 강아지 / 자동차 등

예측값은 숫자의 크기보다 어떤 클래스에 속하는지가 중요하다.

---

3. Regression과 Classification 비교

구분| Regression| Classification
예측 대상| 연속형 값| 범주형 클래스
출력 예시| 가격, 매출, 점수| 이탈/유지, 스팸/정상
대표 지표| MAE, MSE, RMSE, R²| Accuracy, Precision, Recall, F1-score
대표 모델| Linear Regression| Logistic Regression

Regression은 숫자 값을 예측하고, Classification은 클래스를 예측한다.

---

4. Classification의 유형

Classification은 클래스 개수에 따라 여러 유형으로 나눌 수 있다.

유형| 설명| 예시
Binary Classification| 두 개의 클래스 중 하나를 예측| 이탈 / 유지
Multi-class Classification| 여러 클래스 중 하나를 예측| 고양이 / 강아지 / 새
Multi-label Classification| 하나의 데이터가 여러 클래스를 동시에 가질 수 있음| 영화 장르 분류

---

5. Binary Classification 이진 분류

Binary Classification은 두 개의 클래스 중 하나를 예측하는 문제이다.

예시

- 고객이 이탈할지 여부
- 이메일이 스팸인지 여부
- 질병이 있는지 여부
- 거래가 정상인지 이상 거래인지 여부

이진 분류에서는 보통 클래스 1에 속할 확률을 예측한 뒤, 기준값 Threshold를 기준으로 클래스를 결정한다.

예측 확률 >= 0.5 → 클래스 1
예측 확률 < 0.5 → 클래스 0

---

6. Multi-class Classification 다중 분류

Multi-class Classification은 여러 클래스 중 하나를 예측하는 문제이다.

예시

- 손글씨 숫자 분류
- 뉴스 기사 카테고리 분류
- 상품 카테고리 분류
- 이미지 객체 분류

다중 분류에서는 각 클래스에 속할 확률을 계산하고, 가장 확률이 높은 클래스를 최종 예측값으로 선택한다.

---

7. Multi-label Classification 다중 라벨 분류

Multi-label Classification은 하나의 데이터가 여러 클래스를 동시에 가질 수 있는 문제이다.

예를 들어 영화 한 편은 "액션", "코미디", "모험" 장르를 동시에 가질 수 있다.

문제| 가능한 예측값
영화 장르 분류| 액션, 코미디, 로맨스
이미지 태그 분류| 사람, 바다, 자동차
문서 주제 분류| 경제, 정치, 국제

Multi-class Classification은 여러 클래스 중 하나만 선택하지만, Multi-label Classification은 여러 클래스를 동시에 선택할 수 있다.

---

8. Logistic Regression

Logistic Regression은 Classification에서 자주 사용되는 기본 모델이다.

이름에는 Regression이 들어가지만, 실제로는 분류 모델이다.

선형 결합 결과를 Sigmoid 함수에 통과시켜 클래스 1에 속할 확률을 계산한다.

$$
z = w_1x_1 + w_2x_2 + \cdots + w_nx_n + b
$$

$$
p = \frac{1}{1 + e^{-z}}
$$

- $z$: 선형 결합 결과
- $p$: 클래스 1에 속할 확률

---

9. Logistic Regression의 예측 방식

Logistic Regression은 확률값을 출력한다.

이진 분류에서는 보통 0.5를 기준으로 클래스를 나눈다.

예측 확률| 예측 클래스
0.5 이상| 1
0.5 미만| 0

예를 들어 고객 이탈 확률이 0.8이면 이탈 가능성이 높다고 판단할 수 있다.

---

10. Sigmoid Function

Sigmoid 함수는 어떤 입력값이든 0과 1 사이의 값으로 변환한다.

$$
\sigma(z) = \frac{1}{1 + e^{-z}}
$$

Classification에서는 이 값을 확률처럼 해석할 수 있다.

특징

- 출력값이 0과 1 사이이다.
- 이진 분류의 확률 예측에 사용된다.
- 기준값 Threshold를 정해 클래스를 결정할 수 있다.

---

11. Softmax Function

Softmax 함수는 여러 클래스에 대한 점수를 확률로 변환한다.

다중 분류에서 자주 사용된다.

$$
softmax(z_i) = \frac{e^{z_i}}{\sum_{j=1}^{K} e^{z_j}}
$$

- $K$: 전체 클래스 개수
- $z_i$: i번째 클래스의 점수

Softmax의 출력값은 각 클래스에 속할 확률이며, 전체 확률의 합은 1이다.

---

12. K-Nearest Neighbors KNN

KNN은 새로운 데이터와 가까운 K개의 이웃을 보고 클래스를 결정하는 알고리즘이다.

분류 문제에서는 가까운 이웃들의 다수결로 클래스를 예측한다.

새로운 데이터와 가장 가까운 K개 데이터 선택
→ 이웃들의 클래스 확인
→ 가장 많이 등장한 클래스로 예측

특징

- 원리가 단순하고 직관적이다.
- 별도의 복잡한 학습 과정이 거의 없다.
- 거리 기반 모델이므로 스케일링이 중요하다.
- K 값에 따라 결과가 달라진다.
- 데이터가 많아질수록 예측 시간이 오래 걸릴 수 있다.

---

13. Support Vector Machine SVM

SVM은 클래스를 가장 잘 나누는 결정 경계를 찾는 분류 모델이다.

두 클래스 사이의 간격 Margin을 최대화하는 방향으로 학습한다.

특징

- 선형 분류와 비선형 분류 모두 가능하다.
- Margin을 최대화하여 일반화 성능을 높이려 한다.
- Kernel Trick을 사용하면 비선형 결정 경계를 만들 수 있다.
- 데이터가 많을 때 학습 시간이 길어질 수 있다.

---

14. Naive Bayes

Naive Bayes는 베이즈 정리를 기반으로 한 확률적 분류 모델이다.

각 Feature가 서로 독립이라고 가정한다는 점에서 Naive라는 이름이 붙었다.

특징

- 계산이 빠르다.
- 텍스트 분류에서 자주 사용된다.
- 데이터가 많지 않아도 비교적 잘 작동할 수 있다.
- Feature 간 독립 가정이 현실과 다를 수 있다.

활용 예시

- 스팸 메일 분류
- 문서 카테고리 분류
- 감성 분석

---

15. Decision Tree Classifier

Decision Tree Classifier는 질문을 순차적으로 나누며 데이터를 분류하는 모델이다.

트리 구조를 사용해 조건에 따라 데이터를 분할하고, 마지막 Leaf Node에서 클래스를 예측한다.

특징

- 해석하기 쉽다.
- 전처리 부담이 비교적 적다.
- 비선형 관계를 표현할 수 있다.
- 트리가 너무 깊어지면 과대적합이 발생할 수 있다.

Decision Tree는 다음 파일에서 더 자세히 정리한다.

---

16. Ensemble Classification

Ensemble은 여러 모델을 결합하여 성능을 높이는 방법이다.

분류 문제에서는 여러 모델의 예측을 종합하여 최종 클래스를 결정한다.

대표적인 Ensemble 모델은 다음과 같다.

- Random Forest
- Gradient Boosting
- XGBoost
- LightGBM
- CatBoost

Ensemble 모델은 정형 데이터 분류 문제에서 자주 좋은 성능을 보인다.

---

17. Threshold

Threshold는 예측 확률을 클래스로 바꾸는 기준값이다.

이진 분류에서는 보통 0.5를 기본 기준으로 사용한다.

예측 확률 0.7, Threshold 0.5 → 클래스 1
예측 확률 0.3, Threshold 0.5 → 클래스 0

하지만 문제 상황에 따라 Threshold를 조정할 수 있다.

예를 들어 질병 진단처럼 놓치면 안 되는 문제가 있다면 Recall을 높이기 위해 Threshold를 낮출 수 있다.

---

18. Confusion Matrix

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

19. Classification 평가 지표

Classification에서는 문제 상황에 맞는 평가 지표를 선택해야 한다.

지표| 설명
Accuracy| 전체 데이터 중 맞게 예측한 비율
Precision| Positive로 예측한 것 중 실제 Positive 비율
Recall| 실제 Positive 중 모델이 맞게 찾은 비율
F1-score| Precision과 Recall의 조화 평균
ROC-AUC| 분류 기준 변화에 따른 모델 구분 성능

데이터가 불균형한 경우 Accuracy만으로 성능을 판단하기 어렵다.

예를 들어 이탈 고객이 전체의 5%밖에 없다면, 모든 고객을 유지로 예측해도 Accuracy는 높게 나올 수 있다.
이 경우 Recall, Precision, F1-score 등을 함께 확인해야 한다.

---

20. Classification 모델 사용 시 주의할 점

- 예측 대상이 범주형 클래스인지 확인해야 한다.
- 클래스 불균형이 있는지 확인해야 한다.
- Accuracy만 보고 모델을 평가하지 않도록 주의해야 한다.
- 문제 상황에 따라 Precision과 Recall 중 무엇이 중요한지 판단해야 한다.
- 거리 기반 모델은 스케일링이 중요하다.
- Threshold 조정이 필요한 문제인지 확인해야 한다.
- 확률값을 해석할 때는 모델의 Calibration도 고려할 수 있다.

---

21. 정리

- Classification은 범주형 클래스를 예측하는 지도학습 문제이다.
- 이진 분류는 두 개의 클래스 중 하나를 예측한다.
- 다중 분류는 여러 클래스 중 하나를 예측한다.
- 다중 라벨 분류는 하나의 데이터가 여러 클래스를 동시에 가질 수 있다.
- Logistic Regression은 분류에서 자주 사용되는 기본 모델이다.
- Sigmoid는 이진 분류에서 확률을 출력할 때 사용된다.
- Softmax는 다중 분류에서 클래스별 확률을 출력할 때 사용된다.
- KNN은 가까운 이웃들의 다수결로 클래스를 예측한다.
- SVM은 Margin을 최대화하는 결정 경계를 찾는다.
- Naive Bayes는 확률 기반 분류 모델이며 텍스트 분류에 자주 사용된다.
- Classification 모델은 Confusion Matrix와 다양한 평가 지표를 함께 확인해야 한다.
- 데이터가 불균형할 때는 Accuracy만으로 성능을 판단하면 안 된다.