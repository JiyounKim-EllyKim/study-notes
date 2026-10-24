Python Data Structure 개념 정리

1. Data Structure

Data Structure는 여러 데이터를 효율적으로 저장하고 관리하기 위한 구조이다.

Python에서는 대표적으로 List, Tuple, Dictionary, Set을 사용한다.

자료구조마다 데이터 저장 방식과 접근 방법, 중복 허용 여부, 수정 가능 여부가 다르다.

대표 자료구조 비교

구분| List| Tuple| Dictionary| Set
표기| "[]"| "()"| "{key: value}"| "{}" 또는 "set()"
순서| 있음| 있음| 삽입 순서 유지| 없음
중복| 허용| 허용| Key 중복 불가| 허용하지 않음
수정| 가능| 불가능| 가능| 가능
인덱싱| 가능| 가능| Key로 접근| 불가능

---

2. List

List는 여러 데이터를 순서대로 저장하는 자료구조이다.

대괄호 "[]"를 사용하여 생성하며, 서로 다른 자료형의 데이터를 함께 저장할 수 있다.

numbers = [10, 20, 30, 40]
fruits = ["apple", "banana", "orange"]
mixed = [10, "Python", 3.14, True]

특징

- 순서가 유지된다.
- 중복 데이터를 허용한다.
- 인덱싱과 슬라이싱이 가능하다.
- 데이터 추가, 수정, 삭제가 가능하다.
- 서로 다른 자료형을 함께 저장할 수 있다.

List는 Mutable 객체이다.

---

3. List 인덱싱

인덱싱은 List에서 특정 위치의 요소에 접근하는 방법이다.

Python의 인덱스는 0부터 시작한다.

fruits = ["apple", "banana", "orange"]

print(fruits[0])   # apple
print(fruits[1])   # banana
print(fruits[-1])  # orange

음수 인덱스를 사용하면 뒤에서부터 요소에 접근할 수 있다.

존재하지 않는 인덱스에 접근하면 "IndexError"가 발생한다.

---

4. List 슬라이싱

슬라이싱은 List의 특정 범위에 있는 요소를 추출하는 방법이다.

numbers = [10, 20, 30, 40, 50]

print(numbers[1:4])  # [20, 30, 40]
print(numbers[:3])   # [10, 20, 30]
print(numbers[2:])   # [30, 40, 50]
print(numbers[::2])  # [10, 30, 50]
print(numbers[::-1]) # [50, 40, 30, 20, 10]

기본 형식

list[start:stop:step]

- "start": 시작 인덱스
- "stop": 종료 인덱스, 해당 위치는 포함하지 않음
- "step": 이동 간격

일반적인 List 슬라이싱은 새로운 List를 반환한다.

---

5. List 요소 수정

List는 Mutable 자료구조이므로 생성 후에도 요소를 수정할 수 있다.

numbers = [10, 20, 30]

numbers[1] = 100

print(numbers)
# [10, 100, 30]

슬라이싱을 이용하면 여러 요소를 한 번에 변경할 수도 있다.

numbers = [10, 20, 30, 40]

numbers[1:3] = [200, 300]

print(numbers)
# [10, 200, 300, 40]

---

6. List 주요 메서드

List에서 자주 사용하는 메서드는 다음과 같다.

메서드| 설명
"append()"| 마지막에 요소 하나 추가
"extend()"| 여러 요소를 이어 붙임
"insert()"| 특정 위치에 요소 삽입
"remove()"| 지정한 값의 첫 번째 요소 삭제
"pop()"| 지정한 위치의 요소 삭제 후 반환
"sort()"| List 자체를 정렬
"reverse()"| List 요소 순서를 뒤집음
"count()"| 특정 값의 등장 횟수 반환
"index()"| 특정 값이 처음 등장한 위치 반환
"clear()"| 모든 요소 삭제
"copy()"| 얕은 복사 수행

append()

numbers = [10, 20]

numbers.append(30)

print(numbers)
# [10, 20, 30]

extend()

numbers = [10, 20]

numbers.extend([30, 40])

print(numbers)
# [10, 20, 30, 40]

insert()

numbers = [10, 30]

numbers.insert(1, 20)

