# LangChain / LangGraph 개념 정리

## 1. LangChain

LangChain은 LLM 애플리케이션을 만들기 위한 프레임워크이다.

LLM을 단순히 호출하는 것을 넘어서 Prompt, Model, Retriever, Tool, Agent, Memory 등을 연결하여 복잡한 LLM 기반 서비스를 구성할 수 있도록 도와준다.

```text id="4as9l2"
Prompt
→ LLM
→ Output Parser
→ Result
```

LangChain은 LLM을 활용한 검색, 질의응답, 문서 요약, Agent, RAG 시스템 등을 구현할 때 자주 사용된다.

---

## 2. LangChain이 필요한 이유

LLM 애플리케이션은 단순히 모델에 질문을 보내고 답변을 받는 것만으로 끝나지 않는 경우가 많다.

실제 서비스에서는 다음과 같은 작업이 함께 필요하다.

- Prompt Template 관리
- LLM 호출
- 출력 형식 파싱
- 문서 로딩
- 문서 Chunking
- Embedding
- Vector DB 검색
- Tool 호출
- Agent 실행
- Memory 관리
- 중간 단계 로깅

LangChain은 이런 구성 요소들을 연결하기 쉽게 만들어준다.

---

## 3. LangChain의 핵심 구성 요소

LangChain에서 자주 등장하는 구성 요소는 다음과 같다.

| 구성 요소 | 설명 |
|---|---|
| Prompt Template | Prompt 형식을 템플릿으로 관리 |
| Model | LLM 또는 Chat Model |
| Output Parser | 모델 출력을 원하는 형식으로 변환 |
| Chain | 여러 단계를 순서대로 연결 |
| Retriever | 관련 문서를 검색 |
| Tool | Agent가 사용할 외부 기능 |
| Agent | LLM이 도구를 선택해 작업 수행 |
| Memory | 대화나 작업 상태 저장 |

---

## 4. Prompt Template

Prompt Template은 반복적으로 사용할 Prompt 구조를 미리 정의한 것이다.

입력값만 바꿔서 같은 형식의 Prompt를 여러 번 생성할 수 있다.

```text id="tmau4u"
너는 {role}이야.

다음 내용을 {task}해줘.

입력:
{input}

출력 형식:
{output_format}
```

Prompt Template을 사용하면 Prompt를 일관되게 관리할 수 있고, 수정과 실험도 쉬워진다.

---

## 5. Model

Model은 실제로 텍스트를 생성하거나 처리하는 LLM을 의미한다.

LangChain에서는 다양한 LLM 또는 Chat Model을 연결해 사용할 수 있다.

```text id="uqj2uc"
Prompt
→ Model
→ Response
```

Model은 사용자의 입력과 Prompt를 바탕으로 답변을 생성한다.

---

## 6. Output Parser

Output Parser는 LLM의 출력 결과를 원하는 형식으로 변환하는 역할을 한다.

LLM은 자연어로 답변하기 때문에, 서비스에서 사용하려면 JSON, 리스트, 표, 객체 형태로 파싱해야 하는 경우가 있다.

```text id="k3wg34"
LLM Output:
"긍정입니다. 이유는 배송이 빠르기 때문입니다."

Parsed Output:
{
  "label": "긍정",
  "reason": "배송이 빠르기 때문"
}
```

Output Parser를 사용하면 모델 출력을 후속 로직에서 더 안정적으로 사용할 수 있다.

---

## 7. Chain

Chain은 여러 단계를 순서대로 연결한 구조이다.

예를 들어 입력을 Prompt에 넣고, LLM을 호출한 뒤, 결과를 파싱하는 과정을 하나의 Chain으로 만들 수 있다.

```text id="s1akm6"
Input
→ Prompt Template
→ LLM
→ Output Parser
→ Final Result
```

Chain은 절차가 비교적 고정된 작업에 적합하다.

---

## 8. Chain이 적합한 경우

Chain은 작업 흐름이 명확하고 순서가 고정되어 있을 때 사용하기 좋다.

### 예시

