Fine-tuning 개념 정리

1. Fine-tuning

Fine-tuning은 이미 사전학습된 모델을 특정 작업이나 도메인에 맞게 추가 학습하는 과정이다.

LLM은 대규모 텍스트 데이터로 Pre-training되어 일반적인 언어 능력을 갖고 있다.
하지만 특정 서비스, 업무, 말투, 데이터 형식에 더 잘 맞게 만들기 위해 추가 학습을 수행할 수 있다.

Pre-trained Model
→ Task-specific Data로 추가 학습
→ Fine-tuned Model

---

2. Fine-tuning이 필요한 이유

LLM은 범용적으로 다양한 작업을 수행할 수 있지만, 모든 도메인이나 작업에 항상 최적화되어 있지는 않다.

Fine-tuning은 다음과 같은 상황에서 고려할 수 있다.

- 특정 도메인 용어를 더 잘 다루고 싶을 때
- 일정한 응답 형식을 안정적으로 따르게 하고 싶을 때
- 특정 작업의 성능을 높이고 싶을 때
- 기업이나 서비스의 말투를 반영하고 싶을 때
- 반복적인 라벨링 작업을 자동화하고 싶을 때
- Prompt만으로 원하는 결과가 안정적으로 나오지 않을 때

---

3. Pre-training과 Fine-tuning 비교

구분| Pre-training| Fine-tuning
목적| 일반적인 언어 능력 학습| 특정 작업이나 도메인에 맞게 조정
데이터| 대규모 범용 텍스트| 작업별 데이터, 도메인 데이터
비용| 매우 큼| 상대적으로 작음
결과| 범용 모델| 특정 목적에 최적화된 모델
예시| 대규모 언어 모델 학습| 고객 상담 응답 모델 학습

Fine-tuning은 처음부터 모델을 새로 만드는 것이 아니라, 이미 학습된 모델을 출발점으로 삼는다.

---

4. Fine-tuning의 기본 흐름

Fine-tuning은 보통 다음 순서로 진행된다.

1. 목적 정의
2. 데이터 수집
3. 데이터 정제
4. 학습 형식 구성
5. Train / Validation 분리
6. Fine-tuning 실행
7. 평가
8. 배포
9. 모니터링

Fine-tuning은 모델 학습 자체보다 데이터 품질과 평가 기준이 더 중요할 수 있다.

---

5. Fine-tuning 데이터

Fine-tuning에는 목적에 맞는 고품질 데이터가 필요하다.

데이터는 모델이 앞으로 어떤 방식으로 답변해야 하는지를 보여주는 예시 역할을 한다.

데이터 예시

목적| 데이터 형태
감성 분석| 텍스트 + 감성 라벨
문서 분류| 문서 + 카테고리
질의응답| 질문 + 정답
챗봇| 사용자 발화 + assistant 응답
요약| 원문 + 요약문
코드 생성| 요구사항 + 코드

---

6. 데이터 품질의 중요성

Fine-tuning은 데이터 품질에 크게 영향을 받는다.

모델은 제공된 데이터의 패턴을 학습하기 때문에, 데이터가 부정확하거나 일관되지 않으면 모델 출력도 불안정해질 수 있다.

좋은 데이터의 조건

- 라벨 기준이 명확하다.
- 입력과 출력 형식이 일관적이다.
- 실제 사용 상황을 잘 반영한다.
- 오타나 중복이 적다.
- 잘못된 정답이 적다.
- 민감 정보가 제거되어 있다.
- 과장되거나 편향된 표현이 적다.

---

7. Instruction Fine-tuning

Instruction Fine-tuning은 모델이 사람의 지시를 더 잘 따르도록 학습시키는 방식이다.

입력에는 사용자의 지시가 들어가고, 출력에는 그 지시에 대한 적절한 응답이 들어간다.

Instruction:
다음 문장을 긍정/부정으로 분류해줘.

Input:
배송이 너무 늦어서 실망했어요.

Output:
부정

Instruction Fine-tuning은 LLM이 다양한 요청을 더 자연스럽게 수행하도록 만드는 데 사용된다.

---

8. Supervised Fine-tuning

Supervised Fine-tuning, 줄여서 SFT는 정답이 있는 데이터로 모델을 학습시키는 방법이다.

LLM에게 입력과 정답 출력을 함께 제공하고, 모델이 정답과 비슷한 출력을 생성하도록 학습한다.

입력: 질문
정답: 모범 답변

SFT는 챗봇, 질의응답, 요약, 분류 등 다양한 LLM 작업에 사용된다.

---

9. Chat Fine-tuning 데이터 형식

챗봇 Fine-tuning에서는 대화 형식의 데이터를 사용한다.

