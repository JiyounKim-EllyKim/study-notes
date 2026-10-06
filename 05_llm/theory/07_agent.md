# Agent 개념 정리

## 1. Agent

Agent는 LLM이 단순히 답변만 생성하는 것이 아니라, 목표를 달성하기 위해 스스로 필요한 행동을 선택하고 도구를 사용하며 여러 단계를 수행하도록 만든 시스템이다.

일반적인 LLM은 사용자의 질문에 텍스트로 답변한다.

반면 Agent는 질문에 바로 답하지 않고, 필요한 경우 검색, 계산, 데이터베이스 조회, 코드 실행, 파일 읽기 같은 도구를 사용해 문제를 해결한다.

```text id="ayuf94"
User Request
→ LLM 판단
→ Tool 선택
→ Tool 실행
→ 결과 확인
→ 다음 행동 결정
→ Final Answer
```

---

## 2. Agent가 필요한 이유

LLM은 자연어 이해와 생성에는 강하지만, 모든 작업을 혼자 정확히 수행할 수 있는 것은 아니다.

예를 들어 최신 정보를 찾아야 하거나, 실제 계산이 필요하거나, 데이터베이스에서 값을 조회해야 하는 경우 LLM 자체의 내부 지식만으로는 한계가 있다.

Agent는 LLM이 외부 도구를 활용하도록 만들어 이런 한계를 보완한다.

### Agent가 필요한 경우

- 최신 정보를 검색해야 하는 경우
- 정확한 계산이 필요한 경우
- 데이터베이스를 조회해야 하는 경우
- 여러 단계를 거쳐야 하는 복잡한 작업
- 파일을 읽고 분석해야 하는 작업
- API를 호출해야 하는 작업
- 사용자의 요청에 따라 행동 계획을 세워야 하는 작업

---

## 3. 일반 LLM과 Agent의 차이

| 구분 | 일반 LLM | Agent |
|---|---|---|
| 역할 | 입력에 대한 답변 생성 | 목표 달성을 위한 행동 수행 |
| 도구 사용 | 보통 사용하지 않음 | 필요 시 도구 사용 |
| 작업 방식 | 한 번에 답변 생성 | 계획, 실행, 관찰, 반복 |
| 활용 예시 | 요약, 번역, 질문 답변 | 검색, 예약, 분석, 자동화 |
| 장점 | 단순하고 빠름 | 복잡한 작업 처리 가능 |
| 한계 | 외부 행동 불가 | 설계와 검증이 더 복잡함 |

---

## 4. Agent의 핵심 구성 요소

Agent는 보통 다음 요소로 구성된다.

| 구성 요소 | 설명 |
|---|---|
| LLM | 판단과 의사결정을 담당 |
| Tool | 검색, 계산, DB 조회 등 외부 기능 |
| Prompt | Agent의 역할과 행동 규칙 정의 |
| Memory | 이전 대화나 작업 상태 저장 |
| Planner | 작업 단계를 계획 |
| Executor | 실제 도구 호출과 실행 |
| Observation | 도구 실행 결과 |
| Final Answer | 사용자에게 제공하는 최종 답변 |

---

## 5. Tool

Tool은 Agent가 사용할 수 있는 외부 기능이다.

LLM 자체가 직접 수행하기 어려운 작업을 Tool을 통해 처리한다.

### Tool 예시

| Tool | 역할 |
|---|---|
| Search Tool | 웹이나 문서 검색 |
| Calculator | 정확한 계산 수행 |
| Database Tool | SQL 또는 DB 조회 |
| File Reader | 파일 내용 읽기 |
| Code Interpreter | 코드 실행 및 분석 |
| API Tool | 외부 서비스 호출 |
| Calendar Tool | 일정 조회 및 생성 |

Agent는 사용자의 요청을 보고 어떤 Tool이 필요한지 판단한다.

---

## 6. Tool Calling

Tool Calling은 LLM이 필요한 도구를 선택하고 호출하는 방식이다.