- 문서 요약
- 감성 분석
- 자기소개서 문장 다듬기
- 입력 문장을 정해진 형식으로 변환
- RAG에서 검색 후 답변 생성
- 프로젝트 설명을 README 형식으로 변환

절차가 정해져 있으면 Agent보다 Chain이 더 단순하고 안정적일 수 있다.

---

## 9. Agent

Agent는 LLM이 상황에 따라 어떤 Tool을 사용할지 결정하면서 작업을 수행하는 구조이다.

Chain은 흐름이 고정되어 있지만, Agent는 사용자의 요청에 따라 동적으로 행동을 선택할 수 있다.

```text id="ecqhyp"
User Request
→ Agent 판단
→ Tool 선택
→ Tool 실행
→ Observation 확인
→ Final Answer
```

Agent는 검색, 계산, DB 조회, 파일 처리처럼 여러 도구를 선택적으로 사용해야 할 때 유용하다.

---

## 10. Chain과 Agent 비교

| 구분 | Chain | Agent |
|---|---|---|
| 흐름 | 미리 정해진 순서 | 상황에 따라 동적으로 결정 |
| 안정성 | 상대적으로 높음 | 설계에 따라 달라짐 |
| 유연성 | 낮음 | 높음 |
| 도구 사용 | 정해진 단계에서 사용 | 필요할 때 선택 |
| 적합한 작업 | 반복적이고 고정된 작업 | 복잡하고 상황별 판단이 필요한 작업 |

실무에서는 무조건 Agent를 쓰기보다, 작업이 고정되어 있으면 Chain으로 단순하게 만드는 것이 좋다.

---

## 11. Retriever

Retriever는 사용자의 질문과 관련 있는 문서를 검색하는 구성 요소이다.

RAG 시스템에서 Retriever는 질문과 의미적으로 가까운 문서 Chunk를 찾아 LLM에게 전달한다.

```text id="m8h8wo"
User Question
→ Retriever
→ Relevant Documents
→ LLM Answer
```

Retriever는 Vector DB, 키워드 검색, Hybrid Search 등 다양한 방식으로 구현될 수 있다.

---

## 12. Tool

Tool은 Agent가 사용할 수 있는 외부 기능이다.

LangChain에서는 검색, 계산, DB 조회, 파일 읽기, API 호출 같은 기능을 Tool로 정의하여 Agent가 사용할 수 있게 만들 수 있다.

| Tool | 역할 |
|---|---|
| Search Tool | 웹 또는 문서 검색 |
| Calculator Tool | 계산 수행 |
| Database Tool | 데이터베이스 조회 |
| Retriever Tool | 문서 검색 |
| API Tool | 외부 서비스 호출 |
| File Tool | 파일 읽기 또는 처리 |

Tool은 Agent가 LLM의 한계를 보완하는 데 사용된다.

---

## 13. Memory

Memory는 이전 대화나 작업 상태를 저장하는 구조이다.

대화형 서비스에서는 사용자의 이전 발화나 이미 수행한 작업 정보를 기억해야 할 수 있다.

```text id="ep57hj"
User: 내 프로젝트 정리해줘.
Assistant: 어떤 프로젝트를 정리할까요?

User: Career.zip
Assistant: Career.zip 프로젝트를 기준으로 정리합니다.
```

Memory를 사용하면 Agent나 Chain이 이전 맥락을 이어서 작업할 수 있다.

---

## 14. LangChain과 RAG

LangChain은 RAG 시스템을 구성할 때 자주 사용된다.

RAG에서는 문서 로딩, Chunking, Embedding, Vector DB 저장, Retriever, Prompt, LLM 호출이 필요하다.

```text id="le6v6n"
Document Loader
→ Text Splitter
→ Embedding
→ Vector DB
→ Retriever
→ Prompt
→ LLM
→ Answer
```

LangChain은 이런 요소들을 연결하여 RAG 파이프라인을 만들 수 있게 도와준다.

---

## 15. RAG Chain

RAG Chain은 검색과 답변 생성을 하나의 흐름으로 묶은 구조이다.

```text id="eg2i79"
Question
→ Retrieve Documents
→ Combine Context
→ Prompt
→ LLM
→ Answer
```

