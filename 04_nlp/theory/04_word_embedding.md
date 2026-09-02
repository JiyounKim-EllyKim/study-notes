Word Embedding 개념 정리

1. Word Embedding

Word Embedding은 단어를 의미를 가진 숫자 벡터로 표현하는 방법이다.

Bag of Words나 TF-IDF는 단어의 등장 빈도를 기준으로 텍스트를 표현하지만, Word Embedding은 단어의 의미와 관계를 벡터 공간에 표현한다.

즉, 비슷한 의미를 가진 단어는 벡터 공간에서 가까운 위치에 놓이도록 학습된다.

---

2. Word Embedding이 필요한 이유

Bag of Words와 TF-IDF는 단어를 독립적인 Feature로 다루기 때문에 단어 간 의미적 유사성을 잘 표현하지 못한다.

예를 들어 "강아지"와 "개"는 비슷한 의미를 가지지만, Bag of Words에서는 서로 완전히 다른 단어로 처리된다.

Word Embedding은 단어를 연속적인 숫자 벡터로 표현하여 단어 간 의미적 관계를 반영할 수 있다.

강아지 ↔ 개
자동차 ↔ 차량
좋다 ↔ 훌륭하다

---

3. One-Hot Encoding의 한계

One-Hot Encoding은 각 단어를 Vocabulary 크기만큼의 벡터로 표현하는 방법이다.

예를 들어 Vocabulary가 다음과 같다고 하자.

Vocabulary: 고양이, 강아지, 자동차

각 단어는 다음과 같이 표현할 수 있다.

단어| 벡터
고양이| [1, 0, 0]
강아지| [0, 1, 0]
자동차| [0, 0, 1]

한계

- 단어 수가 많아지면 벡터 차원이 매우 커진다.
- 대부분의 값이 0인 Sparse Vector가 된다.
- 단어 간 의미적 유사성을 표현하지 못한다.
- 모든 단어가 서로 독립적인 것으로 표현된다.

---

4. Sparse Vector와 Dense Vector

Word Embedding은 단어를 Dense Vector로 표현한다.

구분| Sparse Vector| Dense Vector
특징| 대부분의 값이 0| 대부분의 값이 실수값
차원| 매우 큼| 상대적으로 작음
의미 관계| 반영 어려움| 반영 가능
예시| One-Hot, Bag of Words| Word2Vec, GloVe

Dense Vector는 낮은 차원에서도 단어의 의미를 압축해서 표현할 수 있다.

---

5. Distributed Representation

Distributed Representation은 하나의 단어 의미를 여러 차원에 나누어 표현하는 방식이다.

Word Embedding은 단어의 의미를 하나의 위치에만 저장하지 않고, 여러 벡터 차원에 분산해서 표현한다.

고양이 = [0.21, -0.13, 0.55, 0.08, ...]
강아지 = [0.19, -0.10, 0.49, 0.12, ...]
자동차 = [-0.42, 0.67, -0.11, 0.34, ...]

비슷한 의미를 가진 단어는 비슷한 벡터 값을 가지게 된다.

---

6. Word Embedding의 핵심 아이디어

Word Embedding은 주변 단어의 분포를 바탕으로 단어 의미를 학습한다.

비슷한 문맥에서 등장하는 단어는 비슷한 의미를 가진다고 본다.

예를 들어 다음 문장을 보자.

나는 고양이를 키운다.
나는 강아지를 키운다.

"고양이"와 "강아지"는 비슷한 위치와 문맥에서 등장하므로, 의미적으로 가까운 벡터를 가질 수 있다.

---

7. Distributional Hypothesis

Distributional Hypothesis는 비슷한 문맥에서 등장하는 단어는 비슷한 의미를 가진다는 가정이다.

Word Embedding은 이 가정을 기반으로 단어의 의미를 학습한다.

You shall know a word by the company it keeps.

즉, 단어 자체만 보는 것이 아니라 주변에 어떤 단어들이 함께 등장하는지를 이용해 단어 의미를 학습한다.

---

8. Word2Vec

Word2Vec은 단어를 벡터로 표현하는 대표적인 Word Embedding 방법이다.

단어 주변의 문맥 정보를 이용해 단어 벡터를 학습한다.

Word2Vec에는 대표적으로 두 가지 방식이 있다.

방식| 설명
CBOW| 주변 단어로 중심 단어를 예측
Skip-gram| 중심 단어로 주변 단어를 예측

---

9. CBOW

CBOW는 Continuous Bag of Words의 약자이다.

주변 단어들을 보고 가운데 단어를 예측하는 방식이다.

문장: 나는 오늘 학교에 갔다

입력: 나는, 오늘, 갔다
예측: 학교에

특징

- 주변 문맥을 이용해 중심 단어를 예측한다.
- 학습 속도가 빠른 편이다.
- 자주 등장하는 단어 학습에 유리할 수 있다.

---

