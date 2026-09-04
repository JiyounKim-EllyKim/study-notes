Text Classification 개념 정리

1. Text Classification

Text Classification은 텍스트 데이터를 정해진 클래스나 카테고리로 분류하는 NLP 작업이다.

한국어로는 텍스트 분류라고 한다.

예를 들어 이메일이 스팸인지 아닌지 분류하거나, 뉴스 기사를 정치, 경제, 스포츠 같은 카테고리로 나누는 작업이 Text Classification에 해당한다.

---

2. Text Classification 예시

텍스트 분류는 다양한 문제에 활용된다.

작업| 예시
스팸 분류| 이메일을 스팸 / 정상으로 분류
감성 분석| 리뷰를 긍정 / 부정 / 중립으로 분류
뉴스 분류| 기사를 정치 / 경제 / 사회 / 스포츠로 분류
문의 분류| 고객 문의를 환불 / 배송 / 결제 등으로 분류
악성 댓글 탐지| 댓글을 정상 / 악성으로 분류
문서 분류| 문서를 주제별로 분류

---

3. Text Classification의 기본 흐름

텍스트 분류는 보통 다음 순서로 진행된다.

Raw Text
→ Text Preprocessing
→ Tokenization
→ Vectorization / Embedding
→ Classification Model
→ Prediction

모델은 텍스트에서 추출한 Feature를 바탕으로 각 문서가 어떤 클래스에 속하는지 예측한다.

---

4. Text Classification의 유형

Text Classification은 클래스 개수와 예측 방식에 따라 나눌 수 있다.

유형| 설명| 예시
Binary Classification| 두 클래스 중 하나를 예측| 스팸 / 정상
Multi-class Classification| 여러 클래스 중 하나를 예측| 뉴스 카테고리 분류
Multi-label Classification| 하나의 문서가 여러 라벨을 가질 수 있음| 영화 장르 분류

---

5. Binary Text Classification

Binary Text Classification은 텍스트를 두 개의 클래스 중 하나로 분류하는 문제이다.

예시

- 스팸 메일 여부
- 리뷰 긍정 / 부정
- 악성 댓글 여부
- 고객 이탈 가능 문의 여부

이진 분류에서는 보통 클래스 1에 속할 확률을 예측하고, Threshold를 기준으로 최종 클래스를 결정한다.

예측 확률 >= 0.5 → Positive
예측 확률 < 0.5 → Negative

---

6. Multi-class Text Classification

Multi-class Text Classification은 여러 클래스 중 하나를 예측하는 문제이다.

예시

- 뉴스 기사 카테고리 분류
- 고객 문의 유형 분류
- 상품 리뷰 주제 분류
- 문서 주제 분류

다중 분류에서는 각 클래스에 대한 확률을 계산하고, 가장 높은 확률을 가진 클래스를 최종 예측값으로 선택한다.

---

7. Multi-label Text Classification

Multi-label Text Classification은 하나의 텍스트가 여러 라벨을 동시에 가질 수 있는 문제이다.

예를 들어 하나의 고객 문의가 "배송", "환불", "불만" 라벨을 동시에 가질 수 있다.

문서| 가능한 라벨
영화 리뷰| 액션, 코미디, 가족
고객 문의| 배송, 환불, 결제
뉴스 기사| 경제, 국제, 정치

Multi-class Classification은 여러 클래스 중 하나만 선택하지만, Multi-label Classification은 여러 개의 라벨을 동시에 선택할 수 있다.

---

8. Text Feature Representation

텍스트 분류를 수행하려면 텍스트를 숫자 형태로 변환해야 한다.

대표적인 표현 방식은 다음과 같다.

표현 방식| 설명
Bag of Words| 단어 등장 횟수 기반 표현
TF-IDF| 단어 빈도와 중요도 기반 표현
Word Embedding| 단어 의미를 벡터로 표현
Sentence Embedding| 문장 전체 의미를 벡터로 표현
Transformer Embedding| 문맥을 반영한 벡터 표현

---

9. Bag of Words 기반 분류

Bag of Words는 문서에 어떤 단어가 얼마나 등장했는지를 기준으로 텍스트를 표현한다.

텍스트
→ 단어 빈도 벡터
→ 분류 모델

특징

- 구현이 단순하다.
- 결과 해석이 비교적 쉽다.
- 단어 순서와 문맥은 반영하기 어렵다.
- 전통적인 머신러닝 모델과 함께 사용하기 좋다.

