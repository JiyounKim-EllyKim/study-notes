Python Comprehension 개념 정리

1. Comprehension

Comprehension은 반복문을 이용한 데이터 생성이나 변환 작업을 간결한 표현식으로 작성하는 Python 문법이다.

일반적으로 "for"문과 조건문을 하나의 표현식으로 결합하여 새로운 자료구조를 생성한다.

대표적인 종류는 다음과 같다.

구분| 설명| 결과
List Comprehension| List 생성| "list"
Dictionary Comprehension| Dictionary 생성| "dict"
Set Comprehension| Set 생성| "set"
Generator Expression| 값을 필요할 때 생성| "generator"

---

2. List Comprehension

List Comprehension은 반복문을 이용해 새로운 List를 생성하는 방법이다.

기본 구조

[expression for item in iterable]

일반 반복문

numbers = [1, 2, 3, 4, 5]

squares = []

for num in numbers:
    squares.append(num ** 2)

print(squares)
# [1, 4, 9, 16, 25]

List Comprehension

numbers = [1, 2, 3, 4, 5]

squares = [num ** 2 for num in numbers]

print(squares)
# [1, 4, 9, 16, 25]

두 코드는 같은 결과를 생성한다.

List Comprehension을 사용하면 반복문과 "append()"를 하나의 표현식으로 작성할 수 있다.

---

3. List Comprehension의 구성 요소

result = [x * 2 for x in range(5)]

구성 요소| 설명
"x * 2"| 결과에 저장할 표현식
"x"| 반복할 때 사용하는 변수
"range(5)"| 반복 대상 Iterable

실행 결과:

print(result)
# [0, 2, 4, 6, 8]

각 요소에 동일한 변환을 적용해야 할 때 유용하다.

---

4. 조건이 있는 List Comprehension

List Comprehension에서는 "if" 조건을 추가하여 특정 요소만 선택할 수 있다.

기본 구조

[expression for item in iterable if condition]

예시: 짝수 추출

numbers = [1, 2, 3, 4, 5, 6]

evens = [x for x in numbers if x % 2 == 0]

print(evens)
# [2, 4, 6]

일반 반복문과 비교

evens = []

for x in numbers:
    if x % 2 == 0:
        evens.append(x)

List Comprehension을 사용하면 조건에 맞는 데이터를 간결하게 필터링할 수 있다.

---

5. if-else가 있는 List Comprehension

조건에 따라 서로 다른 값을 생성해야 할 때는 조건부 표현식을 사용할 수 있다.

기본 구조

[value_if_true if condition else value_if_false
 for item in iterable]

예시: 합격 여부 표시

scores = [90, 55, 80, 40, 75]

results = [
    "합격" if score >= 60 else "불합격"
    for score in scores
]

print(results)
# ['합격', '불합격', '합격', '불합격', '합격']

주의할 점

- 필터링 조건은 "for" 뒤에 작성한다.
- 값을 선택하는 "if-else"는 "for" 앞에 작성한다.

두 문법의 목적이 다르다는 점을 구분해야 한다.

---

6. 필터링과 조건부 표현식 비교

필터링

조건에 맞지 않는 요소는 결과에서 제외된다.

numbers = [1, 2, 3, 4, 5]

result = [x for x in numbers if x > 3]

print(result)
# [4, 5]

조건부 표현식

모든 요소를 유지하되, 조건에 따라 값이 달라진다.

result = [x if x > 3 else 0 for x in numbers]

print(result)
# [0, 0, 0, 4, 5]

구분| 필터링 "if"| 조건부 "if-else"
목적| 요소 선택| 요소 변환
결과 길이| 줄어들 수 있음| 원본과 동일
위치| "for" 뒤| "for" 앞

---

7. 문자열과 List Comprehension

문자열도 Iterable이므로 List Comprehension에 사용할 수 있다.

문자열을 문자 단위로 변환

text = "Python"

characters = [char for char in text]

print(characters)
# ['P', 'y', 't', 'h', 'o', 'n']

문자열 정리

names = [" kim ", " LEE ", " park "]

cleaned = [name.strip().lower() for name in names]

print(cleaned)
# ['kim', 'lee', 'park']

