Transformer 개념 정리

1. Transformer

Transformer는 Attention 메커니즘을 기반으로 한 딥러닝 모델 구조이다.

기존 RNN, LSTM은 데이터를 순서대로 처리했지만, Transformer는 입력 데이터 전체를 한 번에 보고 각 요소 간의 관계를 계산한다.

Transformer는 자연어 처리 분야에서 많이 사용되며, BERT, GPT와 같은 대규모 언어 모델의 기반 구조이다.

---

2. Transformer가 등장한 이유

RNN과 LSTM은 순서가 있는 데이터를 처리하는 데 유용하지만 몇 가지 한계가 있다.

- 데이터를 순서대로 처리하기 때문에 병렬 연산이 어렵다.
- 문장이 길어질수록 앞쪽 정보가 뒤쪽까지 잘 전달되기 어렵다.
- 장기 의존성 Long-term Dependency 문제를 완전히 해결하기 어렵다.
- 학습 시간이 오래 걸릴 수 있다.

Transformer는 Attention을 사용해 입력 데이터의 모든 위치를 한 번에 비교할 수 있도록 설계되었다.

---

3. Attention

Attention은 입력 데이터 중 현재 처리하는 위치와 관련이 큰 정보를 더 중요하게 보는 방법이다.

문장에서 어떤 단어를 이해할 때, 모든 단어를 똑같이 보는 것이 아니라 관련 있는 단어에 더 집중하는 방식이다.

예를 들어 다음 문장을 보자.

The cat sat on the mat because it was tired.

여기서 "it"이 무엇을 가리키는지 이해하려면 앞에 나온 "cat"과의 관계를 봐야 한다.

Attention은 이런 단어 간 관계를 계산하는 데 사용된다.

---

4. Self-Attention

Self-Attention은 하나의 문장 안에서 각 단어가 다른 단어들과 어떤 관계를 가지는지 계산하는 방법이다.

즉, 입력 데이터 내부 요소들끼리 서로를 참고한다.

나는 오늘 학교에 갔다.

이 문장에서 각 단어는 다른 단어들과의 관계를 통해 의미가 결정된다.

Self-Attention은 각 단어가 문장 안의 다른 단어들을 얼마나 참고해야 하는지 계산한다.

---

5. Query, Key, Value

Self-Attention에서는 각 입력을 Query, Key, Value라는 세 가지 벡터로 변환한다.

요소| 의미
Query| 현재 단어가 찾고자 하는 정보
Key| 각 단어가 가진 정보의 기준
Value| 실제로 전달할 정보

Attention은 Query와 Key의 유사도를 계산하고, 그 결과를 이용해 Value를 가중합한다.

---

6. Attention 계산 과정

Attention은 대략 다음 순서로 계산된다.

1. 입력 벡터를 Query, Key, Value로 변환한다.
2. Query와 Key를 비교해 유사도를 계산한다.
3. 유사도 값을 Softmax에 통과시켜 가중치로 변환한다.
4. 가중치를 Value에 곱해 중요한 정보를 더 크게 반영한다.

수식으로는 다음과 같이 표현할 수 있다.

$$
Attention(Q, K, V) = softmax \left( \frac{QK^T}{\sqrt{d_k}} \right) V
$$

- $Q$: Query
- $K$: Key
- $V$: Value
- $d_k$: Key 벡터의 차원

---

7. Scaled Dot-Product Attention

Transformer에서 사용하는 기본 Attention 방식은 Scaled Dot-Product Attention이다.

Query와 Key의 내적을 통해 유사도를 계산하고, 이 값을 Key 차원의 제곱근으로 나누어 스케일을 조정한다.

스케일링을 하는 이유는 벡터 차원이 커질수록 내적값이 너무 커져 Softmax 결과가 극단적으로 변하는 것을 방지하기 위해서이다.

---

8. Multi-Head Attention

Multi-Head Attention은 Self-Attention을 여러 번 병렬로 수행하는 구조이다.

하나의 Attention만 사용하면 한 가지 관점의 관계만 학습할 수 있다.
Multi-Head Attention은 여러 개의 Attention Head를 사용해 다양한 관계를 동시에 학습한다.

예를 들어 어떤 Head는 문법적 관계를 보고, 다른 Head는 의미적 관계를 볼 수 있다.

특징

- 여러 관점에서 단어 간 관계를 학습한다.
- 병렬 연산이 가능하다.
- Transformer의 핵심 구성 요소이다.

---

9. Positional Encoding

Transformer는 RNN처럼 데이터를 순서대로 처리하지 않는다.

따라서 입력 데이터의 순서 정보를 따로 제공해야 한다.

Positional Encoding은 각 단어의 위치 정보를 벡터에 추가하는 방법이다.

단어 임베딩 + 위치 정보 = Transformer 입력

이를 통해 Transformer는 단어의 의미뿐만 아니라 문장 안에서의 위치도 함께 학습할 수 있다.

---

10. Encoder

Encoder는 입력 문장을 이해하고 표현하는 역할을 한다.

Transformer의 Encoder는 다음 요소들로 구성된다.

Input
→ Multi-Head Self-Attention
→ Add & Norm
→ Feed Forward Network
→ Add & Norm
→ Encoder Output

