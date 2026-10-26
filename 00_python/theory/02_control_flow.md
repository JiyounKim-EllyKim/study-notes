Python Control Flow 개념 정리

1. Control Flow

Control Flow는 프로그램의 실행 흐름을 제어하는 구조이다.

Python에서는 조건에 따라 코드를 실행하거나, 특정 작업을 반복하거나, 반복문의 실행 흐름을 변경할 수 있다.

대표적인 제어문은 다음과 같다.

구분| 문법| 설명
조건문| "if", "elif", "else"| 조건에 따라 코드 실행
반복문| "for"| 반복 가능한 객체의 요소를 순회
반복문| "while"| 조건이 참인 동안 반복
흐름 제어| "break"| 반복문 종료
흐름 제어| "continue"| 현재 반복을 건너뛰고 다음 반복 진행
흐름 제어| "pass"| 아무 작업도 수행하지 않음

---

2. if문

"if"문은 조건이 "True"일 때 특정 코드를 실행하는 조건문이다.

score = 85

if score >= 80:
    print("합격")

특징

- 조건식의 결과가 참이면 코드 블록을 실행한다.
- 조건식 끝에 콜론 ":"을 사용한다.
- 실행할 코드 블록은 들여쓰기로 구분한다.

---

3. if-else문

"else"는 "if"의 조건이 거짓일 때 실행할 코드를 정의한다.

score = 65

if score >= 60:
    print("합격")
else:
    print("불합격")

"if-else"는 두 가지 경우 중 하나를 선택할 때 사용한다.

---

4. if-elif-else문

"elif"는 여러 조건을 순서대로 검사할 때 사용한다.

score = 85

if score >= 90:
    grade = "A"
elif score >= 80:
    grade = "B"
elif score >= 70:
    grade = "C"
else:
    grade = "F"

print(grade)
# B

주의할 점

- 조건은 위에서 아래로 검사한다.
- 처음으로 참이 된 조건의 코드 블록만 실행한다.
- 한 조건이 실행되면 나머지 "elif", "else"는 실행하지 않는다.
- 조건의 순서가 결과에 영향을 줄 수 있다.

---

5. 비교 연산자

조건문에서는 비교 연산자를 자주 사용한다.

연산자| 의미
"=="| 두 값이 같은가
"!="| 두 값이 다른가
">"| 왼쪽 값이 더 큰가
"<"| 왼쪽 값이 더 작은가
">="| 왼쪽 값이 크거나 같은가
"<="| 왼쪽 값이 작거나 같은가

age = 25

if age >= 20:
    print("성인")

Python에서는 연속 비교도 가능하다.

score = 85

if 80 <= score < 90:
    print("B등급")

---

6. 논리 연산자

여러 조건을 결합할 때는 논리 연산자를 사용한다.

연산자| 설명
"and"| 모든 조건이 참이어야 함
"or"| 하나 이상의 조건이 참이면 됨
"not"| 조건의 참과 거짓을 반대로 변경

score = 85
attendance = 90

if score >= 80 and attendance >= 80:
    print("수료 가능")

Short-circuit Evaluation

Python의 "and", "or"는 필요하지 않은 표현식의 평가를 생략할 수 있다.

x = 0

if x != 0 and 10 / x > 2:
    print("조건 만족")

첫 번째 조건이 거짓이므로 두 번째 조건은 평가하지 않는다.

---

7. Membership Operator

"in"과 "not in"은 특정 값이 자료구조에 포함되어 있는지 확인하는 연산자이다.

fruits = ["apple", "banana", "orange"]

if "banana" in fruits:
    print("바나나가 있습니다.")

if "grape" not in fruits:
    print("포도가 없습니다.")

Dictionary에서는 기본적으로 Key의 존재 여부를 검사한다.

student = {"name": "Kim", "score": 90}

print("score" in student)
# True

---

8. 조건부 표현식

조건부 표현식은 간단한 "if-else"문을 한 줄로 작성하는 방법이다.

Conditional Expression 또는 삼항 연산자라고도 한다.

기본 형태

value_if_true if condition else value_if_false

예시

score = 85

result = "합격" if score >= 60 else "불합격"

print(result)
# 합격

