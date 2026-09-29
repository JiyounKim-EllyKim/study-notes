# Hallucination 개념 정리

## 1. Hallucination

Hallucination은 LLM이 실제로는 근거가 없거나 틀린 내용을 그럴듯하게 생성하는 현상이다.

한국어로는 환각이라고도 한다.

LLM은 자연스러운 문장을 생성하는 데 강하지만, 항상 사실만 말하는 것은 아니다.  
모델이 모르는 내용이나 불확실한 내용에 대해서도 확신 있는 말투로 답변을 만들 수 있다.

---

## 2. Hallucination이 중요한 이유

LLM 서비스에서는 답변이 자연스러운 것만으로 충분하지 않다.

특히 금융, 의료, 법률, 채용, 교육, 사내 문서 검색처럼 정확성이 중요한 분야에서는 잘못된 답변이 큰 문제로 이어질 수 있다.

### 문제가 되는 이유

- 사용자가 틀린 정보를 사실로 믿을 수 있다.
- 잘못된 의사결정으로 이어질 수 있다.
- 서비스 신뢰도가 떨어질 수 있다.
- 문서 기반 QA에서 근거 없는 답변이 생성될 수 있다.
- 출처나 인용까지 잘못 만들어낼 수 있다.

---

## 3. Hallucination 예시

```text id="8a7n49"
질문:
A 프로젝트의 최종 발표일이 언제야?

실제 문서:
최종 발표일 정보 없음

잘못된 답변:
A 프로젝트의 최종 발표일은 2026년 7월 16일입니다.
```

문서에 없는 내용을 모델이 임의로 생성하면 Hallucination에 해당한다.

---

## 4. Hallucination의 유형

Hallucination은 여러 형태로 나타날 수 있다.

| 유형 | 설명 |
|---|---|
| Factual Hallucination | 사실과 다른 내용을 생성 |
| Source Hallucination | 존재하지 않는 출처나 문서를 생성 |
| Citation Hallucination | 출처와 맞지 않는 내용을 인용 |
| Numerical Hallucination | 숫자, 날짜, 비율 등을 잘못 생성 |
| Context Hallucination | 제공된 문맥에 없는 내용을 추가 |
| Reasoning Hallucination | 논리적으로 맞지 않는 추론을 생성 |

---

## 5. Factual Hallucination

Factual Hallucination은 사실과 다른 내용을 생성하는 경우이다.

```text id="lz7mqv"
질문:
이 회사의 2026년 매출은 얼마야?

잘못된 답변:
2026년 매출은 3조 원입니다.
```

실제 근거가 없거나 수치가 확인되지 않았는데 특정 수치를 말하면 문제가 된다.

---

## 6. Source Hallucination

Source Hallucination은 존재하지 않는 출처나 문서를 만들어내는 경우이다.

```text id="447wrm"
잘못된 답변:
이 내용은 2026년 OpenAI 공식 보고서에 따르면 확인됩니다.
```

실제로 해당 보고서가 없거나, 보고서에 그런 내용이 없다면 Hallucination이다.

---

## 7. Citation Hallucination

Citation Hallucination은 출처는 존재하지만, 그 출처가 답변 내용을 실제로 뒷받침하지 않는 경우이다.

```text id="foh2e8"
문서 A:
프로젝트 기간만 설명함

잘못된 답변:
문서 A에 따르면 모델 성능은 AUC 0.94입니다.
```

출처가 있어 보이더라도, 해당 출처가 실제 주장을 지원하는지 확인해야 한다.

---

## 8. Numerical Hallucination

Numerical Hallucination은 숫자, 날짜, 비율, 순위 등을 잘못 생성하는 경우이다.

LLM은 숫자 계산이나 정확한 날짜 기억에 약할 수 있다.

### 예시

- 지원 마감일을 잘못 말함
- 시험 날짜를 잘못 말함
- 성능 수치를 임의로 생성함
- 퍼센트 계산을 틀림
- 표의 수치를 잘못 요약함

숫자 정보는 특히 원문이나 계산 도구로 검증하는 것이 중요하다.

---

## 9. Context Hallucination

Context Hallucination은 제공된 문맥에 없는 내용을 추가하는 경우이다.

```text id="ey35b8"
제공 문서:
프로젝트는 Django와 React를 사용했다.

잘못된 답변:
이 프로젝트는 Django, React, Kubernetes를 사용했다.
```