Encoder는 입력 문장 내부의 관계를 학습하여 문맥이 반영된 표현을 만든다.

---

11. Decoder

Decoder는 Encoder의 결과와 이전 출력 정보를 바탕으로 다음 출력을 생성하는 역할을 한다.

Transformer의 Decoder는 다음 요소들로 구성된다.

Output Input
→ Masked Multi-Head Self-Attention
→ Add & Norm
→ Encoder-Decoder Attention
→ Add & Norm
→ Feed Forward Network
→ Add & Norm
→ Output

Decoder는 번역, 문장 생성처럼 순차적으로 결과를 만들어야 하는 작업에 사용된다.

---

12. Masked Self-Attention

Decoder에서는 미래 정보를 미리 보면 안 된다.

예를 들어 문장을 생성할 때 현재 단어를 예측하기 위해 아직 생성되지 않은 다음 단어를 참고하면 안 된다.

Masked Self-Attention은 현재 위치 이후의 정보를 보지 못하도록 가리는 방식이다.

이를 통해 모델은 이전에 생성된 정보만 사용하여 다음 단어를 예측한다.

---

13. Feed Forward Network

Transformer의 각 Encoder와 Decoder 내부에는 Feed Forward Network가 포함된다.

Attention이 단어 간 관계를 학습한다면, Feed Forward Network는 각 위치의 표현을 비선형적으로 변환하는 역할을 한다.

일반적으로 각 위치에 대해 동일한 Feed Forward Network가 적용된다.

---

14. Residual Connection

Residual Connection은 입력값을 출력값에 더해주는 구조이다.

출력 = Layer(x) + x

이 구조는 깊은 신경망에서 기울기가 잘 전달되도록 도와준다.

Transformer는 각 Attention 층과 Feed Forward 층 주변에 Residual Connection을 사용한다.

---

15. Layer Normalization

Layer Normalization은 각 층의 출력값을 정규화하여 학습을 안정적으로 만드는 방법이다.

Transformer에서는 Residual Connection 이후에 Layer Normalization을 적용한다.

이를 통해 학습이 더 안정적으로 진행될 수 있다.

---

16. Transformer의 전체 구조

Transformer는 크게 Encoder와 Decoder로 구성된다.

Input
→ Embedding
→ Positional Encoding
→ Encoder
→ Decoder
→ Output

하지만 모든 Transformer 기반 모델이 Encoder와 Decoder를 모두 사용하는 것은 아니다.

구조| 대표 모델| 특징
Encoder-only| BERT| 문장 이해, 분류, 임베딩
Decoder-only| GPT| 텍스트 생성
Encoder-Decoder| T5, original Transformer| 번역, 요약 등 입력-출력 변환

---

17. Transformer와 RNN 비교

구분| RNN / LSTM| Transformer
처리 방식| 순차 처리| 병렬 처리 가능
핵심 구조| Hidden State| Self-Attention
긴 문맥 처리| 상대적으로 어려움| 상대적으로 강함
학습 속도| 느릴 수 있음| 병렬화로 빠름
위치 정보| 순서 자체에 포함| Positional Encoding 필요

---

18. Transformer의 장점

Transformer는 다음과 같은 장점이 있다.

- 긴 문맥을 더 잘 처리할 수 있다.
- 병렬 연산이 가능해 학습 속도를 높일 수 있다.
- 단어 간 관계를 직접 계산할 수 있다.
- 자연어 처리뿐만 아니라 이미지, 음성, 추천 시스템 등 다양한 분야에 활용된다.
- 대규모 언어 모델의 핵심 구조로 사용된다.

---

19. Transformer의 한계

Transformer도 몇 가지 한계가 있다.

- 입력 길이가 길어질수록 Attention 계산 비용이 커진다.
- 많은 데이터와 연산 자원이 필요하다.
- 모델이 매우 커질 경우 학습과 추론 비용이 높아진다.
- 결과를 해석하기 어려울 수 있다.

---

20. 활용 분야

Transformer는 다양한 분야에서 사용된다.

분야| 예시
자연어 처리| 번역, 요약, 질의응답, 감성 분석
생성형 AI| 텍스트 생성, 챗봇
검색| 문서 임베딩, 의미 기반 검색
이미지 처리| Vision Transformer
음성 처리| 음성 인식, 음성 생성
추천 시스템| 사용자 행동 sequence 분석

---

21. 정리

- Transformer는 Attention 기반의 딥러닝 모델 구조이다.
- RNN과 달리 입력을 순서대로 처리하지 않고 병렬 처리가 가능하다.
- Self-Attention은 입력 내부 요소들 간의 관계를 계산한다.
- Query, Key, Value는 Attention 계산에 사용되는 핵심 벡터이다.
- Multi-Head Attention은 여러 관점에서 관계를 학습한다.
- Positional Encoding은 입력 데이터의 순서 정보를 제공한다.
- Encoder는 입력을 이해하고 문맥 표현을 만든다.
- Decoder는 이전 출력과 Encoder 정보를 바탕으로 다음 출력을 생성한다.
- Transformer는 BERT, GPT와 같은 대규모 언어 모델의 기반 구조이다.
- 긴 문맥 처리와 병렬 연산에 강하지만, 연산 비용이 크다는 한계도 있다.