---

10. TF-IDF 기반 분류

TF-IDF는 특정 문서에서 자주 등장하면서 전체 문서에서는 흔하지 않은 단어에 높은 가중치를 주는 방식이다.

텍스트 분류에서는 Bag of Words보다 TF-IDF가 더 좋은 성능을 보이는 경우가 많다.

텍스트
→ TF-IDF 벡터
→ Logistic Regression / SVM / Naive Bayes
→ 분류 결과

특징

- 문서 구분에 중요한 단어를 강조할 수 있다.
- 전통적인 문서 분류에서 자주 사용된다.
- 단어 순서와 문맥은 제한적으로만 반영된다.

---

11. Embedding 기반 분류

Embedding 기반 분류는 단어 또는 문장을 Dense Vector로 변환한 뒤 분류 모델에 입력하는 방식이다.

Word2Vec, FastText, BERT Embedding, Sentence-BERT 등을 사용할 수 있다.

특징

- 단어 간 의미적 유사성을 반영할 수 있다.
- Sparse Vector보다 낮은 차원으로 표현할 수 있다.
- 문맥을 반영한 Embedding을 사용하면 더 풍부한 의미 표현이 가능하다.
- 모델과 데이터에 따라 계산 비용이 커질 수 있다.

---

12. 전통적인 Text Classification 모델

전통적인 텍스트 분류에서는 TF-IDF와 머신러닝 모델을 함께 사용하는 경우가 많다.

대표적인 모델은 다음과 같다.

모델| 특징
Logistic Regression| 기본적인 선형 분류 모델
Naive Bayes| 빠르고 텍스트 분류에 자주 사용
SVM| 고차원 Sparse Feature에 강한 편
Random Forest| 비선형 관계 학습 가능
Gradient Boosting| 정형 Feature와 결합할 때 유용

---

13. Naive Bayes

Naive Bayes는 베이즈 정리를 기반으로 한 확률적 분류 모델이다.

각 단어가 서로 독립이라고 가정하고, 문서가 특정 클래스에 속할 확률을 계산한다.

특징

- 학습과 예측이 빠르다.
- 텍스트 분류에서 기본 모델로 자주 사용된다.
- 데이터가 많지 않아도 비교적 잘 작동할 수 있다.
- 단어 간 독립 가정이 현실과 다를 수 있다.

활용 예시

- 스팸 메일 분류
- 뉴스 카테고리 분류
- 감성 분석

---

14. Logistic Regression

Logistic Regression은 텍스트 분류에서 많이 사용하는 기본 선형 모델이다.

TF-IDF 벡터를 입력으로 받아 특정 클래스에 속할 확률을 예측할 수 있다.

특징

- 구현이 쉽다.
- 성능이 안정적인 편이다.
- 모델 해석이 비교적 쉽다.
- 텍스트 분류의 기본 baseline 모델로 사용하기 좋다.

---

15. SVM

SVM은 클래스를 잘 나누는 결정 경계를 찾는 분류 모델이다.

TF-IDF처럼 차원이 높은 Sparse Feature와 함께 사용할 때 좋은 성능을 보이는 경우가 많다.

특징

- 고차원 텍스트 Feature에 강한 편이다.
- 작은 데이터셋에서도 성능이 좋은 경우가 있다.
- 학습 데이터가 많아지면 시간이 오래 걸릴 수 있다.
- 확률 출력이 필요한 경우 추가 설정이 필요할 수 있다.

---

16. Deep Learning 기반 Text Classification

딥러닝 기반 텍스트 분류는 Embedding과 신경망을 이용해 문장의 패턴과 의미를 학습한다.

대표적인 모델은 다음과 같다.

모델| 특징
CNN for Text| 주변 단어 패턴을 추출
RNN / LSTM| 단어 순서와 문맥 흐름 반영
Transformer| Attention 기반 문맥 이해
BERT| 문장 이해 기반 분류에 강함

---

17. CNN for Text Classification

CNN은 이미지 처리에서 많이 사용되지만, 텍스트 분류에도 사용할 수 있다.

텍스트에서 연속된 단어 패턴을 필터로 추출하여 분류에 활용한다.

단어 Embedding
→ Convolution
→ Pooling
→ Fully Connected Layer
→ Classification