print(numbers)
# [10, 20, 30]

---

7. append()와 extend()의 차이

"append()"는 전달한 객체를 하나의 요소로 추가한다.

"extend()"는 반복 가능한 객체의 요소들을 각각 추가한다.

a = [1, 2]
a.append([3, 4])

print(a)
# [1, 2, [3, 4]]

b = [1, 2]
b.extend([3, 4])

print(b)
# [1, 2, 3, 4]

두 메서드의 차이를 이해하는 것이 중요하다.

---

8. List 요소 삭제

List에서 요소를 삭제하는 대표적인 방법은 "remove()", "pop()", "del"이다.

remove()

값을 기준으로 삭제한다.

numbers = [10, 20, 30, 20]

numbers.remove(20)

print(numbers)
# [10, 30, 20]

"remove()"는 일치하는 값 중 첫 번째 요소만 삭제한다.

pop()

인덱스를 기준으로 삭제하고 삭제된 값을 반환한다.

numbers = [10, 20, 30]

value = numbers.pop(1)

print(value)    # 20
print(numbers)  # [10, 30]

인덱스를 지정하지 않으면 마지막 요소를 삭제한다.

del

numbers = [10, 20, 30]

del numbers[0]

print(numbers)
# [20, 30]

---

9. List 정렬

List를 정렬하는 대표적인 방법은 "sort()"와 "sorted()"이다.

sort()

원본 List 자체를 정렬한다.

numbers = [30, 10, 20]

numbers.sort()

print(numbers)
# [10, 20, 30]

sorted()

새롭게 정렬된 List를 반환한다.

numbers = [30, 10, 20]

result = sorted(numbers)

print(result)   # [10, 20, 30]
print(numbers)  # [30, 10, 20]

비교

구분| "sort()"| "sorted()"
원본 변경| 변경함| 변경하지 않음
반환값| "None"| 정렬된 새 List
사용 대상| List| 다양한 Iterable

내림차순 정렬에는 "reverse=True"를 사용할 수 있다.

numbers = [30, 10, 20]

print(sorted(numbers, reverse=True))
# [30, 20, 10]

---

10. Tuple

Tuple은 여러 데이터를 순서대로 저장하는 자료구조이다.

List와 비슷하지만, 생성 후 요소를 추가하거나 수정하거나 삭제할 수 없다.

numbers = (10, 20, 30)
colors = ("red", "blue", "green")

특징

- 순서가 유지된다.
- 중복을 허용한다.
- 인덱싱과 슬라이싱이 가능하다.
- 요소를 직접 수정할 수 없다.
- Immutable 자료구조이다.

---

11. Tuple 생성 시 주의할 점

Tuple은 괄호보다 쉼표 ","가 핵심이다.

요소가 하나인 Tuple을 만들 때는 반드시 쉼표가 필요하다.

a = (10)
b = (10,)

print(type(a))  # <class 'int'>
print(type(b))  # <class 'tuple'>

괄호를 생략하여 생성할 수도 있다.

numbers = 10, 20, 30

print(type(numbers))
# <class 'tuple'>

---

12. Tuple 인덱싱과 슬라이싱

Tuple도 List처럼 인덱싱과 슬라이싱을 사용할 수 있다.

numbers = (10, 20, 30, 40)

print(numbers[0])   # 10
print(numbers[-1])  # 40
print(numbers[1:3]) # (20, 30)

하지만 요소를 직접 변경하려고 하면 "TypeError"가 발생한다.

numbers = (10, 20, 30)

numbers[0] = 100
# TypeError 발생

단, Tuple 안에 List 같은 Mutable 객체가 포함되어 있다면 해당 객체의 내부 요소는 변경할 수 있다.

---

13. Packing과 Unpacking

Packing은 여러 값을 하나의 자료구조로 묶는 것이다.

Unpacking은 묶인 요소들을 여러 변수에 나누어 할당하는 것이다.

Packing

person = ("Kim", 25, "Data Analyst")

Unpacking

name, age, job = person

print(name)  # Kim
print(age)   # 25
print(job)   # Data Analyst

변수의 개수와 요소의 개수가 맞아야 한다.

별표 Unpacking

numbers = [10, 20, 30, 40]

