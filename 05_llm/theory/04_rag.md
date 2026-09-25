RAG 개념 정리

1. RAG

RAG는 Retrieval-Augmented Generation의 약자이다.

한국어로는 검색 증강 생성이라고 한다.

LLM이 답변을 생성하기 전에 외부 문서나 데이터베이스에서 관련 정보를 검색하고, 그 검색 결과를 근거로 답변을 생성하는 방식이다.

User Question
→ Retrieval
→ Retrieved Documents
→ LLM Prompt
→ Generated Answer

---

2. RAG가 필요한 이유

LLM은 강력하지만 모든 정보를 항상 정확하게 알고 있는 것은 아니다.

특히 다음과 같은 경우에는 LLM만으로 답변하기 어렵다.

- 최신 정보가 필요한 경우
- 사내 문서처럼 모델이 학습하지 않은 정보가 필요한 경우
- 특정 프로젝트 문서를 근거로 답해야 하는 경우
- 답변의 출처와 근거가 필요한 경우
- Hallucination을 줄여야 하는 경우

RAG는 LLM이 외부 지식을 검색해 활용하도록 만들어 이런 한계를 보완한다.

---

3. RAG의 핵심 아이디어

RAG는 모델의 내부 지식에만 의존하지 않고, 외부 문서를 검색하여 답변에 활용한다.

질문:
Career.zip에서 내가 담당한 역할이 뭐였어?

검색:
Career.zip 프로젝트 문서에서 관련 Chunk 검색

생성:
검색된 내용을 근거로 답변 생성

즉, RAG는 검색 Retrieval과 생성 Generation을 결합한 구조이다.

---

4. RAG의 기본 구성 요소

RAG 시스템은 보통 다음 요소로 구성된다.

구성 요소| 설명
Document| 검색 대상이 되는 원본 문서
Chunking| 문서를 작은 단위로 나누는 과정
Embedding Model| 문서와 질문을 벡터로 변환
Vector Database| Embedding Vector 저장 및 검색
Retriever| 질문과 관련 있는 문서를 검색
Prompt| 검색 결과와 질문을 LLM에 전달
LLM| 검색 결과를 바탕으로 답변 생성

---

5. RAG 전체 흐름

RAG는 크게 두 단계로 나눌 수 있다.

1. Indexing 단계
2. Retrieval & Generation 단계

[Indexing]
문서 수집
→ Chunking
→ Embedding
→ Vector DB 저장

[Retrieval & Generation]
질문 입력
→ 질문 Embedding
→ 관련 Chunk 검색
→ Prompt 구성
→ LLM 답변 생성

---

6. Indexing

Indexing은 문서를 검색 가능한 형태로 만들어 저장하는 과정이다.

RAG에서는 원본 문서를 그대로 사용하는 것이 아니라, 문서를 Chunk 단위로 나누고 Embedding하여 Vector DB에 저장한다.

Document
→ Chunk
→ Embedding Vector
→ Vector DB

Indexing 품질이 낮으면 검색 품질도 낮아지고, 최종 답변 품질도 떨어진다.

---

7. Document Loading

Document Loading은 RAG에서 사용할 문서를 불러오는 과정이다.

문서의 형태는 다양할 수 있다.

문서 유형| 예시
PDF| 보고서, 논문, 공고문
Markdown| GitHub README, 기술 문서
HTML| 웹페이지
CSV / Excel| 표 형식 데이터
Database| 사내 DB, 로그 데이터
Notion / Google Docs| 협업 문서

문서를 불러올 때는 텍스트 추출이 제대로 되었는지 확인해야 한다.

---

8. Chunking

Chunking은 긴 문서를 작은 조각으로 나누는 과정이다.

LLM의 Context Window에는 제한이 있고, 긴 문서를 하나의 벡터로 만들면 세부 정보가 희석될 수 있기 때문에 Chunking이 필요하다.

긴 문서
→ Chunk 1
→ Chunk 2
→ Chunk 3

Chunking은 RAG 성능에 큰 영향을 준다.

---

9. Chunk Size

Chunk Size는 하나의 Chunk가 가지는 길이를 의미한다.

Chunk Size| 장점| 한계
작음| 세부 정보 검색에 유리| 문맥 부족 가능
큼| 문맥 유지에 유리| 불필요한 정보 포함 가능

적절한 Chunk Size는 문서의 성격과 질문 유형에 따라 달라진다.

---

10. Chunk Overlap

Chunk Overlap은 인접한 Chunk 사이에 일부 내용을 겹치게 하는 방법이다.

문서를 자를 때 중요한 문맥이 끊기는 것을 줄이기 위해 사용한다.

Chunk 1: A B C D
Chunk 2: C D E F
Chunk 3: E F G H