RAG Chain에서는 검색된 문서를 Prompt에 넣고, LLM이 그 문서를 근거로 답변한다.

---

## 16. LangChain 사용 시 주의할 점

LangChain은 편리하지만, 추상화가 많기 때문에 내부 흐름을 이해하지 못하면 디버깅이 어려울 수 있다.

### 주의할 점

- Prompt가 실제로 어떻게 구성되는지 확인해야 한다.
- Retriever가 어떤 문서를 가져오는지 확인해야 한다.
- Tool 입력과 출력 형식을 명확히 해야 한다.
- Chain의 각 단계 결과를 로그로 확인해야 한다.
- Agent가 불필요한 Tool을 반복 호출하지 않는지 확인해야 한다.
- 라이브러리 버전에 따라 API가 달라질 수 있으므로 문서 확인이 필요하다.

---

## 17. LangGraph

LangGraph는 LLM 기반 Agent나 Workflow를 그래프 구조로 설계하기 위한 프레임워크이다.

LangChain이 여러 구성 요소를 연결하는 데 초점을 둔다면, LangGraph는 복잡한 Agent 흐름을 Node와 Edge로 명확하게 표현하는 데 강점이 있다.

```text id="fvgqny"
Node A
→ Node B
→ Node C
```

LangGraph는 상태를 관리하면서 여러 단계의 작업을 제어할 수 있다.

---

## 18. LangGraph가 필요한 이유

Agent가 복잡해질수록 단순 Chain이나 단일 Agent 구조로 관리하기 어려워진다.

예를 들어 검색, 답변 생성, 검증, 재검색, 최종 답변 생성 같은 단계를 조건에 따라 반복해야 할 수 있다.

LangGraph는 이런 흐름을 그래프 구조로 명확하게 설계할 수 있도록 도와준다.

### 적합한 경우

- 여러 단계가 있는 Agent
- 조건에 따라 분기되는 Workflow
- 검색 후 검증이 필요한 RAG
- 답변 품질이 낮으면 재검색해야 하는 구조
- 여러 Agent가 역할을 나누는 구조
- 상태 관리가 필요한 장기 작업

---

## 19. Graph

Graph는 Node와 Edge로 이루어진 구조이다.

LangGraph에서는 각 Node가 특정 작업을 수행하고, Edge가 다음에 어떤 Node로 이동할지 결정한다.

```text id="xzjhg8"
[질문 분석]
→ [문서 검색]
→ [답변 생성]
→ [답변 검증]
→ [최종 답변]
```

Graph 구조를 사용하면 Agent의 실행 흐름을 시각적으로 이해하기 쉽다.

---

## 20. Node

Node는 LangGraph에서 하나의 작업 단위를 의미한다.

각 Node는 입력 State를 받아 특정 작업을 수행하고, 변경된 State를 반환한다.

### Node 예시

| Node | 역할 |
|---|---|
| 질문 분석 Node | 사용자 질문 의도 파악 |
| 검색 Node | 관련 문서 검색 |
| 답변 생성 Node | LLM으로 답변 생성 |
| 검증 Node | 답변이 근거에 맞는지 확인 |
| 재검색 Node | 검색 결과가 부족할 때 다시 검색 |
| 최종 응답 Node | 사용자에게 답변 반환 |

---

## 21. Edge

Edge는 한 Node에서 다음 Node로 이동하는 연결선이다.

단순히 다음 단계로 이동할 수도 있고, 조건에 따라 다른 Node로 분기할 수도 있다.

```text id="wmhr87"
답변 검증 성공 → 최종 응답
답변 검증 실패 → 재검색
```

Edge를 사용하면 고정된 순서뿐만 아니라 조건부 흐름을 만들 수 있다.

---

## 22. State

State는 LangGraph에서 현재 작업의 상태를 저장하는 데이터 구조이다.

Agent가 여러 Node를 거치면서 필요한 정보를 State에 저장하고 업데이트한다.

```text id="xsam34"
State:
- user_question
- rewritten_query
- retrieved_documents
- draft_answer
- validation_result
- final_answer
```