first, *middle, last = numbers

print(first)   # 10
print(middle)  # [20, 30]
print(last)    # 40

---

14. List와 Tuple 비교

구분| List| Tuple
표기| "[]"| "()"
수정| 가능| 불가능
순서| 있음| 있음
중복| 허용| 허용
인덱싱| 가능| 가능
용도| 변경 가능한 데이터| 고정된 데이터 묶음

활용 예시

List는 데이터가 추가되거나 삭제될 수 있는 경우에 적합하다.

Tuple은 좌표, 고정된 설정값처럼 요소 구성이 바뀌지 않아야 하는 경우에 적합하다.

---

15. Dictionary

Dictionary는 Key와 Value를 쌍으로 저장하는 자료구조이다.

중괄호 "{}"를 사용해 생성하며, 인덱스가 아니라 Key로 Value에 접근한다.

student = {
    "name": "Kim",
    "age": 25,
    "major": "Statistics"
}

특징

- Key와 Value로 구성된다.
- Key는 중복될 수 없다.
- Value는 중복될 수 있다.
- Key를 기준으로 데이터에 접근한다.
- 데이터 추가, 수정, 삭제가 가능하다.
- 삽입 순서를 유지한다.

Dictionary의 Key는 Hashable 객체여야 한다.

---

16. Dictionary 요소 접근

Dictionary는 Key를 사용하여 Value에 접근한다.

student = {
    "name": "Kim",
    "age": 25,
    "major": "Statistics"
}

print(student["name"])  # Kim
print(student["age"])   # 25

존재하지 않는 Key에 접근하면 "KeyError"가 발생한다.

get()

"get()"은 Key가 존재하지 않을 때 기본값을 반환할 수 있다.

print(student.get("score"))
# None

print(student.get("score", 0))
# 0

존재 여부가 불확실한 Key를 조회할 때 유용하다.

---

17. Dictionary 요소 추가 및 수정

Dictionary는 Key를 기준으로 Value를 추가하거나 수정할 수 있다.

student = {
    "name": "Kim",
    "age": 25
}

student["major"] = "Statistics"
student["age"] = 26

print(student)
# {'name': 'Kim', 'age': 26, 'major': 'Statistics'}

- 존재하지 않는 Key에 할당하면 새 요소가 추가된다.
- 이미 존재하는 Key에 할당하면 Value가 변경된다.

---

18. Dictionary 주요 메서드

메서드| 설명
"keys()"| 모든 Key를 조회
"values()"| 모든 Value를 조회
"items()"| Key와 Value 쌍을 조회
"get()"| Key로 Value 조회
"update()"| 여러 Key-Value 쌍 추가 및 수정
"pop()"| 지정한 Key 삭제 후 Value 반환
"setdefault()"| Key가 없으면 기본값으로 추가
"clear()"| 모든 요소 삭제
"copy()"| 얕은 복사 수행

keys(), values(), items()

student = {
    "name": "Kim",
    "age": 25,
    "major": "Statistics"
}

print(list(student.keys()))
# ['name', 'age', 'major']

print(list(student.values()))
# ['Kim', 25, 'Statistics']

print(list(student.items()))
# [('name', 'Kim'), ('age', 25), ('major', 'Statistics')]

update()

student.update({
    "age": 26,
    "score": 95
})

기존 Key의 Value는 변경되고, 새로운 Key는 추가된다.

---

19. Dictionary 반복문 활용

Dictionary는 반복문과 함께 자주 사용된다.

scores = {
    "math": 90,
    "english": 85,
    "python": 95
}

for subject, score in scores.items():
    print(subject, score)

출력 결과:

math 90
english 85
python 95

데이터 분석에서는 컬럼별 통계량, 모델 평가 지표, 설정값 등을 관리할 때 유용하다.

---

20. Set

Set은 중복되지 않는 요소들을 저장하는 자료구조이다.

집합 연산을 지원하며, 순서가 없는 자료구조이다.

numbers = {1, 2, 3, 4}

특징

- 중복 요소를 허용하지 않는다.
- 순서가 없다.
- 인덱싱과 슬라이싱이 불가능하다.
- 요소 추가 및 삭제가 가능하다.
- 합집합, 교집합, 차집합 등의 연산을 지원한다.
- 요소는 Hashable 객체여야 한다.