간단한 조건 처리에 유용하지만, 조건이 복잡하면 일반적인 "if-else"문이 더 읽기 쉽다.

---

9. for문

"for"문은 반복 가능한 객체 Iterable의 요소를 하나씩 가져와 코드 블록을 실행하는 반복문이다.

numbers = [10, 20, 30]

for num in numbers:
    print(num)

출력 결과:

10
20
30

특징

- List, Tuple, String, Dictionary, Set 등을 순회할 수 있다.
- 반복 가능한 객체에서 요소를 하나씩 가져온다.
- 데이터 처리에서 자주 사용한다.

---

10. range()

"range()"는 정수의 범위를 표현하는 객체를 생성한다.

"for"문에서 정해진 횟수만큼 반복할 때 자주 사용한다.

기본 형태

range(start, stop, step)

- "start": 시작값, 기본값 0
- "stop": 종료값, 포함하지 않음
- "step": 증가 또는 감소 간격, 기본값 1

예시

for i in range(5):
    print(i)

출력 결과:

0
1
2
3
4

시작과 종료 지정

for i in range(1, 6):
    print(i)

1부터 5까지 출력한다.

간격 지정

for i in range(0, 10, 2):
    print(i)

출력 결과:

0
2
4
6
8

---

11. 문자열 반복

문자열도 Iterable이므로 "for"문으로 순회할 수 있다.

text = "Python"

for char in text:
    print(char)

문자열의 각 문자를 순서대로 가져온다.

문자열 처리나 특정 문자 개수 계산 등에 활용할 수 있다.

---

12. Dictionary 반복

Dictionary를 반복하면 기본적으로 Key를 순회한다.

scores = {
    "math": 90,
    "english": 85,
    "python": 95
}

for key in scores:
    print(key)

items()

Key와 Value를 함께 가져오려면 "items()"를 사용한다.

for subject, score in scores.items():
    print(subject, score)

출력 결과:

math 90
english 85
python 95

데이터 분석에서는 컬럼명과 통계량, 모델명과 평가 점수 등을 함께 처리할 때 유용하다.

---

13. enumerate()

"enumerate()"는 Iterable의 요소와 인덱스를 함께 가져오는 함수이다.

fruits = ["apple", "banana", "orange"]

for idx, fruit in enumerate(fruits):
    print(idx, fruit)

출력 결과:

0 apple
1 banana
2 orange

start 매개변수

for idx, fruit in enumerate(fruits, start=1):
    print(idx, fruit)

출력 결과:

1 apple
2 banana
3 orange

활용 상황

- 반복 순서 번호 표시
- 인덱스와 데이터를 함께 처리
- 데이터 목록에 순번 부여

직접 인덱스 변수를 증가시키는 것보다 코드가 간결해진다.

---

14. zip()

"zip()"은 여러 Iterable의 요소를 같은 위치끼리 묶어 순회할 수 있게 한다.

names = ["Kim", "Lee", "Park"]
scores = [90, 85, 95]

for name, score in zip(names, scores):
    print(name, score)

출력 결과:

Kim 90
Lee 85
Park 95

특징

- 여러 Iterable을 동시에 순회할 수 있다.
- 기본적으로 가장 짧은 Iterable의 길이에 맞춰 반복한다.
- 반환값은 Iterator이다.

Dictionary 생성

names = ["Kim", "Lee", "Park"]
scores = [90, 85, 95]

result = dict(zip(names, scores))

print(result)
# {'Kim': 90, 'Lee': 85, 'Park': 95}

strict=True

Python 3.10 이상에서는 길이가 다른 Iterable을 실수로 함께 처리하지 않도록 "strict=True"를 사용할 수 있다.

a = [1, 2, 3]
b = [10, 20]

list(zip(a, b, strict=True))
# ValueError 발생

---

15. while문

"while"문은 조건식이 참인 동안 코드 블록을 반복 실행한다.

count = 0

while count < 5:
    print(count)
    count += 1

출력 결과:

0
1
2
3
4

특징

- 조건식이 참인 동안 반복한다.
- 반복 횟수가 미리 정해지지 않은 상황에 유용하다.
- 종료 조건을 명확히 설정해야 한다.

---