예를 들어 사용자가 “오늘 환율로 100달러가 얼마야?”라고 물으면, Agent는 환율 정보를 조회하거나 계산 도구를 사용할 수 있다.

```text id="zxzg88"
사용자 요청
→ 필요한 Tool 판단
→ Tool 호출
→ Tool 결과 확인
→ 답변 생성
```

Tool Calling을 사용하면 LLM의 한계를 외부 기능으로 보완할 수 있다.

---

## 7. Action

Action은 Agent가 수행하는 구체적인 행동이다.

예를 들어 검색하기, 계산하기, 파일 읽기, 데이터베이스 조회하기 등이 Action에 해당한다.

```text id="vv1ov6"
Thought: 최신 정보가 필요하다.
Action: Search Tool 호출
Observation: 검색 결과 확인
Final Answer: 검색 결과를 바탕으로 답변
```

Agent는 상황에 따라 여러 Action을 순차적으로 수행할 수 있다.

---

## 8. Observation

Observation은 Agent가 Tool을 실행한 뒤 얻는 결과이다.

Agent는 Observation을 보고 다음 행동을 결정하거나 최종 답변을 생성한다.

```text id="xognk2"
Action:
문서 검색

Observation:
관련 문서 3개 검색됨

Next Step:
검색된 문서를 요약하여 답변 생성
```

Observation이 부정확하거나 불충분하면 Agent의 최종 답변도 부정확해질 수 있다.

---

## 9. Agent의 기본 흐름

Agent는 보통 다음 흐름으로 동작한다.

```text id="aeuvlg"
1. 사용자 요청 입력
2. LLM이 요청 분석
3. 필요한 작업 계획 수립
4. 사용할 Tool 선택
5. Tool 실행
6. Observation 확인
7. 추가 Tool 사용 여부 판단
8. 최종 답변 생성
```

이 흐름은 단순한 질문 답변보다 복잡하지만, 더 다양한 작업을 수행할 수 있게 해준다.

---

## 10. ReAct

ReAct는 Reasoning and Acting의 약자이다.

LLM이 생각 Reasoning과 행동 Acting을 번갈아 수행하면서 문제를 해결하는 방식이다.

```text id="pjjsb8"
Thought: 문제를 해결하려면 최신 정보가 필요하다.
Action: Search
Observation: 검색 결과 확인
Thought: 검색 결과를 바탕으로 답변할 수 있다.
Final Answer: 최종 답변
```

ReAct는 Agent가 단순히 답을 생성하는 것이 아니라, 필요한 행동을 선택하며 문제를 해결하도록 만든다.

---

## 11. Planning

Planning은 Agent가 목표를 달성하기 위해 필요한 작업 단계를 세우는 과정이다.

복잡한 요청일수록 먼저 계획을 세우고 순서대로 실행하는 것이 중요하다.

```text id="nlo3tw"
요청:
프로젝트 문서를 읽고 README 초안을 만들어줘.

계획:
1. 프로젝트 문서 읽기
2. 핵심 기능 추출
3. 기술 스택 정리
4. 역할과 성과 정리
5. README 형식으로 작성
```

Planning이 잘못되면 Agent가 불필요한 Tool을 사용하거나 중요한 단계를 놓칠 수 있다.

---

## 12. Execution

Execution은 Agent가 세운 계획에 따라 실제 행동을 수행하는 단계이다.

예를 들어 파일을 읽거나, 검색을 하거나, 계산을 수행하는 과정이 Execution이다.

```text id="s1okvw"
Plan:
문서를 읽고 요약한다.

Execution:
File Reader Tool을 사용해 문서 내용을 읽는다.
```

Agent는 실행 결과를 바탕으로 다음 단계로 넘어간다.

---

## 13. Memory

Memory는 Agent가 이전 대화나 작업 상태를 기억하기 위해 사용하는 정보 저장 구조이다.

LLM은 기본적으로 현재 입력 Context 안의 정보만 직접 참고할 수 있으므로, 장기적인 작업에는 Memory가 필요할 수 있다.