---

21. Set 생성과 중복 제거

Set은 중복된 데이터를 제거할 때 사용할 수 있다.

numbers = [1, 2, 2, 3, 3, 4]

unique_numbers = set(numbers)

print(unique_numbers)
# {1, 2, 3, 4}

단, Set은 순서를 보장하지 않으므로 순서 유지가 필요한 경우에는 주의해야 한다.

빈 Set 생성

a = {}
b = set()

print(type(a))  # <class 'dict'>
print(type(b))  # <class 'set'>

"{}"는 빈 Dictionary를 생성하므로, 빈 Set은 "set()"으로 생성해야 한다.

---

22. Set 집합 연산

Set에서는 수학의 집합 연산을 사용할 수 있다.

a = {1, 2, 3}
b = {3, 4, 5}

합집합 Union

print(a | b)
# {1, 2, 3, 4, 5}

교집합 Intersection

print(a & b)
# {3}

차집합 Difference

print(a - b)
# {1, 2}

대칭차집합 Symmetric Difference

print(a ^ b)
# {1, 2, 4, 5}

연산| 연산자| 메서드
합집합| "|"| "union()"
교집합| "&"| "intersection()"
차집합| "-"| "difference()"
대칭차집합| "^"| "symmetric_difference()"

---

23. Set 주요 메서드

메서드| 설명
"add()"| 요소 하나 추가
"update()"| 여러 요소 추가
"remove()"| 지정한 요소 삭제
"discard()"| 요소가 있으면 삭제
"pop()"| 임의의 요소를 삭제하고 반환
"clear()"| 모든 요소 삭제
"copy()"| 얕은 복사 수행

add()

numbers = {1, 2, 3}

numbers.add(4)

remove()와 discard()

numbers = {1, 2, 3}

numbers.remove(2)
numbers.discard(5)

"remove()"는 없는 요소를 삭제하려 하면 "KeyError"가 발생하지만, "discard()"는 오류 없이 넘어간다.

---

24. Mutable과 Immutable

Mutable은 생성 후 내부 상태를 변경할 수 있는 객체를 의미한다.

Immutable은 생성 후 내부 상태를 변경할 수 없는 객체를 의미한다.

자료구조| 변경 가능 여부
List| Mutable
Tuple| Immutable
Dictionary| Mutable
Set| Mutable
String| Immutable

주의할 점

Immutable 객체를 참조하는 변수에 새로운 값을 할당하는 것과 객체 자체를 변경하는 것은 다르다.

a = "Python"
a = "Java"

위 코드는 기존 문자열을 수정한 것이 아니라 "a"가 다른 문자열 객체를 참조하도록 변경한 것이다.

---

25. Shallow Copy와 Deep Copy

Python에서 자료구조를 복사할 때는 Shallow Copy와 Deep Copy를 구분해야 한다.

Shallow Copy

얕은 복사는 바깥쪽 객체를 새로 생성하지만, 내부 중첩 객체는 기존 객체를 참조할 수 있다.

original = [[1, 2], [3, 4]]

copied = original.copy()

copied[0][0] = 100

print(original)
# [[100, 2], [3, 4]]

내부 List를 공유하기 때문에 원본에도 변경이 반영된다.

Deep Copy

깊은 복사는 중첩 객체까지 재귀적으로 복사한다.

import copy

original = [[1, 2], [3, 4]]

copied = copy.deepcopy(original)

copied[0][0] = 100

print(original)
# [[1, 2], [3, 4]]

중첩된 List나 Dictionary를 다룰 때 복사 방식을 구분하는 것이 중요하다.

---

26. 자료구조별 시간 복잡도

자료구조에 따라 데이터 조회, 추가, 삭제의 시간 복잡도가 달라진다.

작업| List| Dictionary| Set
인덱스로 조회| O(1)| 해당 없음| 해당 없음
Key로 조회| 해당 없음| 평균 O(1)| 해당 없음
값 포함 여부 확인| O(n)| Key 기준 평균 O(1)| 평균 O(1)
끝에 요소 추가| 평균 O(1)| 해당 없음| 해당 없음
요소 추가| 위치에 따라 다름| 평균 O(1)| 평균 O(1)
요소 삭제| 위치에 따라 다름| Key 기준 평균 O(1)| 평균 O(1)