16. for문과 while문 비교

구분| for| while
반복 기준| Iterable의 요소| 조건식
반복 횟수| 대상에 따라 결정| 조건에 따라 결정
주요 활용| List 순회, 데이터 처리| 조건 충족까지 반복
주의할 점| 반복 대상 확인| 무한 루프 주의

for문이 적합한 경우

scores = [90, 80, 70]

for score in scores:
    print(score)

while문이 적합한 경우

count = 0

while count < 3:
    print("Retry")
    count += 1

---

17. 무한 루프 Infinite Loop

무한 루프는 반복문의 종료 조건이 충족되지 않아 반복이 계속되는 상황이다.

while True:
    print("반복 중")

위 코드는 별도의 종료 조건이 없으면 계속 실행된다.

실제로는 "break"를 사용하여 특정 조건에서 종료할 수 있다.

count = 0

while True:
    if count >= 3:
        break

    print(count)
    count += 1

---

18. break

"break"는 현재 실행 중인 가장 안쪽 반복문을 즉시 종료한다.

numbers = [10, 20, 30, 40, 50]

for num in numbers:
    if num == 30:
        break

    print(num)

출력 결과:

10
20

활용 상황

- 원하는 데이터를 찾았을 때
- 특정 조건을 만족하면 검색 종료
- 반복 횟수 제한
- 오류나 예외 상황에서 반복 중단

---

19. continue

"continue"는 현재 반복의 남은 코드를 건너뛰고 다음 반복으로 이동한다.

numbers = [1, 2, 3, 4, 5]

for num in numbers:
    if num == 3:
        continue

    print(num)

출력 결과:

1
2
4
5

"break"는 반복문 전체를 종료하지만, "continue"는 현재 반복만 건너뛴다.

---

20. pass

"pass"는 아무 작업도 수행하지 않는 문장이다.

문법적으로 코드 블록이 필요하지만 아직 구현하지 않은 경우 사용할 수 있다.

score = 90

if score >= 80:
    pass

break, continue, pass 비교

문법| 동작
"break"| 반복문 종료
"continue"| 다음 반복으로 이동
"pass"| 아무 작업도 하지 않고 실행 계속

---

21. 반복문의 else

Python에서는 "for"문과 "while"문에도 "else"를 사용할 수 있다.

반복문이 "break"로 종료되지 않고 정상적으로 끝나면 "else" 블록이 실행된다.

numbers = [10, 20, 30]

for num in numbers:
    if num == 40:
        print("찾았습니다.")
        break
else:
    print("찾지 못했습니다.")

출력 결과:

찾지 못했습니다.

주의할 점

- "break"로 반복문이 종료되면 "else"가 실행되지 않는다.
- 반복이 정상 종료되면 "else"가 실행된다.
- 반복 횟수가 0회여도 "break" 없이 끝났다면 "else"가 실행된다.

검색 작업에서 원하는 값을 찾지 못했을 때 유용하다.

---

22. 중첩 반복문 Nested Loop

중첩 반복문은 반복문 안에 또 다른 반복문이 있는 구조이다.

for i in range(1, 4):
    for j in range(1, 3):
        print(i, j)

출력 결과:

1 1
1 2
2 1
2 2
3 1
3 2

바깥쪽 반복문의 각 반복마다 안쪽 반복문이 실행된다.

주의할 점

중첩 반복문은 데이터 크기에 따라 실행 시간이 크게 증가할 수 있다.

예를 들어 길이가 각각 n, m인 두 List의 모든 조합을 순회하면 시간 복잡도는 일반적으로 O(nm)이다.

데이터 분석에서는 중첩 반복문 대신 벡터화 연산이나 Pandas 기능을 사용할 수 있는지 검토하는 것이 좋다.

---

23. any()와 all()

"any()"와 "all()"은 여러 조건을 한 번에 확인할 때 사용하는 내장 함수이다.

any()

하나 이상의 요소가 참이면 "True"를 반환한다.

conditions = [False, False, True]

print(any(conditions))
# True

all()

모든 요소가 참이면 "True"를 반환한다.

conditions = [True, True, True]

print(all(conditions))
# True

활용 예시

scores = [85, 92, 78]