### Memory 예시

- 사용자 선호
- 이전 대화 내용
- 진행 중인 작업 상태
- 이미 수행한 Tool 결과
- 이전에 검색한 문서
- 프로젝트 설정값

Memory를 사용하면 Agent가 여러 단계의 작업을 더 일관되게 수행할 수 있다.

---

## 14. Short-term Memory와 Long-term Memory

| 구분 | 설명 | 예시 |
|---|---|---|
| Short-term Memory | 현재 작업이나 대화 안에서 유지되는 정보 | 방금 검색한 결과 |
| Long-term Memory | 여러 세션에 걸쳐 유지되는 정보 | 사용자 선호, 프로젝트 설정 |

Short-term Memory는 현재 Agent 실행 중 필요한 정보를 유지하는 데 사용된다.

Long-term Memory는 반복적으로 활용되는 정보를 저장하는 데 사용할 수 있다.

---

## 15. Agent State

Agent State는 Agent가 현재 어떤 상태에 있는지 나타내는 정보이다.

Agent가 여러 단계를 거쳐 작업할 때, 현재까지의 입력, 중간 결과, Tool 실행 결과, 다음 단계 등을 State로 관리할 수 있다.

```text id="srf6am"
State:
- user_request
- current_step
- retrieved_documents
- tool_results
- final_answer
```

LangGraph 같은 프레임워크에서는 State를 중심으로 Agent 흐름을 구성할 수 있다.

---

## 16. Single Agent

Single Agent는 하나의 Agent가 전체 작업을 수행하는 구조이다.

하나의 LLM이 계획을 세우고 Tool을 사용하며 최종 답변까지 생성한다.

### 장점

- 구조가 단순하다.
- 구현과 관리가 비교적 쉽다.
- 작은 규모의 작업에 적합하다.

### 한계

- 복잡한 작업에서는 역할이 많아져 성능이 불안정할 수 있다.
- 모든 판단을 하나의 Agent가 담당하므로 오류가 누적될 수 있다.

---

## 17. Multi-Agent

Multi-Agent는 여러 Agent가 각자 역할을 나누어 작업하는 구조이다.

예를 들어 하나의 Agent는 검색을 담당하고, 다른 Agent는 분석을 담당하며, 또 다른 Agent는 최종 보고서를 작성할 수 있다.

```text id="rz23on"
Research Agent
→ 관련 자료 검색

Analysis Agent
→ 자료 분석

Writing Agent
→ 최종 문서 작성
```

### 장점

- 역할 분리가 가능하다.
- 복잡한 작업을 나누어 처리할 수 있다.
- 각 Agent를 특정 역할에 최적화할 수 있다.

### 한계

- 구조가 복잡하다.
- Agent 간 통신과 조율이 필요하다.
- 비용과 실행 시간이 증가할 수 있다.
- 오류 발생 지점을 추적하기 어려울 수 있다.

---

## 18. Agent와 Workflow의 차이

Agent와 Workflow는 모두 여러 단계를 수행할 수 있지만, 의사결정 방식에 차이가 있다.

| 구분 | Workflow | Agent |
|---|---|---|
| 흐름 | 미리 정해진 순서 | 상황에 따라 동적으로 결정 |
| Tool 사용 | 정해진 단계에서 사용 | 필요에 따라 선택 |
| 유연성 | 낮음 | 높음 |
| 예측 가능성 | 높음 | 상대적으로 낮음 |
| 적합한 작업 | 절차가 고정된 작업 | 상황에 따라 달라지는 작업 |

작업 절차가 명확하면 Workflow가 더 안정적일 수 있고, 상황에 따라 판단이 필요하면 Agent가 유용할 수 있다.

---

## 19. Agent와 RAG

RAG는 외부 문서를 검색해 LLM 답변에 활용하는 구조이다.

Agent는 RAG를 하나의 Tool처럼 사용할 수 있다.