Dictionary와 Set은 해시 테이블 기반이므로 평균적으로 빠른 조회 성능을 제공한다.

다만 해시 충돌 등 특정 상황에서는 최악의 시간 복잡도가 달라질 수 있다.

---

27. 데이터 분석에서의 활용

Python 자료구조는 데이터 분석 과정에서도 자주 사용된다.

List: 여러 데이터 저장

scores = [85, 90, 78, 95]

average = sum(scores) / len(scores)

print(average)
# 87.0

Tuple: 고정된 데이터 묶음

coordinate = (37.5, 127.0)

latitude, longitude = coordinate

Dictionary: 컬럼별 데이터 관리

data = {
    "name": ["Kim", "Lee", "Park"],
    "score": [90, 85, 95]
}

Pandas DataFrame을 생성할 때 사용할 수 있다.

import pandas as pd

df = pd.DataFrame(data)

Set: 중복 제거 및 비교

train_users = {"A", "B", "C"}
test_users = {"C", "D", "E"}

overlap = train_users & test_users

print(overlap)
# {'C'}

이처럼 Set은 데이터 중복이나 집합 간 교집합을 확인할 때 유용하다.

---

28. 자료구조 선택 기준

상황에 맞는 자료구조를 선택하는 것이 중요하다.

상황| 적합한 자료구조
순서가 있는 여러 데이터 저장| List
요소를 추가하거나 수정해야 함| List
고정된 데이터 묶음| Tuple
Key로 데이터를 빠르게 조회| Dictionary
컬럼명과 데이터 연결| Dictionary
중복 데이터 제거| Set
두 데이터 집합 비교| Set
요소 포함 여부를 자주 확인| Set

---

29. 자료구조 사용 시 주의할 점

- List는 수정 가능하지만 Tuple은 수정할 수 없다.
- Dictionary는 Key를 사용하여 데이터에 접근한다.
- Dictionary의 Key와 Set의 요소는 Hashable이어야 한다.
- Set은 순서가 없으므로 인덱싱할 수 없다.
- 중복 제거를 위해 Set을 사용하면 원래 순서가 유지되지 않을 수 있다.
- "append()"와 "extend()"의 차이를 구분해야 한다.
- "sort()"는 원본을 변경하고 "sorted()"는 새 List를 반환한다.
- "remove()"와 "pop()"은 삭제 기준과 반환값이 다르다.
- 중첩 자료구조를 복사할 때는 Shallow Copy와 Deep Copy의 차이를 고려해야 한다.
- 자료구조의 특성과 시간 복잡도를 고려하여 적절하게 선택해야 한다.

---

30. 정리

- Python의 대표적인 자료구조에는 List, Tuple, Dictionary, Set이 있다.
- List는 순서가 있고 수정 가능한 자료구조이다.
- List는 중복을 허용하며 인덱싱과 슬라이싱이 가능하다.
- "append()"는 요소 하나를 추가하고 "extend()"는 여러 요소를 추가한다.
- "sort()"는 원본 List를 변경하고 "sorted()"는 정렬된 새 List를 반환한다.
- Tuple은 순서가 있지만 요소를 직접 수정할 수 없는 자료구조이다.
- Packing은 값을 묶는 과정이고 Unpacking은 묶인 값을 변수에 나누어 할당하는 과정이다.
- Dictionary는 Key-Value 형태로 데이터를 저장한다.
- Dictionary는 Key 기준으로 데이터를 빠르게 조회할 수 있다.
- Set은 중복을 허용하지 않는 순서 없는 자료구조이다.
- Set은 합집합, 교집합, 차집합 등의 연산을 지원한다.
- Mutable은 수정 가능한 객체, Immutable은 수정 불가능한 객체를 의미한다.
- Shallow Copy는 내부 객체를 공유할 수 있고, Deep Copy는 중첩 객체까지 복사한다.
- 자료구조를 선택할 때는 순서, 중복, 수정 가능 여부, 조회 방식, 시간 복잡도를 고려해야 한다.