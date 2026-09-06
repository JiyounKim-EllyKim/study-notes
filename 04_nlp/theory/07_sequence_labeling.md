Sequence Labeling 개념 정리

1. Sequence Labeling

Sequence Labeling은 문장이나 시퀀스의 각 토큰마다 라벨을 예측하는 NLP 작업이다.

텍스트 전체에 하나의 라벨을 붙이는 Text Classification과 달리, Sequence Labeling은 단어 또는 토큰 단위로 라벨을 부여한다.

문장: 김지윤은 서울에서 공부했다
라벨: 사람    장소

대표적인 Sequence Labeling 작업에는 품사 태깅, 개체명 인식, 청크 분석 등이 있다.

---

2. Sequence Labeling이 필요한 이유

자연어 처리에서는 문장 전체의 의미뿐만 아니라 각 단어의 역할이나 정보를 파악해야 하는 경우가 많다.

예를 들어 문장에서 사람 이름, 장소, 날짜, 기관명을 추출하려면 각 단어가 어떤 의미를 가지는지 라벨링해야 한다.

활용 예시

- 문장에서 사람 이름 추출
- 문장에서 날짜와 시간 추출
- 문장에서 회사명이나 기관명 추출
- 단어별 품사 분석
- 검색어에서 핵심 엔티티 추출
- 챗봇에서 사용자 의도에 필요한 슬롯 추출

---

3. Text Classification과 Sequence Labeling 비교

구분| Text Classification| Sequence Labeling
예측 단위| 문장 또는 문서 전체| 각 토큰
출력 개수| 보통 하나| 토큰 개수만큼
예시| 리뷰 긍정/부정 분류| 단어별 개체명 라벨링
대표 작업| 감성 분석, 문서 분류| NER, POS Tagging

---

4. Sequence Labeling의 기본 흐름

Sequence Labeling은 보통 다음 순서로 진행된다.

Raw Text
→ Text Preprocessing
→ Tokenization
→ Token Embedding
→ Sequence Labeling Model
→ Token-level Label Prediction

입력 문장을 토큰 단위로 나눈 뒤, 각 토큰에 대해 라벨을 예측한다.

---

5. 대표적인 Sequence Labeling 작업

Sequence Labeling에는 여러 작업이 있다.

작업| 설명
POS Tagging| 각 단어의 품사를 예측
Named Entity Recognition| 사람, 장소, 기관 등 개체명 추출
Chunking| 문장에서 구 단위 구조를 찾음
Slot Filling| 대화에서 필요한 정보를 추출
Morpheme Tagging| 형태소 단위로 품사나 문법 정보 태깅

---

6. POS Tagging

POS Tagging은 Part-of-Speech Tagging의 약자로, 각 단어의 품사를 예측하는 작업이다.

한국어로는 품사 태깅이라고 한다.

문장: 나는 학교에 갔다

나    → 대명사
는    → 조사
학교  → 명사
에    → 조사
갔다  → 동사

POS Tagging은 형태소 분석, 구문 분석, 정보 추출 등의 기본 단계로 사용될 수 있다.

---

7. Named Entity Recognition

Named Entity Recognition은 문장에서 특정한 의미를 가진 개체명을 찾고, 그 종류를 분류하는 작업이다.

한국어로는 개체명 인식이라고 한다.

개체명 예시

라벨| 의미| 예시
PERSON| 사람| 김지윤, 홍길동
LOCATION| 장소| 서울, 부산
ORGANIZATION| 기관| 삼성전자, OpenAI
DATE| 날짜| 2026년 9월 6일
TIME| 시간| 오후 3시
MONEY| 금액| 10만원

---

8. NER 예시

문장: 김지윤은 서울에서 OpenAI 관련 프로젝트를 진행했다.

토큰| 라벨
김지윤| PERSON
은| O
서울| LOCATION
에서| O
OpenAI| ORGANIZATION
관련| O
프로젝트| O
를| O
진행했다| O