User:
AI 모의면접 서비스의 핵심 기능을 설명해줘.

Assistant:
JD와 이력서를 기반으로 맞춤형 면접 질문을 생성하고,
사용자 답변을 평가한 뒤 꼬리질문과 리포트를 제공하는 서비스입니다.

이런 형식의 데이터를 통해 모델은 사용자 질문에 어떤 스타일로 답해야 하는지 학습한다.

---

10. Fine-tuning과 Prompt Engineering 비교

구분| Prompt Engineering| Fine-tuning
방식| 입력 Prompt를 설계| 모델 가중치를 추가 학습
데이터 필요| 적거나 없음| 학습 데이터 필요
비용| 낮음| 상대적으로 높음
변경 속도| 빠름| 학습 과정 필요
적합한 경우| 간단한 형식 제어, 실험| 반복 작업, 안정적 출력, 도메인 적응

Fine-tuning 전에 먼저 Prompt Engineering으로 해결 가능한지 확인하는 것이 좋다.

---

11. Fine-tuning과 RAG 비교

Fine-tuning과 RAG는 서로 다른 문제를 해결한다.

구분| Fine-tuning| RAG
목적| 모델의 행동, 형식, 작업 성능 조정| 외부 지식 검색 후 답변
지식 업데이트| 재학습 필요| 문서 DB 업데이트
적합한 경우| 응답 스타일, 작업 패턴 학습| 최신 정보, 사내 문서 기반 QA
근거 제시| 직접 제공 어려움| 문서 출처 제공 가능
비용| 학습 비용 발생| 검색 인프라 비용 발생

RAG는 지식을 넣는 방식에 가깝고, Fine-tuning은 모델의 행동 방식을 조정하는 방식에 가깝다.

---

12. Fine-tuning이 적합한 경우

Fine-tuning은 다음과 같은 경우에 적합하다.

- 출력 형식이 반복적으로 흔들릴 때
- 특정 라벨링 작업을 안정적으로 수행해야 할 때
- 특정 도메인의 표현 방식에 익숙해져야 할 때
- 서비스 고유의 답변 스타일이 필요할 때
- 많은 예시를 Prompt에 매번 넣기 어려울 때
- 모델이 특정 작업 절차를 꾸준히 따르도록 만들고 싶을 때

---

13. Fine-tuning보다 RAG가 적합한 경우

다음과 같은 경우에는 Fine-tuning보다 RAG가 더 적합할 수 있다.

- 최신 정보가 자주 바뀌는 경우
- 문서 기반 근거가 필요한 경우
- 사내 문서나 개인 자료를 기반으로 답해야 하는 경우
- 데이터가 계속 추가되거나 수정되는 경우
- 출처와 인용이 중요한 경우
- 모델이 모르는 사실을 외부 문서에서 찾아야 하는 경우

---

14. Full Fine-tuning

Full Fine-tuning은 모델의 전체 파라미터를 업데이트하는 방식이다.

모델 전체를 학습하기 때문에 특정 작업에 강하게 적응할 수 있지만, 많은 연산 자원과 메모리가 필요하다.

특징

- 모델 전체 가중치를 업데이트한다.
- 학습 비용이 크다.
- 큰 GPU 메모리가 필요할 수 있다.
- 잘못 학습하면 기존 능력이 손상될 수 있다.
- 대규모 서비스나 연구 환경에서 주로 고려된다.

---

15. Parameter-Efficient Fine-tuning

Parameter-Efficient Fine-tuning, 줄여서 PEFT는 모델 전체를 학습하지 않고 일부 파라미터만 학습하는 방식이다.

큰 LLM을 효율적으로 조정하기 위해 사용된다.

장점

- 학습 비용을 줄일 수 있다.
- GPU 메모리 사용량을 줄일 수 있다.
- 여러 작업별 Adapter를 따로 관리할 수 있다.
- Full Fine-tuning보다 접근성이 좋다.

대표적인 방법으로 LoRA가 있다.

---

16. LoRA

LoRA는 Low-Rank Adaptation의 약자이다.

기존 모델의 가중치를 직접 크게 바꾸지 않고, 작은 추가 행렬을 학습하여 모델을 특정 작업에 적응시키는 방법이다.

Pre-trained Model Weight는 고정
+
작은 학습 가능한 Adapter 추가
→ 특정 작업에 맞게 조정

LoRA는 LLM Fine-tuning에서 많이 사용되는 PEFT 기법이다.

---

17. QLoRA

QLoRA는 양자화 Quantization와 LoRA를 함께 사용하는 방식이다.

모델을 더 낮은 정밀도로 저장하여 메모리 사용량을 줄이고, LoRA로 효율적으로 학습한다.