Kubernetes가 문서에 없는데 추가했다면 Hallucination이다.

문서 기반 답변에서는 제공된 자료 안에서 확인되는 내용만 사용해야 한다.

---

## 10. Hallucination이 발생하는 이유

Hallucination은 여러 이유로 발생할 수 있다.

- LLM이 다음 토큰을 확률적으로 생성하기 때문
- 모델이 최신 정보를 알지 못할 수 있기 때문
- 학습 데이터에 잘못된 정보가 포함되었을 수 있기 때문
- Prompt가 모호하기 때문
- 제공된 문맥이 부족하기 때문
- 검색된 문서가 질문과 관련 없기 때문
- 모델이 모르는 내용을 인정하지 않고 답하려 하기 때문
- 숫자나 출처를 정확히 검증하지 못하기 때문

---

## 11. Next Token Prediction과 Hallucination

LLM은 기본적으로 다음에 올 가능성이 높은 토큰을 예측하는 방식으로 문장을 생성한다.

즉, 모델은 데이터베이스처럼 사실을 조회해서 답하는 것이 아니라, 문맥상 자연스러운 답변을 생성한다.

```text id="c6e89q"
현재 문맥
→ 다음 토큰 예측
→ 다음 토큰 예측
→ 문장 생성
```

이 특성 때문에 자연스럽지만 틀린 문장이 생성될 수 있다.

---

## 12. Knowledge Cutoff와 Hallucination

LLM은 학습 시점 이후의 정보를 알지 못할 수 있다.

최신 채용 공고, 법률, 가격, 일정, 뉴스, 기업 정보처럼 자주 바뀌는 정보는 모델 내부 지식만으로 답하면 틀릴 가능성이 있다.

이런 경우에는 검색, API, 데이터베이스, RAG 같은 외부 정보 연결이 필요하다.

---

## 13. Prompt 모호성과 Hallucination

Prompt가 모호하면 모델이 부족한 정보를 임의로 채울 수 있다.

### 모호한 Prompt

```text id="iyhf6c"
이 프로젝트 정리해줘.
```

### 더 안전한 Prompt

```text id="z4jiz6"
아래 프로젝트 설명에 있는 내용만 사용해서 정리해줘.
설명에 없는 내용은 추가하지 말고, 확인되지 않는 내용은 "확인되지 않음"이라고 표시해줘.
```

답변 범위와 근거 사용 방식을 명확히 하면 Hallucination을 줄일 수 있다.

---

## 14. Grounding

Grounding은 모델이 특정 근거 자료에 기반해 답변하도록 만드는 것이다.

LLM에게 문서, 데이터, 표, 검색 결과 등을 제공하고 그 안에서만 답하게 하면 Hallucination을 줄일 수 있다.

```text id="nsi60c"
제공된 문서만 근거로 답변해줘.
문서에 없는 내용은 추측하지 말고 확인되지 않는다고 말해줘.
```

Grounding은 RAG와 문서 기반 QA에서 매우 중요하다.

---

## 15. RAG와 Hallucination

RAG는 Hallucination을 줄이는 대표적인 방법이다.

RAG는 LLM이 답변하기 전에 관련 문서를 검색하고, 그 문서를 근거로 답변을 생성하도록 한다.

```text id="7jzmwg"
User Question
→ Document Retrieval
→ Retrieved Context
→ Grounded Answer
```

하지만 RAG를 사용한다고 Hallucination이 완전히 사라지는 것은 아니다.

---

## 16. RAG에서도 Hallucination이 생기는 경우

RAG에서도 다음과 같은 상황에서는 Hallucination이 발생할 수 있다.

- 검색된 문서가 질문과 관련이 없음
- 필요한 문서가 검색되지 않음
- 문서 내용이 오래되었거나 틀림
- Chunk가 잘못 잘려 문맥이 부족함
- LLM이 검색된 문서를 잘못 해석함
- 문서에 없는 내용을 답변에 추가함
- Citation이 실제 근거와 맞지 않음

따라서 RAG에서는 검색 품질과 답변 충실성을 함께 평가해야 한다.

---

## 17. Hallucination을 줄이는 Prompt 전략

Prompt만으로 Hallucination을 완전히 막을 수는 없지만, 줄이는 데 도움이 된다.

### 전략

- 제공된 자료만 사용하도록 지시
- 모르는 내용
