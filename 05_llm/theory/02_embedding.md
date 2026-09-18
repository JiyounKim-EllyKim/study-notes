Embedding 개념 정리

1. Embedding

Embedding은 텍스트, 문장, 문서 등을 숫자 벡터로 변환하는 방법이다.

LLM 기반 서비스에서는 텍스트의 의미를 벡터 공간에 표현하기 위해 Embedding을 사용한다.

의미가 비슷한 텍스트는 벡터 공간에서 가까운 위치에 놓이고, 의미가 다른 텍스트는 상대적으로 먼 위치에 놓이도록 표현된다.

---

2. Embedding이 필요한 이유

컴퓨터는 자연어 문장을 그대로 이해하지 못한다.

텍스트를 검색하거나 비교하거나 분류하려면, 문장을 숫자로 바꾸어야 한다.

Embedding은 단순히 단어가 같은지 비교하는 것이 아니라, 의미적으로 얼마나 비슷한지를 비교할 수 있게 해준다.

텍스트
→ Embedding Model
→ Vector
→ Similarity Search

---

3. Embedding Vector

Embedding Vector는 텍스트를 숫자 배열로 표현한 것이다.

"배송이 빨라서 좋았어요"
→ [0.12, -0.45, 0.33, 0.08, ...]

이 벡터는 사람이 직접 해석하기는 어렵지만, 모델은 이 숫자들을 이용해 텍스트의 의미적 특징을 표현한다.

---

4. Semantic Similarity

Semantic Similarity는 두 텍스트가 의미적으로 얼마나 비슷한지를 나타낸다.

예를 들어 다음 문장들은 단어는 다르지만 의미는 비슷하다.

배송이 빨라서 만족했어요.
물건이 금방 도착해서 좋았어요.

키워드 기반 검색에서는 두 문장이 다르게 보일 수 있지만, Embedding 기반 검색에서는 의미가 비슷하다고 판단할 수 있다.

---

5. Keyword Search와 Semantic Search

구분| Keyword Search| Semantic Search
기준| 단어 일치| 의미 유사도
장점| 정확한 키워드 검색에 강함| 표현이 달라도 의미가 비슷하면 검색 가능
한계| 같은 단어가 없으면 찾기 어려움| 정확한 단어 일치가 중요한 경우 약할 수 있음
예시| SQL "LIKE", 검색어 매칭| Embedding 기반 유사도 검색

Embedding은 Semantic Search를 가능하게 하는 핵심 기술이다.

---

6. Embedding Model

Embedding Model은 텍스트를 벡터로 변환하는 모델이다.

입력으로 문장이나 문서를 넣으면, 해당 텍스트의 의미를 나타내는 벡터를 출력한다.

Input Text
→ Embedding Model
→ Embedding Vector

LLM 애플리케이션에서는 생성 모델과 Embedding Model을 구분해서 사용하는 경우가 많다.

---

7. Embedding Model과 LLM의 차이

구분| Embedding Model| LLM
주요 역할| 텍스트를 벡터로 변환| 텍스트 생성, 질의응답, 요약
출력| 숫자 벡터| 자연어 답변
활용| 검색, 유사도 비교, RAG| 답변 생성, 추론, 문서 작성
예시| 문서 Embedding| Chatbot, QA

Embedding Model은 답변을 생성하는 모델이 아니라, 텍스트를 비교 가능한 벡터로 바꾸는 모델이다.

---

8. Document Embedding

Document Embedding은 문서 전체 또는 문서의 일부를 벡터로 변환하는 것이다.

RAG 시스템에서는 문서를 여러 조각으로 나눈 뒤, 각 조각을 Embedding하여 Vector DB에 저장한다.

문서
→ Chunking
→ 각 Chunk Embedding
→ Vector DB 저장

이후 사용자의 질문과 의미가 가까운 문서 조각을 검색할 수 있다.

---

9. Query Embedding

Query Embedding은 사용자의 질문이나 검색어를 벡터로 변환하는 것이다.

사용자 질문
→ Embedding Model
→ Query Vector

이 Query Vector와 문서 Embedding Vector를 비교하여 가장 관련 있는 문서를 찾는다.

---

10. Embedding 기반 검색 흐름

Embedding 기반 검색은 보통 다음 순서로 진행된다.

1. 문서를 Chunk 단위로 나눈다.
2. 각 Chunk를 Embedding Vector로 변환한다.
3. Vector DB에 저장한다.
4. 사용자 질문을 Embedding Vector로 변환한다.
5. 질문 Vector와 문서 Vector의 유사도를 계산한다.
6. 가장 유사한 문서 Chunk를 검색한다.
7. 검색된 문서를 LLM Prompt에 넣어 답변을 생성한다.

이 흐름은 RAG의 핵심 구조와 연결된다.

---

11. Cosine Similarity

Cosine Similarity는 두 벡터의 방향이 얼마나 비슷한지를 계산하는 방법이다.

Embedding 기반 검색에서 자주 사용된다.

값은 보통 -1부터 1 사이를 가진다.

