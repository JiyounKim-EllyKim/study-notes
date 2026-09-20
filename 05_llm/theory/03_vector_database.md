Vector Database 개념 정리

1. Vector Database

Vector Database는 Embedding Vector를 저장하고, 벡터 간 유사도를 기준으로 검색할 수 있는 데이터베이스이다.

LLM 기반 서비스에서는 문서, 질문, 이미지, 상품 설명 등을 Embedding으로 변환한 뒤 Vector Database에 저장하고, 사용자의 질문과 의미적으로 가까운 데이터를 검색하는 데 사용한다.

한국어로는 벡터 데이터베이스라고 한다.

---

2. Vector Database가 필요한 이유

Embedding은 텍스트를 숫자 벡터로 변환한다.

하지만 문서가 많아질수록 모든 벡터를 직접 비교하는 것은 비효율적이다.

Vector Database는 많은 벡터 중에서 Query Vector와 가까운 벡터를 빠르게 찾을 수 있도록 도와준다.

문서
→ Embedding
→ Vector Database 저장
→ Query Embedding과 유사도 검색
→ 관련 문서 반환

---

3. Vector Database의 역할

Vector Database는 주로 다음 역할을 한다.

역할| 설명
Vector 저장| Embedding Vector를 저장
Similarity Search| Query Vector와 가까운 벡터 검색
Metadata 저장| 문서 제목, 출처, 날짜 등 부가 정보 저장
Filtering| 조건에 맞는 문서만 검색
Indexing| 빠른 검색을 위한 인덱스 구성

---

4. Vector

Vector는 숫자로 이루어진 배열이다.

Embedding Model은 텍스트를 벡터로 변환한다.

"배송이 빨라서 좋았어요"
→ [0.12, -0.45, 0.33, 0.08, ...]

Vector Database는 이런 벡터를 저장하고, 벡터 간 거리를 계산하여 의미적으로 가까운 데이터를 찾는다.

---

5. Metadata

Metadata는 벡터와 함께 저장되는 부가 정보이다.

예를 들어 문서 Chunk를 Embedding하여 저장할 때, 다음 정보를 함께 저장할 수 있다.

Metadata| 예시
document_id| 문서 ID
title| 문서 제목
source| 문서 출처
page| 페이지 번호
created_at| 생성일
category| 문서 유형

Metadata를 함께 저장하면 검색 결과가 어떤 문서에서 나온 것인지 추적할 수 있다.

---

6. Vector Search

Vector Search는 Query Vector와 저장된 Vector들 사이의 유사도를 계산하여 가장 가까운 벡터를 찾는 검색 방식이다.

Query Text
→ Query Embedding
→ Vector Database 검색
→ 유사한 Document Chunk 반환

Vector Search는 단어가 정확히 일치하지 않아도 의미가 비슷한 문서를 찾을 수 있다.

---

7. Similarity Search

Similarity Search는 벡터 간 유사도를 기준으로 가까운 데이터를 찾는 방법이다.

대표적인 유사도 또는 거리 계산 방식은 다음과 같다.

방식| 설명
Cosine Similarity| 벡터 방향의 유사도 계산
Dot Product| 벡터 내적 계산
Euclidean Distance| 두 벡터 사이의 직선 거리 계산

사용하는 Embedding Model과 Vector Database 설정에 따라 적절한 유사도 기준을 선택해야 한다.

---

8. Cosine Similarity

Cosine Similarity는 두 벡터의 방향이 얼마나 비슷한지를 계산한다.

텍스트 Embedding에서는 벡터의 크기보다 방향이 의미를 더 잘 나타내는 경우가 많아 자주 사용된다.

값| 의미
1에 가까움| 매우 유사
0에 가까움| 관련성이 낮음
-1에 가까움| 반대 방향

---

9. Euclidean Distance

Euclidean Distance는 두 벡터 사이의 직선 거리를 계산한다.

거리가 작을수록 두 벡터가 가깝다고 판단한다.

거리| 의미
작음| 유사도 높음
큼| 유사도 낮음

Embedding 검색에서는 거리 계산 방식에 따라 검색 결과가 달라질 수 있다.

---

10. Top-k Search

Top-k Search는 Query Vector와 가장 가까운 벡터 k개를 반환하는 방식이다.

예를 들어 "top_k = 5"라면, 질문과 가장 유사한 문서 조각 5개를 가져온다.

Query Vector
→ 유사도 계산
→ 가장 가까운 문서 5개 반환

Top-k가 너무 작으면 필요한 문서를 놓칠 수 있고, 너무 크면 관련성이 낮은 문서까지 함께 들어올 수 있다.

---

11. Indexing

Indexing은 많은 벡터 중에서 유사한 벡터를 빠르게 찾기 위해 사용하는 구조이다.

벡터 수가 적으면 모든 벡터와 직접 비교해도 되지만, 데이터가 많아지면 검색 속도가 느려진다.

Vector Database는 인덱스를 사용하여 검색 속도를 높인다.

---

12. ANN Search