10. Skip-gram

Skip-gram은 중심 단어를 보고 주변 단어를 예측하는 방식이다.

문장: 나는 오늘 학교에 갔다

입력: 학교에
예측: 나는, 오늘, 갔다

특징

- 중심 단어를 기준으로 주변 단어를 예측한다.
- 드문 단어의 표현을 학습하는 데 유리할 수 있다.
- CBOW보다 학습 비용이 더 클 수 있다.

---

11. CBOW와 Skip-gram 비교

구분| CBOW| Skip-gram
입력| 주변 단어| 중심 단어
예측 대상| 중심 단어| 주변 단어
학습 속도| 빠른 편| 상대적으로 느릴 수 있음
특징| 자주 등장하는 단어에 유리| 드문 단어 학습에 유리할 수 있음

---

12. Window Size

Window Size는 중심 단어를 기준으로 주변 단어를 얼마나 볼지 결정하는 범위이다.

예를 들어 Window Size가 2라면 중심 단어의 앞뒤 2개 단어를 문맥으로 사용한다.

문장: 나는 오늘 학교에 갔다

중심 단어: 학교에
Window Size = 2
주변 단어: 나는, 오늘, 갔다

Window Size가 크면 넓은 문맥을 보고, 작으면 가까운 문맥을 중심으로 학습한다.

---

13. GloVe

GloVe는 Global Vectors for Word Representation의 약자이다.

Word2Vec이 주변 문맥을 이용해 단어 벡터를 학습한다면, GloVe는 전체 말뭉치에서 단어들이 함께 등장하는 통계 정보를 활용한다.

즉, 단어 간 동시 등장 빈도를 바탕으로 단어 벡터를 학습한다.

특징

- 전체 Corpus의 통계 정보를 활용한다.
- 단어 간 관계를 벡터 공간에 표현할 수 있다.
- Word2Vec과 함께 전통적인 Word Embedding의 대표 방법이다.

---

14. FastText

FastText는 단어를 문자 n-gram 단위로 나누어 학습하는 Word Embedding 방법이다.

Word2Vec은 단어 하나를 하나의 단위로 보지만, FastText는 단어 내부의 문자 조각까지 활용한다.

playing
→ pla, lay, ayi, yin, ing

특징

- 단어 내부 구조를 반영할 수 있다.
- OOV 문제를 완화할 수 있다.
- 신조어, 오타, 형태 변화가 많은 언어에서 유용할 수 있다.
- 한국어처럼 어미와 조사가 붙는 언어에서도 도움이 될 수 있다.

---

15. Word2Vec, GloVe, FastText 비교

방법| 핵심 아이디어| 특징
Word2Vec| 주변 단어 예측| 문맥 기반 단어 벡터 학습
GloVe| 단어 동시 등장 통계| 전체 Corpus의 통계 정보 활용
FastText| 문자 n-gram 활용| OOV와 형태 변화에 상대적으로 강함

---

16. 단어 간 의미 관계

Word Embedding은 단어 간 의미 관계를 벡터 연산으로 표현할 수 있다.

대표적인 예시는 다음과 같다.

king - man + woman ≈ queen

이 예시는 단어 벡터가 성별, 역할, 의미 관계 등을 어느 정도 반영할 수 있음을 보여준다.

다만 모든 의미 관계가 항상 명확하게 벡터 연산으로 표현되는 것은 아니다.

---

17. Similarity 계산

단어 벡터 간 유사도는 주로 Cosine Similarity로 계산한다.

Cosine Similarity는 두 벡터의 방향이 얼마나 비슷한지를 나타낸다.

값| 의미
1에 가까움| 매우 유사
0에 가까움| 관련성이 낮음
-1에 가까움| 반대 방향

단어 의미가 비슷하면 벡터 방향도 비슷해질 수 있다.

---

18. Embedding Layer

딥러닝 모델에서는 Embedding Layer를 사용해 단어 ID를 Dense Vector로 변환한다.

Token
→ Integer Encoding
→ Embedding Layer
→ Word Vector

예를 들어 "고양이"라는 단어가 정수 ID "15"로 변환되었다면, Embedding Layer는 15번에 해당하는 벡터를 가져온다.

Embedding Layer의 가중치는 학습 과정에서 업데이트될 수 있다.

---

19. Pre-trained Embedding

Pre-trained Embedding은 대규모 텍스트 데이터로 미리 학습된 Word Embedding이다.

직접 Embedding을 처음부터 학습하지 않고, 이미 학습된 벡터를 가져와 사용할 수 있다.

장점

- 적은 데이터에서도 의미 정보를 활용할 수 있다.
- 학습 시간을 줄일 수 있다.
- 일반적인 단어 의미를 미리 반영할 수 있다.

주의할 점

