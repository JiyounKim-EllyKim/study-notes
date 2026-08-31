Tokenization 개념 정리

1. Tokenization

Tokenization은 텍스트를 의미 있는 단위로 나누는 과정이다.

나누어진 단위를 Token이라고 한다.

자연어 처리 모델은 문장 전체를 그대로 처리하기 어렵기 때문에, 문장을 단어, 형태소, 문자, 서브워드 등의 단위로 나누어 사용한다.

문장: 나는 오늘 학교에 갔다
Token: 나는 / 오늘 / 학교에 / 갔다

---

2. Tokenization이 필요한 이유

텍스트 데이터는 문장 그대로는 모델이 처리하기 어렵다.

모델이 텍스트를 학습하려면 먼저 문장을 일정한 단위로 나누고, 각 토큰을 숫자로 변환해야 한다.

Raw Text
→ Tokenization
→ Vocabulary 생성
→ Integer Encoding
→ Embedding
→ Model Input

Tokenization은 텍스트를 모델 입력으로 바꾸기 위한 첫 단계이다.

---

3. Token

Token은 텍스트를 나눈 기본 단위이다.

Token은 모델이나 분석 목적에 따라 다르게 정의될 수 있다.

Token 단위| 예시
단어| 나는 / 학교에 / 갔다
형태소| 나 / 는 / 학교 / 에 / 가 / 았 / 다
문자| 나 / 는 / 오 / 늘
서브워드| 학교 / 에 / 갔 / 다

어떤 단위로 토큰화하느냐에 따라 Vocabulary 크기와 모델 성능이 달라질 수 있다.

---

4. Word Tokenization

Word Tokenization은 문장을 단어 단위로 나누는 방법이다.

영어처럼 공백을 기준으로 단어가 비교적 명확히 나뉘는 언어에서 사용하기 쉽다.

Sentence: I like machine learning.
Tokens: I / like / machine / learning

특징

- 직관적이고 이해하기 쉽다.
- 단어 단위 의미를 보존하기 좋다.
- Vocabulary 크기가 커질 수 있다.
- 모르는 단어 OOV 문제가 발생할 수 있다.

---

5. 공백 기반 Tokenization

공백 기반 Tokenization은 띄어쓰기를 기준으로 문장을 나누는 방법이다.

문장: 나는 오늘 학교에 갔다
토큰: 나는 / 오늘 / 학교에 / 갔다

장점

- 구현이 간단하다.
- 빠르게 적용할 수 있다.

한계

- 한국어처럼 조사와 어미가 붙는 언어에서는 의미 단위 분리가 부족할 수 있다.
- 띄어쓰기가 틀린 문장에서는 결과가 불안정할 수 있다.
- 특수문자, 구두점 처리가 별도로 필요할 수 있다.

---

6. Morphological Tokenization 형태소 토큰화

Morphological Tokenization은 문장을 형태소 단위로 나누는 방법이다.

형태소는 의미를 가지는 가장 작은 단위이다.

한국어는 조사와 어미가 단어에 붙기 때문에 형태소 분석이 중요한 경우가 많다.

문장: 나는 학교에 갔다
형태소: 나 / 는 / 학교 / 에 / 가 / 았 / 다

특징

- 한국어 NLP에서 자주 사용된다.
- 조사, 어미, 어근을 분리할 수 있다.
- 단어의 기본형을 파악하는 데 도움이 된다.
- 형태소 분석기 성능에 따라 결과가 달라질 수 있다.

---

7. 한국어 Tokenization의 어려움

한국어는 영어보다 토큰화가 어려운 경우가 많다.

주요 이유

- 조사와 어미가 단어에 붙는다.
- 띄어쓰기가 항상 정확하지 않다.
- 같은 단어가 다양한 형태로 변형된다.
- 신조어, 줄임말, 은어가 많다.
- 형태소 분석 결과가 도구마다 다를 수 있다.

예를 들어 다음 표현들은 모두 비슷한 의미를 가진다.

먹었다
먹고
먹으면
먹는다면

이런 표현을 어떻게 나눌지에 따라 모델이 학습하는 정보가 달라진다.

---

8. Character Tokenization

Character Tokenization은 텍스트를 문자 단위로 나누는 방법이다.

문장: 자연어
토큰: 자 / 연 / 어

장점