값| 의미
1에 가까움| 매우 유사
0에 가까움| 관련성이 낮음
-1에 가까움| 반대 방향

텍스트 Embedding에서는 의미가 비슷한 문장일수록 Cosine Similarity가 높게 나올 수 있다.

---

12. Euclidean Distance

Euclidean Distance는 두 벡터 사이의 직선 거리를 계산하는 방법이다.

거리가 가까울수록 두 벡터가 비슷하다고 볼 수 있다.

기준| 의미
거리 작음| 유사도 높음
거리 큼| 유사도 낮음

Embedding 검색에서는 Cosine Similarity, Dot Product, Euclidean Distance 등을 사용할 수 있다.

---

13. Dense Vector

Embedding Vector는 보통 Dense Vector이다.

Dense Vector는 대부분의 값이 0이 아닌 실수값으로 채워진 벡터이다.

구분| Sparse Vector| Dense Vector
특징| 대부분 0| 대부분 실수값
예시| Bag of Words, TF-IDF| Embedding
의미 표현| 단어 빈도 중심| 의미 중심
차원| 매우 클 수 있음| 상대적으로 압축된 표현

Embedding은 텍스트의 의미를 낮은 차원의 Dense Vector로 압축해 표현한다.

---

14. Sparse Retrieval과 Dense Retrieval

구분| Sparse Retrieval| Dense Retrieval
표현 방식| TF-IDF, BM25| Embedding
검색 기준| 키워드 일치| 의미 유사도
장점| 정확한 단어 매칭에 강함| 표현이 달라도 의미가 비슷하면 검색 가능
한계| 동의어, 표현 차이에 약함| 정확한 키워드가 중요한 검색에 약할 수 있음

실제 검색 시스템에서는 Sparse Retrieval과 Dense Retrieval을 함께 사용하는 Hybrid Search를 사용하기도 한다.

---

15. Chunking과 Embedding

긴 문서를 그대로 Embedding하기보다, 적절한 크기의 Chunk로 나누어 Embedding하는 경우가 많다.

문서 전체를 하나의 벡터로 만들면 세부 정보가 희석될 수 있기 때문이다.

긴 문서
→ Chunk 1
→ Chunk 2
→ Chunk 3
→ 각 Chunk Embedding

Chunk 단위로 Embedding하면 사용자의 질문과 관련 있는 부분만 검색하기 쉬워진다.

---

16. Chunk Size

Chunk Size는 문서를 나눌 때 각 조각의 크기를 의미한다.

Chunk Size가 너무 작으면 문맥이 부족하고, 너무 크면 검색 결과에 불필요한 정보가 많이 포함될 수 있다.

Chunk Size| 장점| 한계
작음| 세밀한 검색 가능| 문맥 부족 가능
큼| 문맥 유지 가능| 불필요한 정보 포함 가능

RAG에서는 Chunk Size를 데이터 특성과 질문 유형에 맞게 조정해야 한다.

---

17. Chunk Overlap

Chunk Overlap은 인접한 Chunk 사이에 일부 내용을 겹치게 하는 방법이다.

문서를 자르는 과정에서 중요한 문맥이 끊기는 것을 줄이기 위해 사용한다.

Chunk 1: A B C D
Chunk 2: C D E F

Overlap을 사용하면 문장이나 문단의 연결 정보를 일부 유지할 수 있다.

---

18. Embedding Dimension

Embedding Dimension은 Embedding Vector의 차원 수를 의미한다.

예를 들어 어떤 Embedding Model은 하나의 문장을 384차원, 768차원, 1536차원 등의 벡터로 변환할 수 있다.

차원이 크다고 항상 좋은 것은 아니며, 검색 성능, 저장 비용, 속도를 함께 고려해야 한다.

---

19. Vector Normalization

Vector Normalization은 벡터의 크기를 일정하게 맞추는 과정이다.

Embedding 검색에서는 벡터 크기보다 방향이 중요한 경우가 많기 때문에 Normalization을 적용할 수 있다.

Cosine Similarity 기반 검색에서는 벡터 방향의 유사도를 비교한다.

---

20. Embedding 활용 분야

Embedding은 LLM 애플리케이션에서 다양하게 활용된다.

활용| 설명
Semantic Search| 의미 기반 문서 검색
RAG| 관련 문서를 검색해 LLM 답변에 활용
Clustering| 비슷한 문서끼리 그룹화
Recommendation| 유사한 아이템이나 콘텐츠 추천
Duplicate Detection| 유사하거나 중복된 문서 탐지
Classification| Embedding을 Feature로 사용하여 분류
Anomaly Detection| 일반적인 패턴과 다른 텍스트 탐지

---

21. RAG에서 Embedding의 역할

RAG에서 Embedding은 검색 단계의 핵심이다.

LLM이 답변하기 전에, 사용자의 질문과 의미적으로 관련 있는 문서를 찾기 위해 Embedding을 사용한다.

질문 Embedding
+
문서 Embedding
→ 유사도 계산
→ 관련 문서 검색
→ LLM 답변 생성