특징

- 특정 단어 조합이나 문구 패턴을 잘 포착할 수 있다.
- 학습 속도가 RNN보다 빠를 수 있다.
- 긴 문맥 전체를 이해하는 데는 한계가 있을 수 있다.

---

18. RNN / LSTM for Text Classification

RNN과 LSTM은 문장을 순서대로 읽으면서 문맥 정보를 학습한다.

문장 안에서 앞뒤 순서가 중요한 경우 사용할 수 있다.

특징

- 단어 순서를 반영할 수 있다.
- LSTM은 RNN보다 긴 문맥을 더 잘 유지할 수 있다.
- 긴 문장에서는 학습 시간이 길어질 수 있다.
- 병렬 연산이 어렵다는 한계가 있다.

---

19. Transformer 기반 Text Classification

Transformer 기반 모델은 Attention을 이용해 문장 안의 단어 간 관계를 학습한다.

BERT 같은 모델은 문장 이해에 강하기 때문에 텍스트 분류 작업에서 많이 사용된다.

Text
→ Tokenizer
→ Pre-trained Transformer
→ Classification Head
→ Class Prediction

특징

- 문맥을 잘 반영할 수 있다.
- Pre-trained Model을 활용할 수 있다.
- 적은 데이터에서도 Fine-tuning을 통해 좋은 성능을 기대할 수 있다.
- 모델 크기가 커서 학습과 추론 비용이 높을 수 있다.

---

20. Baseline Model

Baseline Model은 본격적인 모델 개선 전에 기준 성능을 확인하기 위해 만드는 단순한 모델이다.

텍스트 분류에서는 보통 다음 조합을 baseline으로 사용할 수 있다.

TF-IDF + Logistic Regression
TF-IDF + Naive Bayes
TF-IDF + Linear SVM

Baseline을 먼저 만들면 이후 복잡한 모델을 사용할 때 실제로 성능이 개선되었는지 비교할 수 있다.

---

21. Text Classification 평가 지표

Text Classification은 분류 문제이므로 일반적인 Classification 평가 지표를 사용한다.

지표| 설명
Accuracy| 전체 데이터 중 맞게 예측한 비율
Precision| Positive로 예측한 것 중 실제 Positive 비율
Recall| 실제 Positive 중 모델이 맞게 찾은 비율
F1-score| Precision과 Recall의 조화 평균
ROC-AUC| Threshold 변화에 따른 분류 성능

클래스 불균형이 있는 경우 Accuracy만으로 성능을 판단하면 안 된다.

---

22. Confusion Matrix

Confusion Matrix는 실제 클래스와 예측 클래스를 비교한 표이다.

구분| 실제 Positive| 실제 Negative
예측 Positive| TP| FP
예측 Negative| FN| TN

텍스트 분류에서는 어떤 클래스에서 오분류가 많이 발생하는지 확인하는 데 유용하다.

예를 들어 고객 문의 분류에서 "배송 문의"와 "환불 문의"가 자주 헷갈리는지 확인할 수 있다.

---

23. Class Imbalance

Class Imbalance는 클래스별 데이터 수가 크게 차이 나는 상황이다.

예를 들어 악성 댓글 탐지에서 정상 댓글이 95%, 악성 댓글이 5%라면 데이터가 불균형하다고 볼 수 있다.

문제점

- 모델이 많은 클래스만 예측해도 Accuracy가 높게 나올 수 있다.
- 적은 클래스의 Recall이 낮아질 수 있다.
- 실제로 중요한 클래스를 놓칠 수 있다.

해결 방법

- 데이터 수집 보강
- Oversampling
- Undersampling
- Class Weight 조정
- Threshold 조정
- F1-score, Recall, PR-AUC 등 적절한 지표 사용

---

24. Threshold 조정

이진 분류에서는 예측 확률을 기준으로 클래스를 결정한다.

기본 Threshold는 보통 0.5를 사용하지만, 문제 상황에 따라 조정할 수 있다.

Threshold 낮춤 → Positive를 더 많이 예측 → Recall 증가 가능
Threshold 높임 → 확실한 경우만 Positive 예측 → Precision 증가 가능

예를 들어 악성 댓글 탐지에서는 악성 댓글을 놓치지 않는 것이 중요하다면 Recall을 높이는 방향으로 Threshold를 조정할 수 있다.

---