State를 명확하게 설계하면 복잡한 Agent 흐름을 안정적으로 관리할 수 있다.

---

## 23. Conditional Edge

Conditional Edge는 조건에 따라 다음 Node를 다르게 선택하는 구조이다.

예를 들어 검색 결과가 충분하면 답변 생성으로 가고, 부족하면 Query Rewriting으로 이동할 수 있다.

```text id="c9gh8j"
검색 결과 충분 → 답변 생성
검색 결과 부족 → Query Rewriting
```

Conditional Edge는 Agent가 상황에 따라 다른 경로를 선택하도록 만든다.

---

## 24. Loop

Loop는 특정 조건을 만족할 때까지 일부 Node를 반복하는 구조이다.

예를 들어 답변 검증에 실패하면 다시 검색하고, 다시 답변을 생성하도록 만들 수 있다.

```text id="gxaw8d"
검색
→ 답변 생성
→ 검증 실패
→ 재검색
→ 답변 생성
→ 검증 성공
→ 최종 답변
```

Loop를 사용할 때는 무한 반복을 막기 위해 최대 반복 횟수를 설정하는 것이 중요하다.

---

## 25. Checkpoint

Checkpoint는 Graph 실행 중간 상태를 저장하는 기능이다.

긴 작업이나 여러 단계의 Agent에서는 중간 상태를 저장해두면, 실행을 이어가거나 오류 발생 시 복구하기 쉽다.

### 필요한 이유

- 장기 작업 상태 유지
- 실행 중단 후 재개
- 디버깅
- 사용자별 세션 관리
- 중간 결과 추적

Checkpoint는 Agent의 안정성과 추적 가능성을 높이는 데 도움이 된다.

---

## 26. LangChain과 LangGraph 비교

| 구분 | LangChain | LangGraph |
|---|---|---|
| 중심 개념 | Chain, Tool, Agent | Graph, Node, Edge, State |
| 흐름 | 순차적 연결에 강함 | 조건 분기와 상태 관리에 강함 |
| 적합한 작업 | 단순 RAG, Prompt-LLM 흐름 | 복잡한 Agent, Multi-step Workflow |
| 상태 관리 | 상대적으로 단순 | 명시적 State 관리 |
| 장점 | 빠른 구현 | 복잡한 흐름 제어 |

LangChain은 LLM 구성 요소를 연결하는 데 유용하고, LangGraph는 복잡한 Agent 흐름을 구조화하는 데 유용하다.

---

## 27. LangGraph 기반 RAG 예시

LangGraph를 사용하면 RAG 흐름에 검증과 재검색 단계를 넣을 수 있다.

```text id="m2ufj8"
1. 사용자 질문 입력
2. 질문 재작성
3. 문서 검색
4. 답변 생성
5. 답변 검증
6. 검증 성공 시 최종 답변
7. 검증 실패 시 재검색 또는 답변 재생성
```

이런 구조는 단순 RAG보다 복잡하지만, 답변 품질을 관리하기 좋다.

---

## 28. LangGraph 기반 Agent 예시

```text id="vwixoh"
User Request
→ Intent Analysis Node
→ Tool Selection Node
→ Tool Execution Node
→ Result Validation Node
→ Final Response Node
```

각 단계가 Node로 분리되어 있으면 어떤 단계에서 문제가 발생했는지 추적하기 쉽다.

---

## 29. Multi-Agent 구조

LangGraph는 여러 Agent가 역할을 나누어 작업하는 Multi-Agent 구조에도 활용될 수 있다.

```text id="a3iooc"
Research Agent
→ Analysis Agent
→ Writing Agent
→ Review Agent
```

각 Agent를 하나의 Node로 보고, Graph 흐름에 따라 협업하도록 설계할 수 있다.

### 장점

- 역할 분리가 명확하다.
- 복잡한 작업을 나누어 처리할 수 있다.
- 각 Agent의 입력과 출력을 추적하기 쉽다.

### 한계

- 구조가 복잡해진다.
- 비용과 실행 시간이 늘어날 수 있다.
- Agent 간 결과 전달 방식이 중요하다.

---