- OOV 문제가 거의 없다.
- 어떤 단어든 문자 단위로 표현할 수 있다.
- 오타나 신조어에도 어느 정도 대응할 수 있다.

한계

- 문장이 너무 길어질 수 있다.
- 단어 의미를 직접적으로 표현하기 어렵다.
- 학습해야 할 순서 정보가 많아진다.

---

9. Subword Tokenization

Subword Tokenization은 단어보다 작고 문자보다 큰 단위로 텍스트를 나누는 방법이다.

최근 Transformer 기반 모델에서 많이 사용된다.

unbelievable → un / believe / able

한국어에서도 단어를 더 작은 단위로 나누어 OOV 문제를 줄일 수 있다.

특징

- OOV 문제를 줄일 수 있다.
- 자주 등장하는 단어는 하나의 토큰으로 유지할 수 있다.
- 드문 단어는 여러 서브워드로 나눌 수 있다.
- LLM과 Transformer 계열 모델에서 자주 사용된다.

---

10. OOV 문제

OOV는 Out-of-Vocabulary의 약자로, Vocabulary에 없는 단어를 의미한다.

Word Tokenization에서는 학습 데이터에 없던 단어가 등장하면 모델이 처리하기 어렵다.

학습 Vocabulary: 고양이, 강아지, 학교
새 문장: 햄스터를 키운다
OOV: 햄스터

Subword Tokenization을 사용하면 모르는 단어도 더 작은 단위로 나누어 처리할 수 있다.

---

11. BPE Byte Pair Encoding

BPE는 자주 함께 등장하는 문자나 문자열 쌍을 반복적으로 합치며 Vocabulary를 만드는 방식이다.

처음에는 문자 단위에서 시작하고, 자주 등장하는 조합을 하나의 토큰으로 합친다.

l / o / w
l / o / w / e / r

자주 등장하는 조합 병합
→ low / er

특징

- 자주 등장하는 단어 조각을 효율적으로 학습한다.
- 드문 단어도 여러 서브워드로 나눌 수 있다.
- OOV 문제를 줄이는 데 도움이 된다.
- GPT 계열 모델에서 사용되는 방식과 관련이 있다.

---

12. WordPiece

WordPiece는 BPE와 비슷하게 서브워드 단위를 학습하는 방법이다.

BERT 계열 모델에서 사용된 방식으로 알려져 있다.

WordPiece는 단어를 여러 조각으로 나누고, 자주 등장하거나 유용한 조각을 Vocabulary에 포함한다.

playing → play / ##ing

"##"는 앞 토큰에 이어지는 서브워드임을 나타내는 표시로 사용될 수 있다.

---

13. SentencePiece

SentencePiece는 문장을 공백 기준으로 먼저 나누지 않고, 원문 텍스트에서 직접 서브워드 단위를 학습하는 방법이다.

한국어, 일본어처럼 공백 기준 토큰화가 어려운 언어에서도 유용하게 사용할 수 있다.

특징

- 언어에 덜 의존적이다.
- 공백도 하나의 기호처럼 처리할 수 있다.
- 다양한 언어의 토큰화에 사용할 수 있다.
- Transformer 기반 다국어 모델에서 자주 사용된다.

---

14. Tokenization 방식 비교

방식| 단위| 장점| 한계
Word Tokenization| 단어| 의미 단위가 직관적| OOV 문제
Morphological Tokenization| 형태소| 한국어 분석에 유용| 분석기 의존
Character Tokenization| 문자| OOV 거의 없음| 시퀀스가 길어짐
Subword Tokenization| 서브워드| OOV 완화, 효율적| 해석이 다소 어려움

---

15. Vocabulary

Vocabulary는 모델이 인식할 수 있는 토큰 목록이다.

Tokenization을 수행한 뒤, 자주 등장하는 토큰들을 모아 Vocabulary를 만든다.

문장 1: 나는 고양이를 좋아한다
문장 2: 나는 강아지를 좋아한다

Vocabulary:
나는, 고양이를, 강아지를, 좋아한다

Vocabulary에 포함되지 않은 토큰은 "<UNK>" 같은 특별 토큰으로 처리할 수 있다.

---

16. Special Token

Special Token은 모델 입력을 구성하기 위해 사용하는 특별한 토큰이다.