데이터 전처리에서 문자열 공백 제거, 소문자 변환 등에 활용할 수 있다.

---

8. 중첩 List Comprehension

여러 개의 반복문을 하나의 List Comprehension에 사용할 수 있다.

기본 구조

[expression for x in iterable1 for y in iterable2]

일반 반복문

result = []

for i in range(2):
    for j in range(3):
        result.append((i, j))

List Comprehension

result = [
    (i, j)
    for i in range(2)
    for j in range(3)
]

print(result)
# [(0, 0), (0, 1), (0, 2),
#  (1, 0), (1, 1), (1, 2)]

반복 순서는 일반적인 중첩 "for"문과 동일하다.

---

9. 2차원 List 평탄화

중첩 List를 하나의 List로 변환하는 작업을 Flattening이라고 한다.

예시

matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

일반 반복문

flattened = []

for row in matrix:
    for value in row:
        flattened.append(value)

List Comprehension

flattened = [
    value
    for row in matrix
    for value in row
]

print(flattened)
# [1, 2, 3, 4, 5, 6, 7, 8, 9]

중첩된 데이터 구조를 단순화할 때 활용할 수 있다.

---

10. Dictionary Comprehension

Dictionary Comprehension은 반복문을 이용해 새로운 Dictionary를 생성하는 방법이다.

기본 구조

{key_expression: value_expression for item in iterable}

예시

numbers = [1, 2, 3, 4]

squares = {x: x ** 2 for x in numbers}

print(squares)
# {1: 1, 2: 4, 3: 9, 4: 16}

Key와 Value를 동시에 정의할 수 있다.

---

11. Dictionary Comprehension 활용

두 List를 Dictionary로 변환

names = ["Kim", "Lee", "Park"]
scores = [90, 85, 95]

result = {
    name: score
    for name, score in zip(names, scores)
}

print(result)
# {'Kim': 90, 'Lee': 85, 'Park': 95}

Dictionary의 Value 변환

scores = {
    "math": 90,
    "english": 85,
    "python": 95
}

updated = {
    subject: score + 5
    for subject, score in scores.items()
}

print(updated)
# {'math': 95, 'english': 90, 'python': 100}

기존 Dictionary의 Key를 유지하면서 Value를 변환할 때 유용하다.

---

12. 조건이 있는 Dictionary Comprehension

Dictionary Comprehension에서도 "if" 조건을 사용해 원하는 Key-Value만 선택할 수 있다.

scores = {
    "math": 90,
    "english": 55,
    "python": 95
}

passed = {
    subject: score
    for subject, score in scores.items()
    if score >= 60
}

print(passed)
# {'math': 90, 'python': 95}

주의할 점

Dictionary에서는 Key가 중복될 수 없다.

Comprehension에서 동일한 Key가 여러 번 생성되면 뒤에서 생성된 Value가 해당 Key의 기존 Value를 덮어쓴다.

---

13. Set Comprehension

Set Comprehension은 반복문을 이용해 새로운 Set을 생성하는 방법이다.

기본 구조

{expression for item in iterable}

예시: 중복 제거

numbers = [1, 2, 2, 3, 3, 4]

unique_numbers = {x for x in numbers}

print(unique_numbers)
# {1, 2, 3, 4}

Set은 중복 요소를 허용하지 않으므로, 중복된 값이 자동으로 제거된다.

---

14. Set Comprehension 활용

문자열 정규화 후 중복 제거

names = ["Kim", "kim", "LEE", "lee"]

unique_names = {
    name.lower()
    for name in names
}

print(unique_names)
# {'kim', 'lee'}

대소문자가 다른 문자열을 동일한 값으로 처리할 수 있다.

조건에 맞는 고유값 추출

numbers = [10, 20, 20, 30, 40, 40]

result = {
    x for x in numbers
    if x >= 20
}

Set은 순서를 보장하지 않는다는 점에 주의해야 한다.

---

15. Generator Expression

Generator Expression은 값을 한 번에 모두 생성하지 않고, 필요한 시점에 하나씩 생성하는 표현식이다.

기본 구조

(expression for item in iterable)

List Comprehension과 비슷하지만 대괄호 대신 소괄호를 사용한다.

예시