## 30. LangChain / LangGraph 사용 시 로깅

LLM 애플리케이션에서는 각 단계의 입력과 출력을 기록하는 것이 중요하다.

특히 Agent나 Graph 구조에서는 중간 단계가 많기 때문에 로그가 없으면 오류 원인을 찾기 어렵다.

### 기록하면 좋은 정보

- 사용자 입력
- 구성된 Prompt
- 검색 Query
- 검색 결과
- Tool 호출 내역
- Node별 입력과 출력
- LLM 응답
- 검증 결과
- 최종 답변
- 오류 메시지
- 실행 시간

---

## 31. LangChain / LangGraph 사용 시 평가

LangChain과 LangGraph로 만든 시스템은 최종 답변뿐만 아니라 중간 단계도 평가해야 한다.

### 평가 항목

- Prompt가 의도대로 구성되었는가?
- Retriever가 관련 문서를 가져왔는가?
- Tool 선택이 적절했는가?
- Tool 결과를 올바르게 해석했는가?
- Graph 분기가 의도대로 동작했는가?
- 재검색이나 반복이 필요한 경우 제대로 수행되었는가?
- 최종 답변이 정확하고 근거에 충실한가?

---

## 32. LangChain / LangGraph 사용 시 주의할 점

- 단순한 작업에 지나치게 복잡한 구조를 쓰지 않는다.
- Chain, Agent, Graph 중 어떤 구조가 적합한지 먼저 판단한다.
- Prompt와 Tool 입출력 형식을 명확하게 관리한다.
- Graph의 State 구조를 처음부터 잘 설계한다.
- Loop가 있는 경우 최대 반복 횟수를 설정한다.
- 검색 결과와 답변 생성 결과를 분리해서 평가한다.
- 중간 단계 로그를 남겨 디버깅할 수 있게 한다.
- 라이브러리 API는 변경될 수 있으므로 공식 문서를 확인하며 구현한다.

---

## 33. 어떤 구조를 선택할까?

작업에 따라 적절한 구조를 선택하는 것이 중요하다.

| 상황 | 추천 구조 |
|---|---|
| 단순 Prompt 호출 | Prompt + Model |
| 출력 형식 변환 | Prompt + Model + Output Parser |
| 고정된 순서의 작업 | Chain |
| 문서 기반 질의응답 | RAG Chain |
| 도구 선택이 필요한 작업 | Agent |
| 조건 분기와 반복이 필요한 작업 | LangGraph |
| 여러 역할이 필요한 작업 | Multi-Agent Graph |

복잡한 구조가 항상 좋은 것은 아니다.  
작업이 단순하면 단순한 구조가 더 안정적이고 디버깅하기 쉽다.

---

## 34. 정리

- LangChain은 LLM 애플리케이션을 만들기 위한 프레임워크이다.
- LangChain은 Prompt, Model, Output Parser, Retriever, Tool, Agent 등을 연결하는 데 사용된다.
- Prompt Template은 반복되는 Prompt 형식을 일관되게 관리하는 데 유용하다.
- Output Parser는 LLM 출력을 원하는 형식으로 변환한다.
- Chain은 여러 단계를 순서대로 연결한 구조이다.
- Agent는 LLM이 상황에 따라 Tool을 선택하고 실행하는 구조이다.
- Retriever는 질문과 관련 있는 문서를 검색하는 역할을 한다.
- LangGraph는 Agent나 Workflow를 Graph 구조로 설계하기 위한 프레임워크이다.
- LangGraph에서는 Node, Edge, State를 중심으로 흐름을 구성한다.
- Conditional Edge를 사용하면 조건에 따라 다른 경로로 분기할 수 있다.
- Loop를 사용할 때는 무한 반복을 막기 위해 제한 조건이 필요하다.
- Checkpoint는 중간 상태 저장과 실행 재개에 도움이 된다.
- LangChain은 구성 요소 연결에 유용하고, LangGraph는 복잡한 흐름 제어와 상태 관리에 유용하다.
- 단순한 작업에는 단순한 구조를, 복잡한 작업에는 Graph 구조를 선택하는 것이 좋다.