특징

- 메모리 사용량을 크게 줄일 수 있다.
- 비교적 제한된 GPU 환경에서도 큰 모델을 조정할 수 있다.
- LoRA와 함께 LLM Fine-tuning에서 자주 언급된다.
- 양자화로 인한 성능 변화를 확인해야 한다.

---

18. Adapter

Adapter는 사전학습된 모델에 작은 학습 가능한 모듈을 추가하는 방식이다.

기존 모델 대부분은 고정하고, Adapter 부분만 학습한다.

특징

- 작업별로 Adapter를 따로 만들 수 있다.
- 원본 모델을 크게 수정하지 않는다.
- 여러 도메인이나 작업에 유연하게 대응할 수 있다.
- PEFT 방식 중 하나로 볼 수 있다.

---

19. Catastrophic Forgetting

Catastrophic Forgetting은 Fine-tuning 과정에서 모델이 기존에 알고 있던 일반 능력을 잃어버리는 현상이다.

특정 데이터에 과하게 맞춰 학습하면 기존의 범용 언어 능력이나 다른 작업 성능이 떨어질 수 있다.

줄이는 방법

- 학습률을 너무 크게 설정하지 않기
- 데이터 품질 관리
- 너무 좁은 데이터만 사용하지 않기
- Validation 성능 확인
- PEFT 사용 고려
- 기존 모델과 Fine-tuned Model 비교 평가

---

20. Overfitting

Overfitting은 모델이 학습 데이터에는 잘 맞지만 새로운 데이터에는 잘 일반화하지 못하는 현상이다.

Fine-tuning 데이터가 적거나 편향되어 있으면 Overfitting이 발생하기 쉽다.

확인 방법

- Train 성능은 높은데 Validation 성능이 낮다.
- 학습 데이터와 비슷한 질문에만 잘 답한다.
- 표현이 반복적이고 다양성이 떨어진다.
- 새로운 케이스에서 성능이 급격히 떨어진다.

---

21. 학습률 Learning Rate

Learning Rate는 모델 가중치를 얼마나 크게 업데이트할지 결정하는 값이다.

Fine-tuning에서는 일반적으로 너무 큰 Learning Rate를 사용하면 모델이 기존 능력을 잃거나 불안정해질 수 있다.

주의할 점

- 너무 크면 학습이 불안정해질 수 있다.
- 너무 작으면 학습이 느리거나 변화가 거의 없을 수 있다.
- Validation 성능을 보며 조정해야 한다.

---

22. Epoch

Epoch은 전체 학습 데이터를 몇 번 반복해서 학습할지를 의미한다.

Fine-tuning에서 Epoch 수가 너무 많으면 Overfitting이 발생할 수 있다.

Epoch 1: 전체 데이터 1회 학습
Epoch 2: 전체 데이터 2회 학습
Epoch 3: 전체 데이터 3회 학습

적절한 Epoch 수는 데이터 크기와 작업 난이도에 따라 달라진다.

---

23. Validation Set

Validation Set은 학습 중 모델 성능을 확인하기 위해 따로 분리한 데이터이다.

Fine-tuning에서는 학습 데이터와 검증 데이터를 분리해야 한다.

전체 데이터
→ Train Set
→ Validation Set
→ Test Set

Validation Set을 사용하면 Overfitting 여부와 모델 개선 방향을 확인할 수 있다.

---

24. 데이터 누수 Data Leakage

Fine-tuning에서도 Data Leakage를 주의해야 한다.

검증 데이터나 테스트 데이터가 학습 데이터에 포함되면 실제보다 성능이 높게 측정된다.

예시

- 동일한 질문이 Train과 Test에 모두 들어간 경우
- 거의 같은 문장이 여러 Split에 나뉘어 들어간 경우
- 정답을 직접 암시하는 정보가 입력에 포함된 경우
- Test Data를 보고 Prompt나 학습 기준을 조정한 경우

---

25. Fine-tuning 평가

Fine-tuning 후에는 모델이 실제 목적에 맞게 개선되었는지 평가해야 한다.

평가 기준

- 원하는 출력 형식을 잘 따르는가?
- 특정 작업의 정확도가 개선되었는가?
- 기존보다 Hallucination이 줄었는가?
- 새로운 입력에도 잘 일반화되는가?
- 응답이 너무 반복적이지 않은가?
- 기존 모델보다 실제 사용성 측면에서 나아졌는가?
- 안전성 문제가 생기지 않았는가?

---

26. Baseline 비교

Fine-tuning 모델은 반드시 Baseline과 비교해야 한다.

Baseline은 Fine-tuning 전 모델이나 Prompt Engineering만 적용한 모델이 될 수 있다.