numbers = (x ** 2 for x in range(5))

print(next(numbers))  # 0
print(next(numbers))  # 1
print(next(numbers))  # 4

Generator Expression은 지연 평가 Lazy Evaluation 방식으로 동작한다.

---

16. List Comprehension과 Generator Expression 비교

구분| List Comprehension| Generator Expression
표기| "[]"| "()"
반환 객체| List| Generator
값 생성| 즉시 생성| 필요할 때 생성
메모리| 전체 결과 저장| 값을 순차적으로 생성
인덱싱| 가능| 불가능
반복 사용| 가능| 소진 후 재사용 불가

List Comprehension

squares = [x ** 2 for x in range(1000)]

모든 결과를 List에 저장한다.

Generator Expression

squares = (x ** 2 for x in range(1000))

전체 결과를 List로 만들지 않고 필요한 값을 차례대로 생성한다.

대량 데이터를 순차적으로 처리할 때 Generator Expression이 메모리 측면에서 유리할 수 있다.

---

17. Lazy Evaluation

Lazy Evaluation은 실제 값이 필요한 시점에 계산을 수행하는 방식이다.

Generator는 다음 값을 요청받을 때 계산을 진행한다.

generator = (x * 2 for x in range(3))

print(next(generator))  # 0
print(next(generator))  # 2
print(next(generator))  # 4

더 이상 생성할 값이 없을 때 "next()"를 호출하면 "StopIteration" 예외가 발생한다.

주의할 점

Generator는 한 번 순회하면 소비된다.

generator = (x for x in range(3))

print(list(generator))
# [0, 1, 2]

print(list(generator))
# []

같은 결과가 다시 필요하다면 Generator를 새로 생성해야 한다.

---

18. Generator와 집계 함수

Generator Expression은 "sum()", "max()", "min()", "any()", "all()" 같은 함수와 함께 사용할 수 있다.

합계 계산

numbers = [1, 2, 3, 4, 5]

total = sum(x ** 2 for x in numbers)

print(total)
# 55

중간 List를 별도로 생성할 필요가 없다.

조건 확인

scores = [85, 90, 75]

has_high_score = any(score >= 90 for score in scores)
all_passed = all(score >= 60 for score in scores)

print(has_high_score)  # True
print(all_passed)      # True

"any()"와 "all()"은 결과가 결정되면 남은 요소를 평가하지 않을 수 있다.

---

19. map(), filter()와 Comprehension 비교

"map()"과 "filter()"도 Iterable의 요소를 처리하는 데 사용된다.

map()

numbers = [1, 2, 3, 4]

result = list(map(lambda x: x ** 2, numbers))

List Comprehension

result = [x ** 2 for x in numbers]

filter()

result = list(filter(lambda x: x % 2 == 0, numbers))

List Comprehension

result = [x for x in numbers if x % 2 == 0]

방식| 특징
"map()"| 각 요소에 함수 적용
"filter()"| 조건을 만족하는 요소 선택
List Comprehension| 변환과 필터링을 간결하게 표현
Generator Expression| 필요할 때 값을 생성

간단한 변환이나 필터링에서는 List Comprehension이 더 읽기 쉬운 경우가 많다.

---

20. Comprehension과 변수 Scope

Python 3에서 List, Dictionary, Set Comprehension과 Generator Expression의 반복 변수는 별도의 내부 Scope에서 관리된다.

x = 100

result = [x for x in range(3)]

print(result)
# [0, 1, 2]

print(x)
# 100

Comprehension 내부의 "x"가 바깥쪽 변수 "x"를 덮어쓰지 않는다.

다만 Comprehension에서 참조하는 외부 Mutable 객체를 변경하는 경우에는 별도의 Side Effect가 발생할 수 있다.

---

21. Comprehension의 시간 복잡도

Comprehension은 반복문을 간결하게 표현하지만, 알고리즘의 시간 복잡도를 자동으로 줄여주지는 않는다.

단일 반복

result = [x * 2 for x in range(n)]

시간 복잡도는 일반적으로 O(n)이다.

중첩 반복

result = [
    (i, j)
    for i in range(n)
    for j in range(m)
]

시간 복잡도는 일반적으로 O(nm)이다.

주의할 점

