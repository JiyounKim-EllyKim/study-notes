NLP Evaluation 개념 정리

1. NLP Evaluation

NLP Evaluation은 자연어 처리 모델의 성능을 평가하는 과정이다.

NLP 작업은 텍스트 분류, 감성 분석, 개체명 인식, 번역, 요약, 검색, 생성 등 다양하기 때문에 작업 유형에 맞는 평가 지표를 선택해야 한다.

하나의 지표만으로 모든 NLP 모델을 평가하기는 어렵다.

---

2. NLP Evaluation이 필요한 이유

모델이 실제 문제를 잘 해결하는지 확인하려면 적절한 평가가 필요하다.

예를 들어 텍스트 분류 모델은 정답 라벨을 얼마나 잘 맞추는지가 중요하고, 번역 모델은 생성된 문장이 원문 의미를 얼마나 잘 전달하는지가 중요하다.

평가가 필요한 이유

- 모델 성능 확인
- 여러 모델 비교
- 하이퍼파라미터 튜닝
- 오류 유형 분석
- 실제 서비스 적용 가능성 판단
- 모델 개선 방향 도출

---

3. 작업별 대표 평가 지표

NLP 작업별로 자주 사용하는 평가 지표는 다음과 같다.

작업| 대표 평가 지표
Text Classification| Accuracy, Precision, Recall, F1-score
Sentiment Analysis| Accuracy, Precision, Recall, F1-score
Named Entity Recognition| Precision, Recall, F1-score
Machine Translation| BLEU
Text Summarization| ROUGE
Information Retrieval| Precision@K, Recall@K, MRR, NDCG
Language Modeling| Perplexity
Text Generation| Human Evaluation, BLEU, ROUGE 등

---

4. Classification 평가 지표

Text Classification과 Sentiment Analysis는 분류 문제이므로 일반적인 Classification 지표를 사용한다.

대표적인 지표는 다음과 같다.

지표| 설명
Accuracy| 전체 데이터 중 맞게 예측한 비율
Precision| Positive로 예측한 것 중 실제 Positive 비율
Recall| 실제 Positive 중 모델이 맞게 찾은 비율
F1-score| Precision과 Recall의 조화 평균

---

5. Accuracy

Accuracy는 전체 데이터 중 모델이 맞게 예측한 비율이다.

$$
Accuracy = \frac{TP + TN}{TP + TN + FP + FN}
$$

특징

- 가장 직관적인 분류 평가 지표이다.
- 클래스 비율이 균형 잡혀 있을 때 유용하다.
- 클래스 불균형이 심한 경우 성능을 왜곡해서 볼 수 있다.

예를 들어 긍정 리뷰가 95%, 부정 리뷰가 5%인 데이터에서 모든 리뷰를 긍정으로 예측하면 Accuracy는 높게 나올 수 있다.

---

6. Precision

Precision은 모델이 Positive라고 예측한 것 중 실제 Positive인 비율이다.

$$
Precision = \frac{TP}{TP + FP}
$$

특징

- Positive 예측의 정확도를 나타낸다.
- False Positive를 줄이는 것이 중요할 때 사용한다.
- 스팸 탐지, 악성 댓글 탐지 등에서 중요할 수 있다.

---

7. Recall

Recall은 실제 Positive 중 모델이 Positive로 맞게 찾은 비율이다.

$$
Recall = \frac{TP}{TP + FN}
$$

특징

- 실제 Positive를 얼마나 놓치지 않고 찾았는지 나타낸다.
- False Negative를 줄이는 것이 중요할 때 사용한다.
- 위험 탐지, 불만 탐지, 이상 탐지 등에서 중요할 수 있다.

---

8. F1-score

F1-score는 Precision과 Recall의 조화 평균이다.

$$
F1 = 2 \times \frac{Precision \times Recall}{Precision + Recall}
$$

특징

- Precision과 Recall의 균형을 함께 본다.
- 클래스 불균형 데이터에서 자주 사용된다.
- Precision과 Recall 중 하나만 높고 다른 하나가 낮으면 F1-score도 낮아진다.

---

9. Confusion Matrix

Confusion Matrix는 실제 라벨과 예측 라벨을 비교하여 정리한 표이다.

구분| 실제 Positive| 실제 Negative
예측 Positive| TP| FP
예측 Negative| FN| TN