25. Error Analysis

Error Analysis는 모델이 틀린 예측을 직접 살펴보며 오류 원인을 분석하는 과정이다.

텍스트 분류에서는 단순히 점수만 보는 것보다 어떤 문장에서 틀렸는지 확인하는 것이 중요하다.

확인할 점

- 특정 클래스에서 오분류가 많은가?
- 짧은 문장에서 성능이 낮은가?
- 부정 표현을 잘못 해석하는가?
- 신조어나 줄임말을 처리하지 못하는가?
- 특정 도메인 용어를 이해하지 못하는가?
- 라벨 자체가 모호하거나 잘못 붙어 있지 않은가?

Error Analysis를 통해 전처리, 라벨링, 모델 구조, 데이터 보강 방향을 정할 수 있다.

---

26. Data Leakage 주의

텍스트 분류에서도 Data Leakage를 주의해야 한다.

Validation Data나 Test Data의 정보를 학습 과정에서 미리 사용하면 평가 성능이 실제보다 높게 나올 수 있다.

예시

- 전체 데이터로 TF-IDF Vectorizer를 학습한 경우
- Test Data에만 등장한 단어가 Vocabulary에 포함된 경우
- Target을 직접적으로 암시하는 문구가 Feature에 포함된 경우
- 중복 문서가 Train과 Test에 동시에 들어간 경우
- 같은 사용자의 거의 동일한 문서가 Train과 Test에 나뉘어 들어간 경우

---

27. Train 기준 전처리와 Vectorizer 학습

텍스트 분류에서는 전처리 기준과 Vectorizer를 Train Data 기준으로 학습해야 한다.

Train Data로 Tokenizer / Vectorizer 학습
→ Train Data 변환
→ 같은 기준으로 Validation/Test Data 변환

Test Data는 실제 예측 상황에서 새로 들어오는 데이터라고 생각해야 한다.

---

28. Text Classification 프로젝트 흐름

텍스트 분류 프로젝트는 보통 다음 순서로 진행된다.

1. 문제 정의
2. 라벨 기준 정의
3. 데이터 수집
4. 데이터 탐색
5. 텍스트 전처리
6. Train / Validation / Test 분리
7. Tokenization
8. Vectorization 또는 Embedding 생성
9. Baseline Model 학습
10. 모델 평가
11. Error Analysis
12. 모델 개선
13. 최종 Test 평가
14. 결과 해석 및 활용

---

29. Text Classification 사용 시 주의할 점

- 라벨 기준이 명확해야 한다.
- 텍스트 전처리로 중요한 의미가 사라지지 않도록 해야 한다.
- 부정어, 이모지, 반복 표현은 작업에 따라 중요할 수 있다.
- 클래스 불균형 여부를 확인해야 한다.
- Train/Test 분리 전에 중복 문서를 확인해야 한다.
- Vectorizer는 Train Data 기준으로만 학습해야 한다.
- Accuracy만으로 성능을 판단하지 않아야 한다.
- 모델이 틀린 문장을 직접 확인하며 Error Analysis를 해야 한다.

---

30. 정리

- Text Classification은 텍스트를 정해진 클래스나 카테고리로 분류하는 NLP 작업이다.
- 대표적인 예시로 스팸 분류, 감성 분석, 뉴스 분류, 문의 유형 분류가 있다.
- 텍스트 분류는 Binary, Multi-class, Multi-label 문제로 나눌 수 있다.
- 텍스트는 Bag of Words, TF-IDF, Embedding 등으로 숫자 벡터로 변환해야 한다.
- 전통적인 텍스트 분류에서는 TF-IDF와 Logistic Regression, Naive Bayes, SVM을 자주 사용한다.
- 딥러닝 기반 텍스트 분류에서는 CNN, RNN, LSTM, Transformer를 사용할 수 있다.
- Transformer 기반 모델은 문맥을 잘 반영할 수 있지만 계산 비용이 클 수 있다.
- Baseline Model을 먼저 만들어 기준 성능을 확인하는 것이 좋다.
- 클래스 불균형이 있으면 Accuracy보다 Precision, Recall, F1-score 등을 함께 확인해야 한다.
- Text Classification에서는 Data Leakage와 중복 문서에 특히 주의해야 한다.
- Error Analysis를 통해 모델이 어떤 문장을 왜 틀렸는지 확인해야 한다.