- Comprehension을 사용해도 반복 횟수 자체가 줄어드는 것은 아니다.
- 중첩 Comprehension은 데이터가 커지면 연산량이 증가한다.
- List Comprehension은 결과를 메모리에 저장한다.
- Generator Expression은 전체 결과를 저장하지 않아 메모리를 절약할 수 있다.

---

22. 데이터 분석에서의 활용

Comprehension은 간단한 데이터 전처리나 Feature 생성에 활용할 수 있다.

결측값 제외

values = [10, None, 20, None, 30]

cleaned = [
    value
    for value in values
    if value is not None
]

print(cleaned)
# [10, 20, 30]

"if value"를 사용하면 "0"도 제거될 수 있으므로 주의해야 한다.

문자열 전처리

categories = ["  FOOD", "Travel  ", " SHOPPING "]

cleaned = [
    category.strip().lower()
    for category in categories
]

print(cleaned)
# ['food', 'travel', 'shopping']

파생 변수 생성

prices = [10000, 20000, 30000]

discounted = [
    price * 0.9
    for price in prices
]

print(discounted)
# [9000.0, 18000.0, 27000.0]

데이터 분류

scores = [90, 55, 80, 40, 75]

labels = [
    1 if score >= 60 else 0
    for score in scores
]

print(labels)
# [1, 0, 1, 0, 1]

---

23. Pandas와 Comprehension

Pandas에서는 List Comprehension보다 벡터화 연산이 효율적인 경우가 많다.

List Comprehension

import pandas as pd

df = pd.DataFrame({
    "score": [90, 55, 80, 40, 75]
})

df["passed"] = [
    1 if score >= 60 else 0
    for score in df["score"]
]

Pandas 벡터화 연산

df["passed"] = (df["score"] >= 60).astype(int)

두 방법 모두 같은 결과를 생성한다.

Pandas에서는 단순한 컬럼 단위 연산을 수행할 때 벡터화 연산을 우선 고려하는 것이 좋다.

---

24. Comprehension 사용 시 주의할 점

- Comprehension이 항상 일반 반복문보다 좋은 것은 아니다.
- 조건이 복잡하면 일반적인 "for"문이 더 읽기 쉬울 수 있다.
- 중첩 Comprehension은 가독성이 떨어질 수 있다.
- List Comprehension은 모든 결과를 메모리에 저장한다.
- Generator Expression은 값을 필요할 때 생성한다.
- Generator는 한 번 소비하면 다시 사용할 수 없다.
- Dictionary Comprehension에서는 Key 중복에 주의해야 한다.
- Set Comprehension은 중복을 제거하지만 순서를 보장하지 않는다.
- 단순한 전처리라도 원본 데이터가 변경되는지 확인해야 한다.
- 대규모 NumPy나 Pandas 데이터에서는 벡터화 연산을 우선 검토한다.

---

25. 정리

- Comprehension은 반복문을 간결하게 표현하여 새로운 자료구조를 생성하는 문법이다.
- List Comprehension은 "[]"를 사용하여 List를 생성한다.
- 조건을 추가하면 특정 요소만 필터링할 수 있다.
- "if-else" 표현식을 사용하면 조건에 따라 다른 값을 생성할 수 있다.
- 중첩 Comprehension은 여러 반복문을 하나의 표현식으로 작성한다.
- Dictionary Comprehension은 Key-Value 쌍을 생성한다.
- Set Comprehension은 중복되지 않는 요소로 Set을 생성한다.
- Generator Expression은 값을 필요할 때 생성하는 지연 평가 방식이다.
- Generator는 전체 결과를 한 번에 저장하지 않아 메모리 사용량을 줄일 수 있다.
- "map()"과 "filter()"는 각각 변환과 필터링을 수행하며 Comprehension으로 대체할 수 있는 경우가 많다.
- Comprehension을 사용하더라도 알고리즘의 시간 복잡도가 자동으로 줄어들지는 않는다.
- 데이터 분석에서는 간단한 전처리에 활용할 수 있지만 NumPy와 Pandas의 벡터화 연산도 고려해야 한다.
- Comprehension은 간결함보다 코드의 가독성을 우선하여 사용하는 것이 좋다.