Confusion Matrix를 보면 모델이 어떤 클래스를 자주 헷갈리는지 확인할 수 있다.

텍스트 분류에서는 특정 카테고리끼리 오분류가 많이 발생하는지 확인하는 데 유용하다.

---

10. Macro / Micro / Weighted Average

다중 분류 문제에서는 클래스별 Precision, Recall, F1-score를 평균내는 방식이 필요하다.

평균 방식| 설명
Macro Average| 클래스별 지표를 단순 평균
Micro Average| 전체 TP, FP, FN을 합산하여 계산
Weighted Average| 클래스별 데이터 수를 가중치로 반영

클래스 불균형이 있는 경우 Macro Average와 Weighted Average를 함께 확인하는 것이 좋다.

---

11. Sequence Labeling 평가

Sequence Labeling은 각 토큰마다 라벨을 예측하는 작업이다.

대표적인 작업은 Named Entity Recognition, POS Tagging, Slot Filling 등이 있다.

Sequence Labeling에서는 주로 Precision, Recall, F1-score를 사용한다.

---

12. NER 평가

NER은 문장에서 사람, 장소, 기관, 날짜 같은 개체명을 추출하는 작업이다.

NER에서는 단순히 토큰 하나를 맞추는 것뿐만 아니라, 개체명의 시작과 끝을 정확히 맞추는 것이 중요하다.

정답: 서울 대학교 / ORG
예측: 서울 / ORG

위 경우 일부 토큰은 맞췄지만, 전체 개체명 경계를 정확히 맞춘 것은 아니다.

---

13. NER 평가 시 주의할 점

NER에서는 "O" 라벨이 대부분을 차지하는 경우가 많다.

이때 전체 Token Accuracy만 보면 성능이 높아 보일 수 있다.

대부분의 토큰이 O 라벨
→ 모두 O로 예측해도 Accuracy가 높게 나올 수 있음

따라서 NER에서는 "O" 라벨을 제외한 Precision, Recall, F1-score를 함께 확인하는 것이 중요하다.

---

14. Machine Translation 평가

Machine Translation은 한 언어의 문장을 다른 언어로 번역하는 작업이다.

번역 결과는 하나의 정답만 있는 것이 아니기 때문에 평가가 어렵다.

대표적인 자동 평가 지표로 BLEU를 사용한다.

---

15. BLEU

BLEU는 Bilingual Evaluation Understudy의 약자로, 기계 번역 결과와 정답 번역문이 얼마나 비슷한지 평가하는 지표이다.

BLEU는 주로 n-gram이 얼마나 겹치는지를 기준으로 계산한다.

특징

- 번역 모델 평가에 많이 사용된다.
- 여러 단어 조합이 정답 문장과 얼마나 겹치는지 본다.
- 값이 높을수록 정답 번역문과 유사하다.
- 문장의 의미나 자연스러움을 완벽하게 평가하지는 못한다.

---

16. BLEU의 한계

BLEU는 자동 평가에 유용하지만 한계가 있다.

한계

- 같은 의미의 다른 표현을 낮게 평가할 수 있다.
- 문장의 자연스러움을 충분히 반영하지 못한다.
- 문맥 전체의 의미 보존 여부를 완벽히 판단하기 어렵다.
- 정답 번역문이 하나뿐이면 평가가 제한적일 수 있다.

따라서 번역 품질 평가는 BLEU뿐만 아니라 사람 평가를 함께 사용하는 것이 좋다.

---

17. Text Summarization 평가

Text Summarization은 긴 문서를 짧게 요약하는 작업이다.

요약 결과는 원문의 핵심 내용을 잘 포함해야 하고, 문장도 자연스러워야 한다.

대표적인 자동 평가 지표로 ROUGE를 사용한다.

---

18. ROUGE

ROUGE는 Recall-Oriented Understudy for Gisting Evaluation의 약자로, 생성된 요약문과 정답 요약문이 얼마나 겹치는지 평가하는 지표이다.

대표적인 ROUGE 지표는 다음과 같다.

지표| 설명
ROUGE-1| 단어 단위 겹침
ROUGE-2| 2-gram 단위 겹침
ROUGE-L| 가장 긴 공통 부분 수열 기반 평가

특징