```text id="gpe3ci"
User Question
→ Agent 판단
→ RAG Search Tool 사용
→ 문서 검색 결과 확인
→ 답변 생성
```

즉, RAG는 Agent 시스템 안에서 검색 도구로 활용될 수 있다.

---

## 20. Agent와 Function Calling

Function Calling은 LLM이 미리 정의된 함수나 API를 호출할 수 있도록 하는 방식이다.

Agent는 Function Calling을 이용해 Tool을 실행할 수 있다.

```text id="we3yte"
함수:
search_documents(query)
calculate(expression)
get_user_profile(user_id)

LLM:
필요한 함수 선택 후 호출
```

Function Calling을 사용하면 Tool 입력과 출력 형식을 구조화할 수 있다.

---

## 21. Agent와 LangChain

LangChain은 LLM 애플리케이션을 만들기 위한 프레임워크 중 하나이다.

Prompt, Model, Retriever, Tool, Agent 등을 연결해 복잡한 LLM 워크플로우를 구성할 수 있다.

### LangChain에서 다루는 요소

- Prompt Template
- LLM
- Retriever
- Tool
- Agent
- Chain
- Memory

LangChain은 Agent 구조를 빠르게 실험하고 구현하는 데 사용할 수 있다.

---

## 22. Agent와 LangGraph

LangGraph는 LLM 기반 Agent나 Workflow를 그래프 구조로 구성하기 위한 프레임워크이다.

각 Node는 특정 작업을 수행하고, Edge는 다음 단계로 이동하는 조건을 나타낼 수 있다.

```text id="mdagn5"
Node 1: 질문 분석
Node 2: 검색
Node 3: 답변 생성
Node 4: 검증
```

LangGraph는 상태 State를 관리하면서 복잡한 Agent 흐름을 명확하게 설계하는 데 유용하다.

---

## 23. Guardrail

Guardrail은 Agent가 안전하고 의도한 범위 안에서 동작하도록 제한하는 장치이다.

Agent는 Tool을 사용할 수 있기 때문에, 잘못된 Tool 호출이나 위험한 행동을 막는 설계가 필요하다.

### Guardrail 예시

- 허용된 Tool만 사용
- 민감 정보 출력 금지
- 위험한 명령 실행 제한
- 사용자 확인 후 실행
- 외부 입력의 지시 무시
- 응답 전 검증 단계 추가
- 권한 범위 제한

---

## 24. Human-in-the-loop

Human-in-the-loop는 Agent가 중요한 작업을 수행하기 전에 사람의 확인을 받도록 하는 구조이다.

예를 들어 이메일 발송, 결제, 파일 삭제, 데이터 수정 같은 작업은 자동으로 실행하기보다 사용자 승인 후 수행하는 것이 안전하다.

```text id="julrns"
Agent:
이메일 초안을 작성했습니다. 발송할까요?

User:
응, 보내줘.

Agent:
이메일 발송 Tool 실행
```

Human-in-the-loop는 Agent 시스템의 안전성과 신뢰성을 높이는 데 중요하다.

---

## 25. Agent의 장점

Agent는 LLM의 활용 범위를 크게 넓힐 수 있다.

### 장점

- 복잡한 작업을 단계적으로 수행할 수 있다.
- 외부 도구를 사용해 정확성을 높일 수 있다.
- 검색, 계산, 파일 처리 등 다양한 기능과 연결할 수 있다.
- 사용자의 요청에 따라 동적으로 행동을 선택할 수 있다.
- RAG, DB, API와 결합해 실제 서비스로 확장할 수 있다.

---

## 26. Agent의 한계

Agent는 강력하지만 설계가 복잡하고 오류 가능성도 있다.

### 한계

- Tool 선택을 잘못할 수 있다.
- 잘못된 Observation을 바탕으로 답변할 수 있다.
- 실행 비용과 시간이 증가할 수 있다.
- 복잡한 흐름에서는 디버깅이 어렵다.
- 예측하기 어려운 행동을 할 수 있다.
- 보안과 권한 관리가 중요하다.
- 외부 도구 결과를 잘못 해석할 수 있다.