ANN은 Approximate Nearest Neighbor의 약자로, 근사 최근접 이웃 검색을 의미한다.

정확하게 가장 가까운 벡터를 모두 비교해서 찾는 대신, 매우 가까운 벡터를 빠르게 찾는 방식이다.

특징

- 검색 속도가 빠르다.
- 대규모 벡터 검색에 적합하다.
- 정확도와 속도 사이의 Trade-off가 있다.
- Vector Database에서 자주 사용된다.

---

13. Exact Search와 Approximate Search

구분| Exact Search| Approximate Search
방식| 모든 벡터와 정확히 비교| 가까운 벡터를 근사적으로 탐색
정확도| 높음| 약간 낮을 수 있음
속도| 느릴 수 있음| 빠름
사용 상황| 데이터가 작을 때| 데이터가 많을 때

대규모 RAG 시스템에서는 검색 속도를 위해 Approximate Search를 사용하는 경우가 많다.

---

14. Metadata Filtering

Metadata Filtering은 벡터 검색 시 특정 조건에 맞는 데이터만 검색하는 기능이다.

예를 들어 문서 카테고리, 날짜, 작성자, 프로젝트명 등을 기준으로 필터링할 수 있다.

질문: Career.zip 프로젝트에서 평가 모듈은 어떻게 구현했어?

필터:
project = "Career.zip"

이렇게 하면 전체 문서가 아니라 특정 프로젝트 문서 안에서만 관련 내용을 검색할 수 있다.

---

15. Vector Database와 RAG

Vector Database는 RAG 시스템에서 검색 저장소 역할을 한다.

RAG에서는 LLM이 답변하기 전에 사용자의 질문과 관련 있는 문서를 검색하고, 그 검색 결과를 Prompt에 넣어 답변을 생성한다.

User Question
→ Query Embedding
→ Vector Database Search
→ Retrieved Documents
→ LLM Prompt
→ Answer

Vector Database의 검색 품질은 RAG 답변 품질에 큰 영향을 준다.

---

16. RAG에서 Vector Database의 흐름

RAG에서 Vector Database를 사용하는 흐름은 보통 다음과 같다.

1. 문서를 수집한다.
2. 문서를 Chunk 단위로 나눈다.
3. 각 Chunk를 Embedding한다.
4. Embedding Vector와 Metadata를 Vector Database에 저장한다.
5. 사용자 질문을 Embedding한다.
6. Vector Database에서 유사한 Chunk를 검색한다.
7. 검색된 Chunk를 Prompt에 넣는다.
8. LLM이 근거 기반 답변을 생성한다.

---

17. Chunk와 Vector Database

Vector Database에는 보통 문서 전체가 아니라 Chunk 단위로 저장한다.

긴 문서를 하나의 벡터로 만들면 세부 내용이 희석될 수 있기 때문이다.

긴 문서
→ Chunk 1
→ Chunk 2
→ Chunk 3
→ 각 Chunk를 Embedding
→ Vector Database 저장

Chunk 단위로 저장하면 질문과 관련 있는 부분만 검색하기 쉬워진다.

---

18. Chunk Size와 검색 품질

Chunk Size는 Vector Database 검색 품질에 영향을 준다.

Chunk Size| 장점| 한계
작음| 세밀한 검색 가능| 문맥 부족 가능
큼| 문맥 유지 가능| 불필요한 정보 포함 가능

적절한 Chunk Size는 데이터 종류와 질문 유형에 따라 달라진다.

---

19. Hybrid Search

Hybrid Search는 키워드 기반 검색과 Embedding 기반 검색을 함께 사용하는 방식이다.

검색 방식| 강점
Keyword Search| 정확한 단어, 숫자, 고유명사 검색에 강함
Vector Search| 의미가 비슷한 문서 검색에 강함
Hybrid Search| 두 방식의 장점을 함께 활용

예를 들어 "2026년", "SQLD", "Career.zip"처럼 정확한 단어가 중요한 경우에는 키워드 검색이 도움이 될 수 있다.

---

20. Reranking

Reranking은 1차 검색 결과를 다시 정렬하는 과정이다.

Vector Database에서 Top-k 문서를 가져온 뒤, 별도의 Reranker 모델이나 LLM을 사용해 질문과 더 관련 있는 문서를 위로 올릴 수 있다.

Vector Search 결과 20개
→ Reranker로 재정렬
→ 상위 5개만 Prompt에 사용

Reranking은 RAG에서 검색 품질을 높이는 데 자주 사용된다.

---

21. Vector Database 예시

대표적인 Vector Database 또는 Vector Search 도구는 다음과 같다.

도구| 특징
FAISS| 로컬 벡터 검색 라이브러리
Chroma| RAG 실험과 로컬 개발에 자주 사용
Pinecone| 관리형 Vector Database
Weaviate| Vector Search와 Metadata 관리 지원
Milvus| 대규모 벡터 검색에 사용
pgvector| PostgreSQL에서 벡터 검색 지원

프로젝트 규모, 배포 환경, 비용, 운영 편의성에 따라 적절한 도구를 선택한다.