Embedding 품질이 낮으면 관련 없는 문서가 검색되고, LLM 답변 품질도 떨어질 수 있다.

---

22. Embedding 품질에 영향을 주는 요소

Embedding 검색 성능은 여러 요소에 영향을 받는다.

- Embedding Model의 성능
- 문서 전처리 방식
- Chunk Size
- Chunk Overlap
- 검색 유사도 기준
- Top-k 개수
- 데이터 도메인
- 언어 지원 성능
- 문서의 품질과 구조

RAG 성능을 높이려면 단순히 좋은 LLM을 쓰는 것뿐만 아니라, Embedding과 검색 품질도 함께 개선해야 한다.

---

23. Top-k Search

Top-k Search는 Query와 가장 유사한 문서 k개를 검색하는 방식이다.

예를 들어 Top-k가 5라면, 질문과 가장 유사한 문서 조각 5개를 가져온다.

Query
→ 유사도 계산
→ 가장 유사한 문서 5개 반환

Top-k가 너무 작으면 필요한 문서를 놓칠 수 있고, 너무 크면 불필요한 문서가 Prompt에 들어갈 수 있다.

---

24. Embedding과 Hallucination

Embedding은 Hallucination을 줄이는 데 도움이 될 수 있다.

RAG에서 관련 문서를 검색해 LLM에게 제공하면, 모델이 근거 없이 답변을 생성하는 것을 줄일 수 있다.

하지만 검색된 문서가 부정확하거나 관련성이 낮으면 LLM 답변도 잘못될 수 있다.

따라서 Embedding 검색 결과의 품질을 반드시 확인해야 한다.

---

25. Embedding의 한계

Embedding은 의미 기반 검색에 유용하지만 한계도 있다.

한계

- 정확한 키워드 일치가 필요한 검색에는 약할 수 있다.
- 숫자, 날짜, 코드, 고유명사 검색에서 오류가 날 수 있다.
- 긴 문서의 세부 정보를 하나의 벡터에 모두 담기 어렵다.
- Embedding Model이 학습하지 못한 도메인 표현에 약할 수 있다.
- 유사도 점수가 높다고 항상 정답 문서라는 의미는 아니다.
- 문서가 잘못 Chunking되면 검색 품질이 떨어질 수 있다.

---

26. Embedding 사용 시 주의할 점

- 문서 특성에 맞는 Chunk Size를 선택해야 한다.
- Query와 문서에 같은 Embedding Model을 사용해야 한다.
- Vector DB에 저장된 Embedding은 모델이 바뀌면 다시 생성해야 할 수 있다.
- 검색 결과가 실제 질문에 맞는지 평가해야 한다.
- 중요한 정보 검색에는 키워드 검색과 의미 검색을 함께 고려할 수 있다.
- 개인정보나 민감한 문서를 Embedding할 때 보안에 주의해야 한다.

---

27. Embedding과 Vector DB

Embedding Vector는 보통 Vector DB에 저장한다.

Vector DB는 벡터를 효율적으로 저장하고, Query Vector와 가까운 벡터를 빠르게 검색할 수 있도록 도와준다.

Document
→ Embedding
→ Vector DB 저장
→ Similarity Search

Vector DB는 RAG 시스템에서 검색 저장소 역할을 한다.

---

28. Embedding 기반 RAG 예시

사용자 질문:
"프로젝트에서 내가 담당한 역할이 뭐였지?"

처리 흐름:
1. 질문을 Embedding한다.
2. 프로젝트 문서 Chunk들과 유사도를 비교한다.
3. 역할 설명이 담긴 Chunk를 검색한다.
4. 검색된 내용을 Prompt에 넣는다.
5. LLM이 근거 기반 답변을 생성한다.

이처럼 Embedding은 LLM이 외부 문서를 활용하도록 연결하는 역할을 한다.

---

29. 정리

- Embedding은 텍스트를 의미를 가진 숫자 벡터로 변환하는 방법이다.
- 의미가 비슷한 텍스트는 벡터 공간에서 가까운 위치에 놓인다.
- Embedding Model은 텍스트를 벡터로 변환하는 모델이다.
- LLM은 답변을 생성하고, Embedding Model은 의미 비교를 위한 벡터를 만든다.
- Semantic Search는 단어 일치보다 의미 유사도를 기준으로 검색한다.
- Cosine Similarity는 Embedding Vector 간 유사도를 계산할 때 자주 사용된다.
- 긴 문서는 Chunk 단위로 나누어 Embedding하는 것이 일반적이다.
- Chunk Size와 Chunk Overlap은 검색 품질에 영향을 준다.
- RAG에서는 질문 Embedding과 문서 Embedding을 비교하여 관련 문서를 검색한다.
- Embedding 품질이 낮으면 RAG 답변 품질도 떨어질 수 있다.
- Embedding은 Semantic Search, RAG, Clustering, Recommendation 등에 활용된다.
- Embedding 검색은 강력하지만 숫자, 날짜, 고유명사, 정확한 키워드 검색에서는 주의가 필요하다.