Baseline:
기본 LLM + Prompt

Fine-tuned:
Fine-tuning된 LLM + 동일 Prompt

Fine-tuning이 실제로 성능을 높였는지 확인하지 않으면, 비용만 늘고 효과는 없을 수 있다.

---

27. Fine-tuning과 Evaluation Dataset

Fine-tuning을 제대로 평가하려면 별도의 Evaluation Dataset이 필요하다.

Evaluation Dataset은 실제 사용 상황을 반영해야 한다.

포함하면 좋은 데이터

- 자주 들어오는 질문
- 어려운 케이스
- 모호한 입력
- 도메인 특화 표현
- 예외 상황
- 모델이 이전에 자주 틀린 사례
- 출력 형식이 중요한 사례

---

28. Fine-tuning과 Safety

Fine-tuning 데이터에 부적절한 응답이나 민감한 정보가 포함되면 모델이 이를 학습할 수 있다.

따라서 Fine-tuning 전 데이터 검수가 필요하다.

확인할 점

- 개인정보가 포함되어 있지 않은가?
- 민감한 내부 정보가 포함되어 있지 않은가?
- 부적절하거나 유해한 응답이 포함되어 있지 않은가?
- 편향된 표현이 반복적으로 포함되어 있지 않은가?
- 모델이 따라 하면 안 되는 행동이 정답으로 들어 있지 않은가?

---

29. Fine-tuning과 비용

Fine-tuning은 Prompt Engineering이나 RAG보다 비용이 더 들 수 있다.

비용에는 학습 비용뿐만 아니라 데이터 구축, 평가, 배포, 모니터링 비용도 포함된다.

고려할 비용

- 데이터 수집 비용
- 데이터 정제 비용
- 라벨링 비용
- 학습 비용
- 실험 반복 비용
- 평가 비용
- 배포와 운영 비용

Fine-tuning은 효과가 명확할 때 선택하는 것이 좋다.

---

30. Fine-tuning 사용 시 주의할 점

- Fine-tuning이 필요한 문제인지 먼저 확인해야 한다.
- Prompt Engineering이나 RAG로 해결 가능한지 비교해야 한다.
- 데이터 품질이 낮으면 Fine-tuning 효과도 낮다.
- 학습 데이터와 평가 데이터를 분리해야 한다.
- Fine-tuning 후 반드시 Baseline과 비교해야 한다.
- Overfitting과 Catastrophic Forgetting을 확인해야 한다.
- 민감 정보와 부적절한 응답이 데이터에 포함되지 않도록 해야 한다.
- 모델이 배포된 후에도 지속적으로 모니터링해야 한다.

---

31. Fine-tuning 활용 분야

Fine-tuning은 다양한 LLM 서비스에서 활용될 수 있다.

분야| 활용 예시
고객 상담| 회사 톤에 맞는 응답 생성
문서 분류| 문의 유형 자동 분류
감성 분석| 도메인별 긍정/부정 판단
코드 생성| 특정 코드 스타일 반영
교육| 특정 커리큘럼 기반 피드백
면접 서비스| 답변 평가 형식과 기준 학습
요약| 특정 보고서 양식에 맞춘 요약
챗봇| 특정 페르소나와 응답 패턴 학습

---

32. 정리

- Fine-tuning은 사전학습된 모델을 특정 작업이나 도메인에 맞게 추가 학습하는 과정이다.
- Fine-tuning은 모델의 응답 형식, 작업 수행 방식, 도메인 적응을 개선하는 데 사용할 수 있다.
- Pre-training은 범용 언어 능력을 학습하는 과정이고, Fine-tuning은 특정 목적에 맞게 조정하는 과정이다.
- Instruction Fine-tuning은 모델이 사람의 지시를 더 잘 따르도록 학습시키는 방식이다.
- Supervised Fine-tuning은 입력과 정답 출력 쌍을 사용해 모델을 학습한다.
- Fine-tuning은 Prompt Engineering이나 RAG와 역할이 다르다.
- RAG는 외부 지식을 검색해 답변에 활용하고, Fine-tuning은 모델의 행동과 출력 패턴을 조정한다.
- Full Fine-tuning은 모델 전체를 학습하고, PEFT는 일부 파라미터만 효율적으로 학습한다.
- LoRA는 대표적인 Parameter-Efficient Fine-tuning 기법이다.
- Fine-tuning에서는 데이터 품질, 평가 데이터, Data Leakage 방지가 중요하다.
- Fine-tuning 후에는 반드시 Baseline과 비교해 실제 개선 여부를 확인해야 한다.
- Fine-tuning은 비용이 들기 때문에 필요한 문제인지 먼저 판단해야 한다.