Overlap이 너무 작으면 문맥이 끊길 수 있고, 너무 크면 중복 데이터가 많아질 수 있다.

---

11. Embedding

Embedding은 문서 Chunk와 사용자 질문을 숫자 벡터로 변환하는 과정이다.

RAG에서는 문서와 질문을 같은 Embedding Model로 벡터화해야 한다.

Document Chunk
→ Embedding Vector

User Question
→ Query Vector

두 벡터의 유사도를 계산하여 질문과 관련 있는 문서를 찾는다.

---

12. Vector Database

Vector Database는 Embedding Vector를 저장하고 유사도 검색을 수행하는 데이터베이스이다.

RAG에서는 문서 Chunk의 Embedding Vector와 Metadata를 Vector DB에 저장한다.

Chunk Text
+
Embedding Vector
+
Metadata
→ Vector Database

Metadata를 함께 저장하면 문서 출처, 페이지, 카테고리 등을 추적할 수 있다.

---

13. Retriever

Retriever는 사용자의 질문과 관련 있는 문서를 검색하는 역할을 한다.

질문을 Embedding한 뒤 Vector DB에서 유사한 Chunk를 가져온다.

Question
→ Query Embedding
→ Vector DB Search
→ Top-k Chunks

Retriever의 성능은 RAG 전체 성능에 직접적인 영향을 준다.

---

14. Top-k Retrieval

Top-k Retrieval은 질문과 가장 유사한 문서 Chunk k개를 가져오는 방식이다.

예를 들어 "top_k = 5"라면 관련성이 높은 Chunk 5개를 검색한다.

Top-k 값| 특징
작음| Prompt가 짧아지고 노이즈 감소 가능
큼| 필요한 정보를 놓칠 가능성 감소
너무 큼| 관련 없는 정보가 섞일 가능성 증가

Top-k는 검색 품질과 Prompt 길이를 함께 고려해서 정해야 한다.

---

15. Similarity Search

Similarity Search는 질문 벡터와 문서 벡터 사이의 유사도를 계산하여 가까운 문서를 찾는 방식이다.

대표적인 기준은 다음과 같다.

기준| 설명
Cosine Similarity| 벡터 방향의 유사도
Dot Product| 벡터 내적
Euclidean Distance| 벡터 간 거리

텍스트 Embedding 검색에서는 Cosine Similarity를 자주 사용한다.

---

16. Hybrid Search

Hybrid Search는 키워드 검색과 벡터 검색을 함께 사용하는 방식이다.

방식| 강점
Keyword Search| 정확한 단어, 숫자, 고유명사 검색에 강함
Vector Search| 의미적으로 비슷한 문서 검색에 강함
Hybrid Search| 두 방식의 장점 결합

예를 들어 "Career.zip", "SQLD", "2026년 9월"처럼 정확히 일치해야 하는 표현은 키워드 검색이 도움이 될 수 있다.

---

17. Reranking

Reranking은 1차 검색 결과를 다시 정렬하는 과정이다.

Vector DB에서 넓게 검색한 뒤, Reranker 모델이나 LLM을 사용해 질문과 더 관련 있는 문서를 상위로 올릴 수 있다.

Top-20 검색
→ Reranking
→ Top-5 선택
→ Prompt에 삽입

Reranking은 검색 결과의 정확도를 높이고, Prompt에 들어가는 노이즈를 줄이는 데 도움이 된다.

---

18. Prompt 구성

RAG에서는 검색된 문서를 Prompt에 포함하여 LLM에게 전달한다.

Prompt에는 보통 사용자 질문, 검색된 문서, 답변 지시가 들어간다.

사용자 질문:
{question}

검색된 문서:
{retrieved_context}

지시:
검색된 문서만 근거로 답변해줘.
문서에 없는 내용은 추측하지 말고 확인되지 않는다고 말해줘.

Prompt를 명확하게 작성해야 LLM이 검색된 근거를 제대로 활용할 수 있다.

---

19. Grounded Generation

Grounded Generation은 모델이 제공된 근거 자료에 기반해 답변을 생성하는 방식이다.

RAG에서는 LLM이 검색된 문서를 근거로 답변해야 한다.

중요한 원칙

- 검색된 문서에 있는 내용만 사용하기
- 문서에 없는 내용은 추측하지 않기
- 가능한 경우 출처를 함께 제시하기
- 질문에 직접 답하기
- 관련 없는 검색 결과는 사용하지 않기

Grounding이 잘 되어야 Hallucination을 줄일 수 있다.

---

20. Citation

Citation은 답변의 근거가 되는 문서 출처를 표시하는 것이다.