- 요약 모델 평가에 자주 사용된다.
- 정답 요약문과 생성 요약문 사이의 겹침을 본다.
- 핵심 단어가 얼마나 포함되었는지 확인할 수 있다.
- 의미적 유사성이나 문장 자연스러움을 완벽하게 평가하지는 못한다.

---

19. ROUGE의 한계

ROUGE는 단어 겹침을 기준으로 하기 때문에 의미가 같아도 표현이 다르면 낮게 나올 수 있다.

정답: 매출이 증가했다
예측: 수익이 늘었다

두 문장은 비슷한 의미를 가지지만, 단어가 다르면 ROUGE 점수는 낮게 나올 수 있다.

따라서 요약 평가에서도 자동 지표와 사람 평가를 함께 고려하는 것이 좋다.

---

20. Information Retrieval 평가

Information Retrieval은 사용자의 질의에 대해 관련 있는 문서나 정보를 찾아주는 작업이다.

검색 시스템에서는 정답을 하나만 맞추는 것보다, 관련 문서를 상위에 잘 배치하는 것이 중요하다.

대표적인 평가 지표는 다음과 같다.

지표| 설명
Precision@K| 상위 K개 결과 중 관련 문서 비율
Recall@K| 전체 관련 문서 중 상위 K개에 포함된 비율
MRR| 정답 문서가 처음 등장한 순위의 역수 평균
NDCG| 관련도와 순위를 함께 고려한 지표

---

21. Precision@K

Precision@K는 검색 결과 상위 K개 중 관련 있는 문서의 비율이다.

상위 5개 결과 중 관련 문서 3개
→ Precision@5 = 3 / 5 = 0.6

사용자가 상위 몇 개 결과만 확인하는 검색 서비스에서 유용하다.

---

22. Recall@K

Recall@K는 전체 관련 문서 중 상위 K개 결과 안에 포함된 문서의 비율이다.

전체 관련 문서 10개
상위 5개 안에 관련 문서 3개
→ Recall@5 = 3 / 10 = 0.3

관련 문서를 놓치지 않는 것이 중요한 검색 문제에서 유용하다.

---

23. MRR

MRR은 Mean Reciprocal Rank의 약자로, 정답 문서가 처음 등장한 순위를 기준으로 평가하는 지표이다.

정답이 높은 순위에 나올수록 값이 커진다.

정답 문서가 1위 → 1 / 1 = 1.0
정답 문서가 2위 → 1 / 2 = 0.5
정답 문서가 5위 → 1 / 5 = 0.2

질문에 대한 정답 문서 하나를 빠르게 찾는 검색 시스템에서 사용할 수 있다.

---

24. NDCG

NDCG는 Normalized Discounted Cumulative Gain의 약자로, 검색 결과의 순위와 관련도 점수를 함께 고려하는 지표이다.

관련성이 높은 문서가 상위에 있을수록 높은 점수를 받는다.

특징

- 검색 결과의 순서를 평가할 수 있다.
- 문서별 관련도 수준을 반영할 수 있다.
- 추천 시스템과 검색 시스템에서 자주 사용된다.

---

25. Language Modeling 평가

Language Modeling은 다음 단어나 토큰을 예측하는 작업이다.

언어 모델은 문맥을 보고 다음에 올 단어의 확률을 예측한다.

대표적인 평가 지표로 Perplexity를 사용한다.

---

26. Perplexity

Perplexity는 언어 모델이 다음 토큰을 얼마나 잘 예측하는지 나타내는 지표이다.

낮을수록 모델이 정답 토큰을 더 잘 예측한다는 의미이다.

특징

- 언어 모델 평가에 사용된다.
- 값이 낮을수록 좋다.
- 모델이 문장을 얼마나 덜 헷갈려 하는지 나타낸다고 볼 수 있다.
- 실제 생성 품질과 항상 완전히 일치하지는 않는다.

---

27. Text Generation 평가

Text Generation은 새로운 텍스트를 생성하는 작업이다.

생성 결과는 정답이 하나로 정해지기 어렵기 때문에 평가가 특히 어렵다.

평가 기준

- 문법적으로 자연스러운가?
- 문맥과 일관되는가?
- 사실적으로 정확한가?
- 반복이 적은가?
- 사용자의 의도에 맞는가?
- 유해하거나 부적절한 내용이 없는가?
- 필요한 정보를 충분히 포함하는가?