print(any(score >= 90 for score in scores))
# True

print(all(score >= 60 for score in scores))
# True

빈 Iterable에 대해 "any()"는 "False", "all()"은 "True"를 반환한다.

---

24. 데이터 분석에서의 활용

조건문과 반복문은 데이터 전처리와 모델 평가 과정에서도 자주 사용된다.

조건에 맞는 데이터 필터링

scores = [85, 45, 92, 60, 35]

passed = []

for score in scores:
    if score >= 60:
        passed.append(score)

print(passed)
# [85, 92, 60]

결측값 제외

values = [10, None, 20, None, 30]

cleaned = []

for value in values:
    if value is not None:
        cleaned.append(value)

print(cleaned)
# [10, 20, 30]

"if value:"처럼 작성하면 "0"도 함께 제외될 수 있으므로, 결측값 확인에는 "is not None"을 사용하는 것이 좋다.

예측 정확도 계산

y_true = [1, 0, 1, 1, 0]
y_pred = [1, 0, 0, 1, 0]

correct = 0

for actual, predicted in zip(y_true, y_pred):
    if actual == predicted:
        correct += 1

accuracy = correct / len(y_true)

print(accuracy)
# 0.8

실제 머신러닝에서는 "sklearn.metrics.accuracy_score()" 등의 함수를 사용하는 것이 일반적이다.

---

25. 반복문과 Comprehension

반복문을 사용한 간단한 데이터 변환은 Comprehension으로 더 간결하게 표현할 수 있다.

일반 반복문

numbers = [1, 2, 3, 4, 5]

squares = []

for num in numbers:
    squares.append(num ** 2)

List Comprehension

numbers = [1, 2, 3, 4, 5]

squares = [num ** 2 for num in numbers]

두 코드는 같은 결과를 생성한다.

[1, 4, 9, 16, 25]

Comprehension은 다음 이론 파일 중 하나인 "04_comprehension.md"에서 자세히 다룬다.

---

26. Control Flow 사용 시 주의할 점

- "if", "for", "while" 뒤에는 콜론 ":"을 사용한다.
- 코드 블록은 일관된 들여쓰기로 구분한다.
- "if-elif-else"는 조건을 위에서 아래로 검사한다.
- "range()"의 종료값은 포함되지 않는다.
- "enumerate()"는 인덱스와 요소를 함께 반환한다.
- "zip()"은 기본적으로 가장 짧은 Iterable에 맞춰 반복한다.
- "while"문에서는 반드시 종료 조건을 확인해야 한다.
- "break"와 "continue"의 차이를 구분한다.
- 중첩 반복문이 많아지면 시간 복잡도를 고려해야 한다.
- 데이터 크기가 큰 경우 불필요한 Python 반복문 대신 NumPy나 Pandas의 벡터화 연산을 고려한다.

---

27. 정리

- Control Flow는 프로그램의 실행 흐름을 제어하는 구조이다.
- "if", "elif", "else"는 조건에 따라 실행할 코드를 결정한다.
- 비교 연산자와 논리 연산자를 사용해 다양한 조건을 표현할 수 있다.
- "in", "not in"은 데이터 포함 여부를 확인한다.
- 조건부 표현식을 사용하면 간단한 조건문을 한 줄로 표현할 수 있다.
- "for"문은 Iterable의 요소를 순회하는 반복문이다.
- "range()"는 정수 범위를 표현하며 반복 횟수를 지정할 때 자주 사용한다.
- "enumerate()"는 인덱스와 요소를 함께 가져온다.
- "zip()"은 여러 Iterable을 동시에 순회할 수 있게 한다.
- "while"문은 조건이 참인 동안 코드를 반복 실행한다.
- "break"는 반복문을 종료하고 "continue"는 다음 반복으로 이동한다.
- "pass"는 아무 작업도 수행하지 않는 문장이다.
- 반복문의 "else"는 "break" 없이 정상 종료되었을 때 실행된다.
- "any()"는 하나 이상의 조건이 참인지, "all()"은 모든 조건이 참인지 확인한다.
- 데이터 분석에서는 조건문과 반복문을 필터링, 결측값 처리, 모델 평가 등에 활용할 수 있다.