- 학습된 도메인과 실제 데이터 도메인이 다르면 효과가 제한적일 수 있다.
- 최신 신조어나 특정 전문 용어는 잘 반영되지 않을 수 있다.
- 한국어 데이터에서는 사용하는 형태소 분석 방식과 Embedding Vocabulary가 맞는지 확인해야 한다.

---

20. Static Embedding

Word2Vec, GloVe, FastText 같은 전통적인 Word Embedding은 Static Embedding에 해당한다.

Static Embedding은 하나의 단어가 항상 같은 벡터를 가진다.

예를 들어 "배"라는 단어가 과일을 의미하든, 사람의 신체 부위를 의미하든 같은 벡터로 표현된다.

배를 먹었다.
배가 아프다.

문맥에 따라 의미가 달라지는 단어를 구분하기 어렵다는 한계가 있다.

---

21. Contextual Embedding

Contextual Embedding은 문맥에 따라 같은 단어도 다른 벡터로 표현하는 방법이다.

BERT, GPT 같은 Transformer 기반 모델은 문맥을 반영한 Embedding을 만든다.

배를 먹었다. → 과일 의미
배가 아프다. → 신체 부위 의미

같은 "배"라는 단어라도 문장 안에서의 의미에 따라 다른 표현을 가질 수 있다.

---

22. Static Embedding과 Contextual Embedding 비교

구분| Static Embedding| Contextual Embedding
대표 방법| Word2Vec, GloVe, FastText| BERT, GPT
단어 벡터| 단어마다 고정| 문맥에 따라 달라짐
다의어 처리| 어려움| 상대적으로 강함
계산 비용| 낮음| 높음
문맥 반영| 제한적| 가능

---

23. Word Embedding 활용 분야

Word Embedding은 다양한 NLP 작업에 사용된다.

활용 분야| 설명
텍스트 분류| 문서나 문장을 벡터로 변환해 분류
감성 분석| 리뷰의 긍정/부정 판단
유사 단어 탐색| 의미가 비슷한 단어 검색
추천 시스템| 아이템이나 사용자 표현 학습
검색| 쿼리와 문서 간 의미 유사도 계산
문장 임베딩| 문장 전체 의미 표현의 기반

---

24. Word Embedding의 장점

Word Embedding은 전통적인 빈도 기반 표현보다 의미 정보를 더 잘 반영할 수 있다.

장점

- 단어 간 의미적 유사성을 표현할 수 있다.
- Sparse Vector보다 낮은 차원으로 표현할 수 있다.
- 딥러닝 모델의 입력으로 사용하기 좋다.
- 단어 간 관계를 벡터 공간에서 계산할 수 있다.
- Pre-trained Embedding을 활용하면 적은 데이터에서도 도움이 될 수 있다.

---

25. Word Embedding의 한계

Word Embedding에도 한계가 있다.

한계

- 전통적인 Word Embedding은 문맥에 따라 달라지는 의미를 구분하기 어렵다.
- 학습 데이터에 포함된 편향이 Embedding에 반영될 수 있다.
- 도메인이 다르면 단어 의미가 적절히 반영되지 않을 수 있다.
- OOV 문제가 발생할 수 있다.
- 벡터 차원의 의미를 직접 해석하기 어렵다.

---

26. Word Embedding 사용 시 주의할 점

- 데이터 도메인에 맞는 Embedding을 사용하는 것이 중요하다.
- 한국어에서는 토큰화 방식과 Embedding Vocabulary가 잘 맞아야 한다.
- OOV 단어가 많은지 확인해야 한다.
- Pre-trained Embedding을 사용할 때는 도메인 차이를 고려해야 한다.
- 문맥 의미가 중요한 문제에서는 Contextual Embedding이나 Transformer 기반 모델을 고려할 수 있다.
- Embedding 결과가 항상 인과관계나 정확한 의미 관계를 나타내는 것은 아니다.

---

27. 정리

- Word Embedding은 단어를 의미를 가진 Dense Vector로 표현하는 방법이다.
- Bag of Words와 TF-IDF는 단어 빈도 기반 표현이고, Word Embedding은 의미 기반 표현이다.
- One-Hot Encoding은 단어 간 의미적 유사성을 표현하기 어렵다.
- Word Embedding은 비슷한 문맥에서 등장하는 단어가 비슷한 벡터를 갖도록 학습한다.
- Word2Vec은 대표적인 Word Embedding 방법이며, CBOW와 Skip-gram 방식이 있다.
- CBOW는 주변 단어로 중심 단어를 예측한다.
- Skip-gram은 중심 단어로 주변 단어를 예측한다.
- GloVe는 단어 동시 등장 통계를 활용한다.
- FastText는 문자 n-gram을 활용하여 OOV 문제를 완화할 수 있다.
- Static Embedding은 단어마다 고정된 벡터를 사용한다.
- Contextual Embedding은 문맥에 따라 단어 벡터가 달라진다.
- Word Embedding은 텍스트 분류, 감성 분석, 검색, 추천 등에 활용된다.