"O"는 특정 개체명에 해당하지 않는 토큰을 의미한다.

---

9. BIO Tagging

BIO Tagging은 Sequence Labeling에서 자주 사용하는 라벨링 방식이다.

하나의 개체명이 여러 토큰으로 이루어질 수 있기 때문에, 개체명의 시작과 내부를 구분하기 위해 사용한다.

태그| 의미
B| Begin, 개체명의 시작
I| Inside, 개체명의 내부
O| Outside, 개체명이 아님

---

10. BIO Tagging 예시

문장: 서울 대학교에서 연구했다

토큰| BIO Label
서울| B-ORG
대학교| I-ORG
에서| O
연구했다| O

"서울 대학교"처럼 여러 토큰으로 이루어진 개체명을 하나의 기관명으로 인식하기 위해 "B-ORG", "I-ORG"를 사용한다.

---

11. BIOES Tagging

BIOES는 BIO를 더 세분화한 방식이다.

태그| 의미
B| Begin, 개체명의 시작
I| Inside, 개체명의 내부
O| Outside, 개체명이 아님
E| End, 개체명의 끝
S| Single, 하나의 토큰으로 이루어진 개체명

BIO보다 개체명의 경계를 더 명확하게 표현할 수 있다.

---

12. Slot Filling

Slot Filling은 대화 시스템에서 사용자의 발화에서 필요한 정보를 추출하는 작업이다.

예를 들어 음식 주문 챗봇에서 메뉴, 수량, 날짜, 장소 등을 추출할 수 있다.

문장: 내일 강남에서 파스타 예약해줘

토큰| Slot
내일| DATE
강남| LOCATION
파스타| FOOD
예약해줘| O

Slot Filling은 챗봇이나 음성 비서에서 자주 사용된다.

---

13. Sequence Labeling 모델

Sequence Labeling에는 여러 모델을 사용할 수 있다.

모델| 특징
HMM| 확률 기반 전통 모델
CRF| 라벨 간 전이 관계를 고려
RNN / LSTM| 순차 정보를 학습
BiLSTM| 앞뒤 문맥을 함께 활용
BiLSTM-CRF| 문맥 정보와 라벨 전이 관계를 함께 사용
Transformer| Attention 기반으로 문맥을 반영
BERT 기반 모델| 사전학습 언어 모델을 Fine-tuning

---

14. HMM

HMM은 Hidden Markov Model의 약자로, 관측된 단어와 숨겨진 라벨 사이의 확률 관계를 모델링하는 방법이다.

초기 품사 태깅이나 개체명 인식에서 사용되었다.

특징

- 확률 기반 모델이다.
- 이전 상태가 현재 상태에 영향을 준다고 가정한다.
- 구조가 비교적 단순하다.
- 복잡한 문맥을 반영하는 데는 한계가 있다.

---

15. CRF

CRF는 Conditional Random Field의 약자로, 라벨 간의 관계를 고려하는 Sequence Labeling 모델이다.

각 토큰을 독립적으로 예측하는 것이 아니라, 앞뒤 라벨의 연결 관계를 함께 고려한다.

예를 들어 "B-PER" 다음에 "I-PER"가 오는 것은 자연스럽지만, "I-PER"가 문장 처음에 오는 것은 어색할 수 있다.

특징

- 라벨 간 전이 관계를 고려한다.
- Sequence Labeling에서 전통적으로 많이 사용되었다.
- NER, POS Tagging 등에 활용된다.
- Feature 설계가 중요할 수 있다.

---

16. RNN / LSTM 기반 Sequence Labeling

RNN과 LSTM은 문장을 순서대로 읽으며 이전 문맥 정보를 반영할 수 있다.

각 토큰의 은닉 상태를 이용해 해당 토큰의 라벨을 예측한다.

Token Sequence
→ RNN / LSTM
→ Hidden State
→ Token Label