---

28. Human Evaluation

Human Evaluation은 사람이 직접 모델 출력을 평가하는 방식이다.

자동 지표가 문장의 의미, 자연스러움, 유용성을 완벽하게 평가하기 어렵기 때문에 생성형 NLP에서는 사람 평가가 중요하다.

평가 항목 예시

항목| 설명
Fluency| 문장이 자연스러운지
Coherence| 문맥이 일관적인지
Relevance| 질문이나 주제와 관련 있는지
Factuality| 사실적으로 맞는지
Helpfulness| 사용자에게 도움이 되는지
Safety| 안전하고 부적절하지 않은지

---

29. Automatic Evaluation의 한계

자동 평가 지표는 빠르고 일관되게 계산할 수 있지만, 자연어의 의미를 완벽히 평가하기 어렵다.

한계

- 같은 의미의 다른 표현을 낮게 평가할 수 있다.
- 문장 자연스러움을 충분히 반영하지 못할 수 있다.
- 사실 여부를 직접 검증하기 어렵다.
- 창의적이거나 다양한 답변을 평가하기 어렵다.
- 실제 사용자 만족도와 다를 수 있다.

따라서 NLP 모델 평가는 자동 지표와 정성적 분석을 함께 사용하는 것이 좋다.

---

30. Error Analysis

Error Analysis는 모델이 틀린 예측이나 좋지 않은 출력을 직접 확인하는 과정이다.

점수만 보는 것보다 실제 오류 사례를 확인해야 모델 개선 방향을 찾을 수 있다.

확인할 점

- 어떤 클래스에서 오분류가 많은가?
- 특정 표현을 잘못 해석하는가?
- 부정어, 반어법, 신조어에 약한가?
- 긴 문장에서 성능이 떨어지는가?
- 특정 도메인 용어를 이해하지 못하는가?
- 생성 결과에 사실 오류가 있는가?
- 검색 결과에서 관련 문서가 하위에 밀리는가?

---

31. Data Leakage 주의

NLP 평가에서도 Data Leakage를 주의해야 한다.

Validation Data나 Test Data의 정보가 학습 과정에 들어가면 성능이 실제보다 높게 나올 수 있다.

예시

- 전체 데이터로 Vocabulary나 TF-IDF를 학습한 경우
- 중복 문서가 Train과 Test에 동시에 들어간 경우
- 같은 사용자의 유사 문장이 Train과 Test에 나뉘어 들어간 경우
- Test Data 라벨을 참고해 전처리 기준을 정한 경우
- 미래 정보를 사용해 과거 데이터를 예측한 경우

---

32. 평가 지표 선택 시 주의할 점

- 작업 유형에 맞는 지표를 선택해야 한다.
- 클래스 불균형이 있으면 Accuracy만 사용하지 않는다.
- 생성 작업은 자동 지표만으로 판단하기 어렵다.
- 검색 작업은 상위 결과의 순위와 관련도를 함께 봐야 한다.
- 모델 성능뿐만 아니라 실제 사용 목적에 맞는지도 확인해야 한다.
- 정량 평가와 정성 평가를 함께 수행하는 것이 좋다.

---

33. 정리

- NLP Evaluation은 자연어 처리 모델의 성능을 평가하는 과정이다.
- NLP 작업 유형에 따라 적절한 평가 지표가 달라진다.
- 텍스트 분류와 감성 분석은 Accuracy, Precision, Recall, F1-score를 사용한다.
- 클래스 불균형 데이터에서는 Accuracy만으로 평가하면 안 된다.
- Sequence Labeling과 NER은 토큰 또는 개체명 단위의 Precision, Recall, F1-score를 사용한다.
- 번역 평가는 BLEU, 요약 평가는 ROUGE를 자주 사용한다.
- 검색 평가는 Precision@K, Recall@K, MRR, NDCG 등을 사용할 수 있다.
- 언어 모델 평가는 Perplexity를 사용할 수 있다.
- 생성형 NLP는 자동 지표만으로 평가하기 어렵고 Human Evaluation이 중요하다.
- Error Analysis를 통해 모델이 실제로 어떤 오류를 내는지 확인해야 한다.
- NLP 평가에서는 Data Leakage와 중복 데이터에 주의해야 한다.