Token| 의미
"<PAD>"| 길이를 맞추기 위한 패딩 토큰
"<UNK>"| Vocabulary에 없는 단어
"<CLS>"| 문장 전체 표현을 위한 시작 토큰
"<SEP>"| 문장 구분 토큰
"<BOS>"| 문장 시작 토큰
"<EOS>"| 문장 종료 토큰

모델 구조에 따라 사용하는 Special Token은 달라질 수 있다.

---

17. Padding

Padding은 길이가 서로 다른 문장들을 같은 길이로 맞추기 위해 사용하는 방법이다.

딥러닝 모델은 보통 동일한 길이의 입력을 배치 단위로 처리하므로, 짧은 문장 뒤에 "<PAD>" 토큰을 추가한다.

문장 1: 나는 학교에 갔다
문장 2: 나는 갔다

Padding 후:
나는 / 학교에 / 갔다
나는 / 갔다 / <PAD>

Padding을 적용할 때는 모델이 "<PAD>" 토큰을 실제 의미 있는 단어로 학습하지 않도록 Attention Mask 등을 함께 사용한다.

---

18. Truncation

Truncation은 문장이 너무 길 때 일정 길이까지만 자르는 방법이다.

모델마다 입력 가능한 최대 길이가 정해져 있기 때문에, 긴 문장은 일부를 잘라야 할 수 있다.

원문 길이: 1000 tokens
모델 최대 길이: 512 tokens
→ 512 tokens까지만 사용

주의할 점

- 중요한 정보가 잘릴 수 있다.
- 앞부분만 자를지, 뒷부분만 자를지, 양쪽을 나눠 사용할지 결정해야 한다.
- 문서 분류, 요약, 질의응답 등 작업에 따라 전략이 달라질 수 있다.

---

19. Attention Mask

Attention Mask는 모델이 실제 토큰과 Padding 토큰을 구분할 수 있도록 알려주는 값이다.

Tokens:
나는 / 갔다 / <PAD>

Attention Mask:
1 / 1 / 0

- "1": 실제 토큰
- "0": Padding 토큰

Transformer 계열 모델에서는 Attention Mask를 사용해 "<PAD>" 토큰을 계산에서 제외할 수 있다.

---

20. Tokenization과 모델 성능

Tokenization 방식은 모델 성능에 큰 영향을 줄 수 있다.

잘못된 토큰화는 의미 단위를 깨뜨리거나, Vocabulary를 지나치게 크게 만들 수 있다.

고려할 점

- 언어 특성
- 데이터 도메인
- 모델 구조
- Vocabulary 크기
- OOV 처리 방식
- 문장 길이
- 전처리 방식

예를 들어 한국어 리뷰 데이터에서는 형태소 분석이나 서브워드 토큰화가 공백 기반 토큰화보다 더 적합할 수 있다.

---

21. Tokenization 사용 시 주의할 점

- 한국어는 단순 공백 기준 토큰화만으로 부족할 수 있다.
- 토큰화 방식에 따라 Vocabulary 크기가 달라진다.
- Word Tokenization은 OOV 문제가 발생할 수 있다.
- Character Tokenization은 OOV는 줄지만 문장 길이가 길어진다.
- Subword Tokenization은 OOV 문제를 줄이고 현대 NLP 모델에서 많이 사용된다.
- Padding과 Truncation은 모델 입력 길이를 맞추기 위해 필요하다.
- Tokenizer는 학습 데이터 기준으로 만들고, Validation/Test Data에는 같은 Tokenizer를 적용해야 한다.

---

22. 정리

- Tokenization은 텍스트를 의미 있는 단위인 Token으로 나누는 과정이다.
- Token은 단어, 형태소, 문자, 서브워드 등 다양한 단위가 될 수 있다.
- Word Tokenization은 단어 단위로 나누지만 OOV 문제가 발생할 수 있다.
- 한국어는 조사와 어미가 발달해 형태소 분석이 중요한 경우가 많다.
- Character Tokenization은 OOV 문제가 거의 없지만 문장 길이가 길어진다.
- Subword Tokenization은 단어를 더 작은 단위로 나누어 OOV 문제를 완화한다.
- BPE, WordPiece, SentencePiece는 대표적인 Subword Tokenization 방법이다.
- Vocabulary는 모델이 인식할 수 있는 토큰 목록이다.
- Padding은 문장 길이를 맞추는 과정이고, Truncation은 긴 문장을 자르는 과정이다.
- Attention Mask는 Padding 토큰을 모델 계산에서 구분하기 위해 사용한다.