특징

- 단어 순서를 반영할 수 있다.
- LSTM은 RNN보다 긴 문맥을 더 잘 유지할 수 있다.
- 긴 문장에서는 계산 비용이 커질 수 있다.
- 뒤쪽 문맥을 함께 보기 위해 BiLSTM을 자주 사용한다.

---

17. BiLSTM

BiLSTM은 Bidirectional LSTM의 약자로, 문장을 앞에서 뒤로 한 번, 뒤에서 앞으로 한 번 읽는 구조이다.

이를 통해 각 토큰이 앞쪽 문맥과 뒤쪽 문맥을 모두 활용할 수 있다.

Forward LSTM  : 왼쪽 → 오른쪽
Backward LSTM : 오른쪽 → 왼쪽

특징

- 양방향 문맥을 반영할 수 있다.
- Sequence Labeling 작업에서 많이 사용되었다.
- 단방향 LSTM보다 문맥 이해에 유리하다.

---

18. BiLSTM-CRF

BiLSTM-CRF는 BiLSTM과 CRF를 결합한 구조이다.

BiLSTM은 각 토큰의 문맥 정보를 학습하고, CRF는 라벨 간의 자연스러운 연결 관계를 고려한다.

Token
→ Embedding
→ BiLSTM
→ CRF
→ Label Sequence

장점

- 앞뒤 문맥을 함께 반영할 수 있다.
- 라벨 간 전이 관계를 고려할 수 있다.
- NER 같은 Sequence Labeling 작업에서 강력한 성능을 보일 수 있다.

---

19. Transformer 기반 Sequence Labeling

Transformer 기반 모델은 Self-Attention을 사용해 문장 전체의 문맥을 반영한다.

BERT 같은 사전학습 모델은 각 토큰에 대해 문맥이 반영된 표현을 만들고, 이를 이용해 토큰별 라벨을 예측한다.

Text
→ Tokenizer
→ BERT
→ Token-level Classifier
→ Label Sequence

특징

- 문맥을 잘 반영할 수 있다.
- 사전학습된 언어 지식을 활용할 수 있다.
- NER, 품사 태깅, 슬롯 필링 등에 사용할 수 있다.
- 모델 크기가 커서 학습과 추론 비용이 높을 수 있다.

---

20. Token-level Classification

Transformer 기반 Sequence Labeling은 각 토큰에 대해 분류를 수행하는 방식으로 볼 수 있다.

문장 전체에 하나의 라벨을 붙이는 것이 아니라, 각 토큰마다 라벨을 예측한다.

[김지윤] [은] [서울] [에서] [공부했다]
  PER     O   LOC     O      O

이처럼 각 토큰의 출력 벡터를 사용해 토큰별 클래스를 예측한다.

---

21. Subword Tokenization과 Label 정렬

BERT 같은 모델은 단어를 Subword 단위로 나눌 수 있다.

이 경우 원래 단어 라벨과 토큰화된 Subword 라벨을 어떻게 맞출지 결정해야 한다.

원문 단어: unbelievable
라벨: O

Subword: un / ##believable
라벨: O / O

한국어에서도 하나의 단어가 여러 토큰으로 나뉠 수 있으므로 라벨 정렬이 중요하다.

처리 방법

- 첫 번째 Subword에만 라벨 부여
- 모든 Subword에 같은 라벨 부여
- 나머지 Subword는 학습 손실 계산에서 제외

---

22. Padding과 Attention Mask

Sequence Labeling에서는 문장 길이가 서로 다르기 때문에 Padding을 사용할 수 있다.

짧은 문장 뒤에 "<PAD>" 토큰을 추가해 길이를 맞춘다.

문장 1: 나는 학교에 갔다
문장 2: 나는 갔다 <PAD>

Padding 토큰은 실제 의미 있는 토큰이 아니므로 모델이 학습하지 않도록 Mask 처리가 필요하다.