RAG 시스템에서는 답변이 어떤 문서를 기반으로 생성되었는지 보여주는 것이 중요하다.

Citation이 필요한 이유

- 답변 신뢰도 향상
- 사용자가 근거를 직접 확인 가능
- 잘못된 답변의 원인 추적 가능
- 문서 기반 QA에서 투명성 확보

RAG 답변에서는 가능하면 문서 제목, 페이지, 문단, URL 등을 함께 관리하는 것이 좋다.

---

21. Hallucination과 RAG

RAG는 Hallucination을 줄이는 데 도움이 된다.

LLM이 외부 문서를 참고해서 답변하기 때문이다.

하지만 RAG를 사용한다고 Hallucination이 완전히 사라지는 것은 아니다.

RAG에서도 오류가 나는 경우

- 관련 없는 문서가 검색된 경우
- 검색된 문서가 오래되었거나 틀린 경우
- LLM이 검색 문서를 잘못 해석한 경우
- 문서에 없는 내용을 모델이 추가한 경우
- Prompt가 근거 사용을 명확히 제한하지 않은 경우

따라서 RAG에서도 검색 품질과 답변 검증이 중요하다.

---

22. RAG의 장점

RAG는 LLM 활용에서 여러 장점을 가진다.

- 외부 문서를 근거로 답변할 수 있다.
- 최신 정보나 사내 문서를 활용할 수 있다.
- Hallucination을 줄이는 데 도움이 된다.
- Fine-tuning 없이 도메인 지식을 활용할 수 있다.
- 문서 출처를 함께 제공할 수 있다.
- 문서가 업데이트되면 검색 DB만 갱신해 반영할 수 있다.

---

23. RAG의 한계

RAG에도 한계가 있다.

- 검색이 잘못되면 답변도 잘못될 수 있다.
- 문서 품질이 낮으면 답변 품질도 낮아진다.
- Chunking 전략에 따라 성능 차이가 크다.
- 긴 검색 결과를 모두 Prompt에 넣을 수 없다.
- 숫자, 날짜, 고유명사 검색에서는 벡터 검색만으로 부족할 수 있다.
- 답변이 검색 문서에 충실한지 별도 평가가 필요하다.

---

24. Naive RAG

Naive RAG는 가장 기본적인 RAG 구조이다.

문서를 Chunking하고 Embedding한 뒤, 질문과 유사한 Chunk를 검색하여 LLM에 넣는 방식이다.

Document
→ Chunking
→ Embedding
→ Vector DB

Question
→ Retrieval
→ Prompt
→ Answer

구현은 간단하지만 검색 품질이나 문맥 연결이 부족할 수 있다.

---

25. Advanced RAG

Advanced RAG는 기본 RAG 구조를 개선한 방식이다.

대표적인 개선 방법은 다음과 같다.

- Hybrid Search
- Reranking
- Query Rewriting
- Metadata Filtering
- Multi-query Retrieval
- Context Compression
- Parent Document Retrieval
- Self-query Retrieval

문서 구조가 복잡하거나 질문 유형이 다양할수록 Advanced RAG 기법을 고려할 수 있다.

---

26. Query Rewriting

Query Rewriting은 사용자의 질문을 검색에 더 적합한 형태로 바꾸는 과정이다.

사용자의 질문이 짧거나 모호하면 검색 성능이 떨어질 수 있다.

원 질문:
그 프로젝트에서 내가 한 거 뭐였지?

변환된 질문:
Career.zip 프로젝트에서 사용자가 담당한 역할과 구현 기능은 무엇인가?

Query Rewriting을 사용하면 검색 대상 문서와 더 잘 매칭되는 질문을 만들 수 있다.

---

27. Multi-query Retrieval

Multi-query Retrieval은 하나의 질문을 여러 관점의 검색 쿼리로 확장하는 방법이다.

원 질문:
Career.zip에서 평가 모듈은 어떻게 만들었어?

검색 쿼리:
1. Career.zip 평가 모듈 구현 방식
2. AI 모의면접 답변 평가 로직
3. 약점 태그와 꼬리질문 생성 구조

여러 쿼리로 검색하면 필요한 문서를 놓칠 가능성을 줄일 수 있다.

---

28. Context Compression

Context Compression은 검색된 문서에서 질문과 관련 있는 부분만 압축하여 Prompt에 넣는 방법이다.

검색된 Chunk 전체를 넣으면 불필요한 정보가 많아질 수 있다.

Retrieved Chunk
→ 질문 관련 문장만 추출
→ 압축된 Context
→ LLM Prompt

Context Compression은 Prompt 길이를 줄이고 답변 품질을 높이는 데 도움이 될 수 있다.

---

29. Self-query Retrieval