---

22. Vector Database 선택 기준

Vector Database를 선택할 때는 다음 요소를 고려해야 한다.

- 저장할 벡터 개수
- 검색 속도
- 검색 정확도
- Metadata Filtering 지원 여부
- 운영 편의성
- 비용
- 로컬 개발 가능 여부
- 클라우드 배포 여부
- 기존 데이터베이스와의 연동
- 보안 요구사항

작은 실험에서는 Chroma나 FAISS를 사용할 수 있고, 서비스 운영 단계에서는 관리형 DB나 확장 가능한 Vector DB를 고려할 수 있다.

---

23. Vector Database의 장점

Vector Database는 LLM 애플리케이션에서 다음과 같은 장점이 있다.

- 의미 기반 검색이 가능하다.
- 대량의 Embedding Vector를 효율적으로 저장할 수 있다.
- Query와 관련 있는 문서를 빠르게 찾을 수 있다.
- RAG 시스템의 검색 단계에 활용할 수 있다.
- Metadata와 함께 문서 출처를 관리할 수 있다.
- 키워드가 달라도 의미가 비슷한 문서를 찾을 수 있다.

---

24. Vector Database의 한계

Vector Database에도 한계가 있다.

- 유사도 점수가 높다고 항상 정답 문서라는 의미는 아니다.
- Embedding Model 품질에 크게 의존한다.
- Chunking이 잘못되면 검색 품질이 떨어진다.
- 정확한 숫자, 날짜, 고유명사 검색에는 약할 수 있다.
- 저장된 문서가 오래되면 최신 정보 검색이 어렵다.
- Embedding Model을 바꾸면 기존 벡터를 다시 생성해야 할 수 있다.
- 검색 결과를 그대로 믿지 말고 평가가 필요하다.

---

25. Vector Database와 Data Update

문서가 추가되거나 수정되면 Vector Database도 업데이트해야 한다.

필요한 작업

- 새 문서 Chunking
- 새 Chunk Embedding
- Vector Database에 Upsert
- 삭제된 문서 Vector 제거
- 수정된 문서 Vector 재생성
- Metadata 업데이트

문서가 자주 바뀌는 서비스에서는 Vector Database 동기화 전략이 중요하다.

---

26. Upsert

Upsert는 Insert와 Update를 합친 개념이다.

이미 존재하는 ID가 있으면 업데이트하고, 없으면 새로 추가한다.

Vector Database에서는 문서 Chunk ID를 기준으로 Embedding과 Metadata를 Upsert할 수 있다.

기존 Chunk ID 있음 → Vector 업데이트
기존 Chunk ID 없음 → 새 Vector 추가

---

27. Vector Database 사용 시 주의할 점

- Query와 문서는 같은 Embedding Model로 벡터화해야 한다.
- Embedding Model이 바뀌면 기존 벡터도 다시 생성하는 것이 좋다.
- Chunk Size와 Overlap을 실험하며 조정해야 한다.
- Metadata를 함께 저장해 출처를 추적할 수 있어야 한다.
- 검색 결과가 질문에 실제로 관련 있는지 평가해야 한다.
- 민감한 문서를 저장할 때는 보안과 접근 권한을 고려해야 한다.
- Vector Search만 사용하기보다 필요하면 Hybrid Search를 고려한다.

---

28. RAG 품질과 Vector Database

RAG의 답변 품질은 LLM뿐만 아니라 검색 품질에 크게 의존한다.

관련 없는 문서가 검색되면 LLM이 그 내용을 바탕으로 잘못된 답변을 만들 수 있다.

따라서 RAG에서는 다음을 함께 관리해야 한다.

- 문서 품질
- Chunking 전략
- Embedding Model
- Vector Database 검색 설정
- Top-k 값
- Metadata Filtering
- Reranking
- Prompt 구성
- 답변 평가

---

29. 정리

- Vector Database는 Embedding Vector를 저장하고 유사도 기반 검색을 수행하는 데이터베이스이다.
- LLM 애플리케이션에서는 RAG의 검색 저장소로 자주 사용된다.
- Vector Search는 Query Vector와 가까운 문서 Vector를 찾는 방식이다.
- Metadata를 함께 저장하면 문서 출처와 조건 기반 필터링이 가능하다.
- Cosine Similarity, Dot Product, Euclidean Distance 등을 사용해 벡터 유사도를 계산할 수 있다.
- Top-k Search는 가장 유사한 문서 k개를 반환하는 방식이다.
- Indexing과 ANN Search는 대규모 벡터 검색 속도를 높이는 데 사용된다.
- RAG에서는 문서를 Chunk 단위로 나누고 각 Chunk를 Embedding하여 Vector Database에 저장한다.
- Hybrid Search는 키워드 검색과 벡터 검색을 함께 사용하는 방식이다.
- Reranking은 1차 검색 결과를 다시 정렬하여 검색 품질을 높이는 방법이다.
- Vector Database의 검색 품질은 RAG 답변 품질에 직접적인 영향을 준다.