---

23. Evaluation

Sequence Labeling에서는 토큰 단위로 예측을 평가한다.

대표적인 평가 지표는 Precision, Recall, F1-score이다.

NER에서는 개체명 단위로 정확히 맞췄는지도 중요하다.

예를 들어 "서울 대학교"를 하나의 기관명으로 맞춰야 하는데 "서울"만 맞추고 "대학교"를 놓치면 완전한 정답으로 보기 어렵다.

---

24. Sequence Labeling 평가 시 주의할 점

Sequence Labeling은 단순히 토큰별 Accuracy만 보면 성능을 과대평가할 수 있다.

대부분의 토큰이 "O" 라벨일 경우, 모두 "O"로 예측해도 Accuracy가 높게 나올 수 있다.

따라서 개체명 인식에서는 "O" 라벨을 제외한 Precision, Recall, F1-score를 함께 확인하는 것이 중요하다.

---

25. Sequence Labeling의 어려움

Sequence Labeling은 다음과 같은 어려움이 있다.

- 라벨링 비용이 높다.
- 개체명의 경계가 모호할 수 있다.
- 같은 단어도 문맥에 따라 라벨이 달라질 수 있다.
- 신조어, 고유명사, 도메인 용어 처리가 어렵다.
- Subword Tokenization 시 라벨 정렬이 필요하다.
- "O" 라벨이 많아 클래스 불균형이 발생할 수 있다.

---

26. 활용 분야

Sequence Labeling은 다양한 NLP 서비스에서 사용된다.

분야| 활용 예시
검색| 검색어에서 상품명, 지역명 추출
챗봇| 날짜, 장소, 메뉴 등 슬롯 추출
금융| 뉴스에서 기업명, 금액, 날짜 추출
법률| 계약서에서 당사자, 날짜, 조항 추출
의료| 진료 기록에서 질병명, 약물명 추출
채용| 이력서에서 학교, 회사, 기술 스택 추출

---

27. Sequence Labeling 사용 시 주의할 점

- 라벨 기준을 명확하게 정의해야 한다.
- 같은 표현이 항상 같은 라벨을 갖는지 확인해야 한다.
- 개체명의 시작과 끝을 일관되게 라벨링해야 한다.
- Subword Tokenization과 라벨 정렬 방식을 정해야 한다.
- "O" 라벨이 많을 때 Accuracy만으로 평가하지 않아야 한다.
- 도메인 용어가 많은 데이터는 별도 사전이나 추가 학습이 필요할 수 있다.
- Error Analysis를 통해 어떤 개체명을 자주 놓치는지 확인해야 한다.

---

28. 정리

- Sequence Labeling은 각 토큰마다 라벨을 예측하는 NLP 작업이다.
- Text Classification은 문장 전체에 하나의 라벨을 붙이고, Sequence Labeling은 토큰별 라벨을 예측한다.
- 대표적인 작업으로 POS Tagging, Named Entity Recognition, Slot Filling이 있다.
- NER은 사람, 장소, 기관, 날짜 같은 개체명을 추출하는 작업이다.
- BIO Tagging은 개체명의 시작, 내부, 외부를 구분하는 라벨링 방식이다.
- CRF는 라벨 간 전이 관계를 고려하는 전통적인 Sequence Labeling 모델이다.
- BiLSTM은 앞뒤 문맥을 함께 반영할 수 있다.
- BiLSTM-CRF는 문맥 정보와 라벨 전이 관계를 함께 활용한다.
- Transformer 기반 모델은 Self-Attention을 이용해 문맥을 반영한 토큰 표현을 만든다.
- Subword Tokenization을 사용할 때는 원래 단어 라벨과 Subword 라벨을 정렬해야 한다.
- Sequence Labeling에서는 Accuracy뿐만 아니라 Precision, Recall, F1-score를 함께 확인해야 한다.