Self-query Retrieval은 LLM이 사용자의 질문에서 검색 조건을 추출하여 Metadata Filtering에 활용하는 방법이다.

예를 들어 질문에 프로젝트명이나 날짜 조건이 포함되어 있다면, 이를 필터로 사용할 수 있다.

질문:
Finance.zip 프로젝트에서 MySQL을 어떻게 썼어?

추출 조건:
project = Finance.zip
keyword = MySQL

문서 Metadata가 잘 정리되어 있을수록 효과적이다.

---

30. RAG Evaluation

RAG 평가는 검색 단계와 생성 단계를 나누어 보는 것이 좋다.

평가 대상| 확인할 점
Retrieval| 질문과 관련 있는 문서를 잘 가져왔는가
Generation| 검색된 문서를 근거로 정확히 답했는가
Grounding| 답변이 근거 문서에 충실한가
Citation| 출처가 올바르게 연결되었는가
Helpfulness| 사용자의 질문에 충분히 도움이 되는가

RAG는 LLM 답변만 평가하면 원인을 알기 어렵기 때문에 검색 결과도 함께 평가해야 한다.

---

31. Retrieval 평가 지표

검색 단계에서는 다음과 같은 지표를 사용할 수 있다.

지표| 설명
Recall@k| 정답 문서가 상위 k개 안에 포함되었는지
Precision@k| 상위 k개 문서 중 관련 문서 비율
MRR| 정답 문서가 처음 등장한 순위 평가
NDCG| 순위와 관련도를 함께 고려

검색 품질이 낮으면 좋은 LLM을 사용해도 답변 품질이 낮아질 수 있다.

---

32. Generation 평가 기준

생성 단계에서는 다음 기준을 확인할 수 있다.

- 질문에 직접 답했는가?
- 검색된 문서의 내용을 정확히 반영했는가?
- 문서에 없는 내용을 추가하지 않았는가?
- 답변이 충분히 구체적인가?
- 출처와 답변 내용이 일치하는가?
- 사용자에게 이해하기 쉬운가?

RAG 답변은 자연스럽기만 한 것이 아니라, 근거에 충실해야 한다.

---

33. RAG 사용 시 주의할 점

- 문서 원본의 품질을 먼저 확인해야 한다.
- Chunking 전략을 실험해야 한다.
- Embedding Model과 검색 방식을 평가해야 한다.
- 정확한 단어 검색이 필요한 경우 Hybrid Search를 고려해야 한다.
- 검색 결과가 질문과 실제로 관련 있는지 확인해야 한다.
- 답변이 검색 문서에 없는 내용을 만들어내지 않는지 확인해야 한다.
- 문서가 수정되면 Vector DB도 업데이트해야 한다.
- Citation을 통해 답변 근거를 추적할 수 있어야 한다.

---

34. RAG 활용 분야

RAG는 다양한 LLM 서비스에 활용된다.

분야| 활용 예시
문서 QA| 사내 문서 기반 질의응답
고객 상담| FAQ와 매뉴얼 기반 답변
금융| 공시, 리포트, 뉴스 기반 분석
법률| 계약서, 판례, 규정 검색
교육| 강의자료 기반 학습 도우미
채용| JD, 이력서, 프로젝트 문서 기반 면접 질문
개발| 기술 문서와 코드베이스 검색
개인 지식 관리| 노션, 메모, 공부 기록 기반 검색

---

35. 정리

- RAG는 Retrieval-Augmented Generation의 약자로, 검색 증강 생성 방식이다.
- RAG는 외부 문서를 검색하여 LLM 답변에 근거로 활용한다.
- RAG는 LLM의 최신성 부족, 사내 문서 접근 불가, Hallucination 문제를 보완할 수 있다.
- RAG는 Indexing 단계와 Retrieval & Generation 단계로 나눌 수 있다.
- Indexing에서는 문서를 Chunking하고 Embedding하여 Vector DB에 저장한다.
- Retrieval에서는 사용자 질문과 관련 있는 문서 Chunk를 검색한다.
- Generation에서는 검색된 문서를 Prompt에 넣어 LLM이 답변을 생성한다.
- Chunk Size와 Chunk Overlap은 검색 품질에 큰 영향을 준다.
- Hybrid Search는 키워드 검색과 벡터 검색을 함께 사용하는 방식이다.
- Reranking은 1차 검색 결과를 다시 정렬하여 관련성 높은 문서를 선별한다.
- RAG는 Hallucination을 줄일 수 있지만 완전히 제거하지는 못한다.
- RAG 평가는 Retrieval과 Generation을 나누어 확인하는 것이 좋다.
- RAG 답변은 자연스러움뿐만 아니라 근거 충실성과 출처 정확성이 중요하다.