---

## 27. Agent Evaluation

Agent는 단순 답변 모델보다 평가가 더 복잡하다.

최종 답변뿐만 아니라 중간 단계도 평가해야 한다.

### 평가 기준

- 사용자의 목표를 달성했는가?
- 올바른 Tool을 선택했는가?
- Tool 입력이 적절했는가?
- Tool 결과를 제대로 해석했는가?
- 불필요한 단계를 수행하지 않았는가?
- 최종 답변이 정확하고 유용한가?
- 위험한 행동을 하지 않았는가?

---

## 28. Agent Logging

Agent Logging은 Agent의 실행 과정을 기록하는 것이다.

Agent는 여러 Tool을 사용하고 중간 결정을 내리기 때문에, 로그가 있어야 오류 원인을 추적할 수 있다.

### 기록하면 좋은 정보

- 사용자 요청
- Agent의 선택한 Tool
- Tool 입력값
- Tool 출력값
- 중간 상태
- 최종 답변
- 오류 메시지
- 실행 시간

서비스 환경에서는 Agent Logging이 매우 중요하다.

---

## 29. Agent 사용 시 주의할 점

- Agent가 꼭 필요한 문제인지 먼저 판단해야 한다.
- 절차가 고정된 작업은 Workflow가 더 안정적일 수 있다.
- Tool 권한을 최소화해야 한다.
- 중요한 작업은 사용자 확인 단계를 넣어야 한다.
- Tool 결과를 검증하는 단계가 필요하다.
- Prompt Injection에 주의해야 한다.
- 실행 로그를 남겨야 한다.
- 비용과 지연 시간을 고려해야 한다.
- 최종 답변뿐만 아니라 중간 과정도 평가해야 한다.

---

## 30. Agent 활용 분야

Agent는 다양한 LLM 서비스에서 활용될 수 있다.

| 분야 | 활용 예시 |
|---|---|
| 검색 | 웹 검색 후 답변 생성 |
| 데이터 분석 | 데이터 조회, 코드 실행, 시각화 |
| 문서 작업 | 파일 읽기, 요약, 보고서 작성 |
| 고객 상담 | 문의 분석, 매뉴얼 검색, 답변 생성 |
| 일정 관리 | 일정 조회, 일정 생성, 리마인드 |
| 개발 | 코드 검색, 테스트 실행, 오류 분석 |
| 채용 | JD 분석, 면접 질문 생성, 답변 평가 |
| 개인 비서 | 메일 정리, 일정 확인, 작업 자동화 |

---

## 31. 정리

- Agent는 LLM이 목표 달성을 위해 도구를 사용하고 여러 단계를 수행하도록 만든 시스템이다.
- 일반 LLM은 주로 답변을 생성하지만, Agent는 계획, 실행, 관찰, 최종 답변 생성을 수행한다.
- Tool은 Agent가 사용할 수 있는 외부 기능이다.
- Tool Calling은 LLM이 필요한 도구를 선택하고 호출하는 방식이다.
- ReAct는 Reasoning과 Acting을 번갈아 수행하는 Agent 방식이다.
- Agent는 Planning, Execution, Observation을 반복하며 문제를 해결할 수 있다.
- Memory는 이전 대화나 작업 상태를 저장하는 데 사용된다.
- Single Agent는 하나의 Agent가 전체 작업을 수행하는 구조이다.
- Multi-Agent는 여러 Agent가 역할을 나누어 작업하는 구조이다.
- Agent는 RAG, DB, API, 파일 처리, 검색 도구와 결합할 수 있다.
- Agent는 유연하지만 예측 가능성이 낮을 수 있으므로 Guardrail이 필요하다.
- 중요한 작업에는 Human-in-the-loop 구조를 적용하는 것이 좋다.
- Agent는 최종 답변뿐만 아니라 Tool 선택과 중간 실행 과정도 평가해야 한다.
