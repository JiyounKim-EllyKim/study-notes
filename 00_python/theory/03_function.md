Python Function 개념 정리

1. Function

Function은 특정 작업을 수행하는 코드를 하나의 단위로 묶은 것이다.

반복적으로 사용하는 코드를 함수로 정의하면 코드의 재사용성과 가독성을 높일 수 있다.

함수를 사용하는 이유

- 중복 코드 감소
- 코드 재사용
- 기능별 모듈화
- 유지보수 편의성 향상
- 테스트와 디버깅 용이
- 복잡한 작업을 작은 단위로 분리

---

2. 함수 정의

Python에서는 "def" 키워드를 사용하여 함수를 정의한다.

기본 구조

def function_name(parameter):
    # 실행할 코드
    return result

예시

def add(a, b):
    return a + b

result = add(10, 20)

print(result)
# 30

구성 요소

구성 요소| 설명
"def"| 함수 정의 키워드
함수명| 함수를 호출할 때 사용하는 이름
Parameter| 함수 정의 시 전달받을 값의 변수
함수 본문| 실행할 코드
"return"| 호출한 곳에 결과 반환

---

3. 함수 호출

함수는 정의만으로 실행되지 않는다.

정의한 함수를 사용하려면 함수 이름과 괄호를 이용해 호출해야 한다.

def greet():
    print("Hello, Python!")

greet()

출력 결과:

Hello, Python!

함수는 여러 번 호출할 수 있다.

greet()
greet()
greet()

같은 기능을 반복해서 사용할 때 유용하다.

---

4. Parameter와 Argument

Parameter와 Argument는 모두 함수에 전달되는 값과 관련된 개념이지만 의미가 다르다.

구분| 설명
Parameter| 함수 정의에서 사용하는 매개변수
Argument| 함수 호출 시 실제로 전달하는 인자

def add(a, b):
    return a + b

add(10, 20)

- "a", "b": Parameter
- "10", "20": Argument

---

5. Positional Argument

Positional Argument는 전달하는 위치에 따라 Parameter에 값이 할당되는 방식이다.

def introduce(name, age):
    print(f"이름: {name}, 나이: {age}")

introduce("Kim", 25)

함수를 정의한 순서에 따라 값이 전달된다.

주의할 점

인자의 순서가 바뀌면 결과도 달라질 수 있다.

def subtract(a, b):
    return a - b

print(subtract(10, 3))  # 7
print(subtract(3, 10))  # -7

---

6. Keyword Argument

Keyword Argument는 Parameter 이름을 지정하여 값을 전달하는 방식이다.

def introduce(name, age):
    print(f"이름: {name}, 나이: {age}")

introduce(age=25, name="Kim")

특징

- 전달 순서에 덜 의존한다.
- 각 인자의 의미를 명확하게 표현할 수 있다.
- 매개변수가 많은 함수에서 가독성을 높일 수 있다.

Positional Argument와 Keyword Argument를 함께 사용할 수도 있다.

introduce("Kim", age=25)

단, 일반적인 함수 호출에서는 Positional Argument를 Keyword Argument 뒤에 배치할 수 없다.

---

7. Default Parameter

Default Parameter는 함수 정의 시 매개변수에 기본값을 지정하는 방식이다.

함수 호출에서 해당 인자를 전달하지 않으면 기본값이 사용된다.

def greet(name, message="안녕하세요"):
    print(f"{name}님, {message}!")

greet("Kim")
# Kim님, 안녕하세요!

greet("Kim", "반갑습니다")
# Kim님, 반갑습니다!

특징

- 선택적인 인자를 만들 수 있다.
- 반복적으로 사용하는 값을 기본값으로 지정할 수 있다.
- 함수를 더 유연하게 사용할 수 있다.

일반적인 매개변수 선언에서는 기본값이 없는 매개변수를 기본값이 있는 매개변수 뒤에 배치할 수 없다.

---

8. Mutable Default Argument 주의

함수의 기본값으로 List나 Dictionary 같은 Mutable 객체를 사용할 때는 주의해야 한다.

기본 인자 객체는 함수가 정의될 때 생성되며, 이후 호출에서도 재사용될 수 있다.

잘못된 예시

def add_item(item, items=[]):
    items.append(item)
    return items

print(add_item("A"))
# ['A']

print(add_item("B"))
# ['A', 'B']

이전 호출에서 수정한 List가 다음 호출에서도 사용된다.

권장 방식

def add_item(item, items=None):
    if items is None:
        items = []

    items.append(item)
    return items

호출할 때마다 새로운 List가 필요하다면 "None"을 기본값으로 사용하는 것이 안전하다.

---

9. return

"return"은 함수 실행 결과를 호출한 곳에 반환하는 키워드이다.

def multiply(a, b):
    return a * b

result = multiply(3, 4)

print(result)
# 12

특징

- 함수의 결과를 반환한다.
- "return"이 실행되면 해당 함수의 실행이 종료된다.
- 반환된 값은 변수에 저장하거나 다른 계산에 사용할 수 있다.

---

10. return과 print()의 차이

"return"과 "print()"는 서로 다른 역할을 한다.

구분| return| print()
목적| 결과 반환| 화면에 출력
반환값 활용| 가능| "print()" 자체는 "None" 반환
함수 실행 종료| 실행 종료| 종료하지 않음

print()만 사용하는 함수

def add(a, b):
    print(a + b)

result = add(10, 20)

print(result)

출력 결과:

30
None

함수 안에서 "30"을 출력했지만 별도의 값을 반환하지 않았기 때문에 "result"에는 "None"이 저장된다.

return을 사용하는 함수

def add(a, b):
    return a + b

result = add(10, 20)

print(result)
# 30

데이터 분석 함수에서는 결과를 다른 작업에 활용할 수 있도록 "return"을 사용하는 경우가 많다.

---

11. 여러 값 반환

Python 함수는 여러 값을 쉼표로 구분하여 반환할 수 있다.

def calculate(a, b):
    return a + b, a - b

result = calculate(10, 3)

print(result)
# (13, 7)

여러 값을 반환하면 Tuple로 묶인다.

Unpacking

total, difference = calculate(10, 3)

print(total)       # 13
print(difference)  # 7

여러 결과를 동시에 반환해야 할 때 유용하다.

---

12. Early Return

Early Return은 특정 조건을 만족하면 함수 실행을 일찍 종료하는 방식이다.

def divide(a, b):
    if b == 0:
        return None

    return a / b

장점

- 불필요한 중첩 조건문을 줄일 수 있다.
- 예외 상황을 먼저 처리할 수 있다.
- 코드 흐름을 단순하게 만들 수 있다.

단, 실제 서비스에서는 단순히 "None"을 반환하는 대신 적절한 예외를 발생시키는 것이 더 명확할 수 있다.

---

13. *args

"*args"는 함수에 전달되는 여러 Positional Argument를 하나의 Tuple로 묶어 받는 방식이다.

인자의 개수가 정해지지 않았을 때 사용한다.

def add_numbers(*args):
    return sum(args)

print(add_numbers(1, 2, 3))
# 6

print(add_numbers(10, 20, 30, 40))
# 100

특징

- 여러 위치 인자를 전달받을 수 있다.
- 함수 내부에서는 Tuple 형태로 처리한다.
- 인자의 개수가 달라질 수 있는 함수에 유용하다.

"args"는 관례적인 이름이며, 실제로 가변 위치 인자를 받는 문법은 "*"이다.

---

14. **kwargs

"**kwargs"는 여러 Keyword Argument를 Dictionary 형태로 묶어 받는 방식이다.

def print_info(**kwargs):
    for key, value in kwargs.items():
        print(key, value)

print_info(name="Kim", age=25, major="Statistics")

출력 결과:

name Kim
age 25
major Statistics

특징

- 여러 키워드 인자를 전달받을 수 있다.
- 함수 내부에서는 Dictionary 형태로 처리한다.
- 옵션이나 설정값을 유연하게 전달할 때 유용하다.

"kwargs" 역시 관례적인 이름이며, 핵심 문법은 "**"이다.

---

15. *args와 **kwargs 비교

구분| *args| **kwargs
인자 유형| Positional Argument| Keyword Argument
저장 형태| Tuple| Dictionary
사용 목적| 여러 위치 인자 처리| 여러 키워드 인자 처리

함께 사용하는 예시

def example(*args, **kwargs):
    print(args)
    print(kwargs)

example(10, 20, name="Kim", score=95)

출력 결과:

(10, 20)
{'name': 'Kim', 'score': 95}

---

16. Argument Unpacking

함수를 호출할 때 "*"와 "**"를 사용해 자료구조의 요소를 인자로 풀어 전달할 수도 있다.

List 또는 Tuple Unpacking

def add(a, b):
    return a + b

numbers = [10, 20]

print(add(*numbers))
# 30

Dictionary Unpacking

def introduce(name, age):
    print(name, age)

person = {
    "name": "Kim",
    "age": 25
}

introduce(**person)

- "*": Iterable의 요소를 위치 인자로 전달
- "**": Mapping의 Key-Value를 키워드 인자로 전달

---

17. Positional-only와 Keyword-only Parameter

Python에서는 인자를 전달하는 방식을 제한할 수 있다.

Positional-only Parameter

"/" 앞에 있는 매개변수는 위치 인자로만 전달할 수 있다.

def add(a, b, /):
    return a + b

add(10, 20)

"add(a=10, b=20)"처럼 호출하면 "TypeError"가 발생한다.

Keyword-only Parameter

"*" 뒤에 있는 매개변수는 키워드 인자로만 전달해야 한다.

def train_model(data, *, test_size=0.2):
    print(test_size)

train_model([1, 2, 3], test_size=0.3)

이 방식은 인자의 의미를 명확히 해야 하는 함수에서 유용하다.

---

18. Scope

Scope는 변수에 접근할 수 있는 유효 범위를 의미한다.

Python에서는 변수가 정의된 위치에 따라 접근 가능한 범위가 달라진다.

대표적으로 Local Scope와 Global Scope가 있다.

Local Variable

함수 내부에서 정의한 변수이다.

def calculate():
    result = 10 + 20
    return result

"result"는 함수의 지역 변수이므로 함수 밖에서 직접 접근할 수 없다.

Global Variable

함수 밖에서 정의한 변수이다.

message = "Hello"

def greet():
    print(message)

greet()
# Hello

함수 내부에서도 전역 변수를 참조할 수 있다.

---

19. LEGB Rule

Python은 변수 이름을 찾을 때 LEGB 규칙을 따른다.

순서| Scope| 설명
L| Local| 현재 함수 내부
E| Enclosing| 바깥쪽 함수의 지역 범위
G| Global| 모듈 수준의 전역 범위
B| Built-in| Python 내장 이름

Local
→ Enclosing
→ Global
→ Built-in

가장 가까운 범위부터 이름을 찾는다.

예시

x = "global"

def outer():
    x = "enclosing"

    def inner():
        x = "local"
        print(x)

    inner()

outer()
# local

---

20. global

"global"은 함수 내부에서 모듈 수준의 전역 변수에 값을 재할당할 때 사용하는 키워드이다.

count = 0

def increase():
    global count
    count += 1

increase()

print(count)
# 1

주의할 점

전역 변수를 함수 내부에서 변경하면 함수의 실행 결과를 추적하기 어려워질 수 있다.

가능하면 전역 변수 변경보다 인자와 반환값을 활용하는 방식이 권장된다.

---

21. nonlocal

"nonlocal"은 중첩 함수에서 바깥쪽 함수의 변수를 재할당할 때 사용한다.

def outer():
    count = 0

    def inner():
        nonlocal count
        count += 1

    inner()
    return count

print(outer())
# 1

global과 nonlocal 비교

구분| global| nonlocal
대상| 전역 변수| 바깥쪽 함수의 변수
사용 위치| 함수 내부| 중첩 함수 내부
목적| 전역 변수 재할당| Enclosing Scope 변수 재할당

---

22. Lambda Function

Lambda는 간단한 익명 함수를 정의할 때 사용하는 표현식이다.

기본 구조

lambda parameter: expression

일반 함수

def square(x):
    return x ** 2

Lambda

square = lambda x: x ** 2

print(square(5))
# 25

Lambda는 하나의 표현식으로 구성되며, 그 표현식의 결과를 반환한다.

---

23. Lambda 활용

Lambda는 짧은 함수를 다른 함수의 인자로 전달할 때 유용하다.

sorted()와 Lambda

students = [
    ("Kim", 90),
    ("Lee", 85),
    ("Park", 95)
]

result = sorted(students, key=lambda x: x[1])

print(result)
# [('Lee', 85), ('Kim', 90), ('Park', 95)]

두 번째 요소인 점수를 기준으로 정렬한다.

주의할 점

- 단순한 작업에 사용하면 코드가 간결해진다.
- 복잡한 로직을 Lambda로 작성하면 가독성이 떨어질 수 있다.
- 여러 단계의 처리가 필요하면 일반 함수를 정의하는 것이 좋다.

---

24. map()

"map()"은 Iterable의 각 요소에 함수를 적용하는 내장 함수이다.

numbers = [1, 2, 3, 4]

result = map(lambda x: x ** 2, numbers)

print(list(result))
# [1, 4, 9, 16]

특징

- 각 요소에 동일한 함수를 적용한다.
- 결과를 지연 계산하는 Iterator를 반환한다.
- List로 변환하거나 반복문으로 순회할 수 있다.

---

25. filter()

"filter()"는 조건을 만족하는 요소만 선택하는 내장 함수이다.

numbers = [1, 2, 3, 4, 5, 6]

result = filter(lambda x: x % 2 == 0, numbers)

print(list(result))
# [2, 4, 6]

조건식이 참으로 평가되는 요소만 남긴다.

map()과 filter() 비교

구분| map()| filter()
목적| 각 요소 변환| 조건에 맞는 요소 선택
반환| Iterator| Iterator
주요 활용| 값 변환| 데이터 필터링

간단한 변환과 필터링은 List Comprehension으로도 표현할 수 있다.

---

26. First-class Function

Python에서는 함수를 First-class Object로 다룰 수 있다.

즉, 함수를 일반적인 객체처럼 변수에 저장하거나 다른 함수에 전달하거나 반환할 수 있다.

함수를 변수에 할당

def greet():
    return "Hello"

func = greet

print(func())
# Hello

함수를 인자로 전달

def apply_function(func, value):
    return func(value)

def square(x):
    return x ** 2

print(apply_function(square, 5))
# 25

이러한 특징은 Callback, Decorator, 함수형 프로그래밍 등에 활용된다.

---

27. Closure

Closure는 내부 함수가 바깥쪽 함수의 변수를 기억하고 사용할 수 있는 구조이다.

def multiply_by(n):
    def multiply(x):
        return x * n

    return multiply

double = multiply_by(2)

print(double(5))
# 10

"multiply_by()" 실행이 끝난 이후에도 내부 함수는 "n=2"를 참조할 수 있다.

Closure는 함수 설정값 유지, Decorator 구현 등에 활용된다.

---

28. Recursive Function

Recursive Function은 함수가 자기 자신을 다시 호출하는 재귀 함수이다.

예시: Factorial

def factorial(n):
    if n <= 1:
        return 1

    return n * factorial(n - 1)

print(factorial(5))
# 120

재귀 함수의 구성

- Base Case: 재귀 호출을 종료하는 조건
- Recursive Case: 자기 자신을 다시 호출하는 부분

주의할 점

- 종료 조건이 반드시 필요하다.
- 재귀 호출이 너무 깊어지면 "RecursionError"가 발생할 수 있다.
- 단순 반복 작업은 반복문이 더 효율적일 수 있다.

---

29. Docstring

Docstring은 함수의 목적과 사용법을 설명하는 문서 문자열이다.

함수 정의 바로 아래에 삼중 따옴표로 작성한다.

def calculate_average(numbers):
    """
    숫자 리스트의 평균을 계산한다.

    Args:
        numbers: 숫자로 구성된 리스트

    Returns:
        계산된 평균값
    """
    return sum(numbers) / len(numbers)

Docstring에 포함하면 좋은 내용

- 함수의 목적
- 매개변수 설명
- 반환값 설명
- 발생할 수 있는 예외
- 사용 예시

"help()" 함수를 이용해 Docstring을 확인할 수 있다.

---

30. Type Hint

Type Hint는 함수의 매개변수와 반환값에 예상 자료형을 표시하는 방법이다.

def add(a: int, b: int) -> int:
    return a + b

특징

- 코드의 의도를 명확하게 표현할 수 있다.
- IDE와 정적 타입 검사 도구에서 활용할 수 있다.
- 협업 시 함수의 입력과 출력 구조를 이해하기 쉽다.
- Python은 기본적으로 Type Hint를 런타임에 강제하지 않는다.

예시

def calculate_average(numbers: list[float]) -> float:
    return sum(numbers) / len(numbers)

"list[float]"는 Python 3.9 이상에서 사용할 수 있는 표기이다.

---

31. 함수의 부작용 Side Effect

Side Effect는 함수가 반환값을 만드는 것 외에 외부 상태를 변경하거나 외부와 상호작용하는 것을 의미한다.

예를 들어 함수 내부에서 전역 변수를 변경하거나 파일을 수정하는 경우가 있다.

numbers = [1, 2, 3]

def add_number(value):
    numbers.append(value)

위 함수는 외부 List를 직접 변경한다.

주의할 점

- 함수 호출 전후의 데이터가 달라질 수 있다.
- 테스트와 디버깅이 어려워질 수 있다.
- 원본 데이터를 유지해야 하는 경우 복사본을 사용하거나 새로운 결과를 반환하는 구조가 좋다.

단, 모든 Side Effect가 나쁜 것은 아니며 파일 저장이나 DB 업데이트처럼 필요한 작업도 있다.

---

32. 데이터 분석에서의 함수 활용

데이터 분석에서는 반복되는 전처리나 통계 계산을 함수로 분리하는 것이 좋다.

결측값 처리

import pandas as pd

def fill_missing_values(df, column, value=0):
    result = df.copy()
    result[column] = result[column].fillna(value)

    return result

원본 DataFrame을 직접 수정하지 않고 새로운 DataFrame을 반환한다.

평균 계산

def calculate_average(numbers):
    if not numbers:
        return None

    return sum(numbers) / len(numbers)

빈 데이터가 전달되었을 때 발생할 수 있는 0으로 나누기 오류를 방지한다.

---

33. 머신러닝에서의 함수 활용

머신러닝 프로젝트에서는 데이터 분리, 모델 학습, 평가 등을 함수로 분리할 수 있다.

예시: 모델 평가 함수

from sklearn.metrics import accuracy_score, f1_score

def evaluate_model(y_true, y_pred):
    accuracy = accuracy_score(y_true, y_pred)
    f1 = f1_score(y_true, y_pred, zero_division=0)

    return {
        "accuracy": accuracy,
        "f1_score": f1
    }

사용 예시

y_true = [1, 0, 1, 1, 0]
y_pred = [1, 0, 0, 1, 0]

result = evaluate_model(y_true, y_pred)

print(result)
# {'accuracy': 0.8, 'f1_score': 0.8}

여러 모델을 비교할 때 동일한 평가 함수를 재사용할 수 있다.

위 예시는 이진 분류를 가정하며, 다중 분류에서는 F1-score의 "average" 설정을 별도로 고려해야 한다.

---

34. 함수 모듈화

함수 모듈화는 기능별로 함수를 분리하여 관리하는 것이다.

프로젝트 규모가 커질수록 모든 코드를 하나의 파일에 작성하면 유지보수가 어려워진다.

예시 구조

project/
├── main.py
├── preprocessing.py
├── modeling.py
└── evaluation.py

preprocessing.py

def remove_duplicates(df):
    return df.drop_duplicates()

main.py

from preprocessing import remove_duplicates

cleaned_df = remove_duplicates(df)

함수를 파일별로 분리하면 코드 재사용과 테스트가 쉬워진다.

---

35. 좋은 함수 작성 원칙

좋은 함수는 하나의 명확한 책임을 가지는 것이 좋다.

권장 사항

- 함수 이름만으로 목적을 알 수 있도록 작성한다.
- 하나의 함수가 너무 많은 작업을 수행하지 않도록 한다.
- 입력과 출력이 명확하도록 설계한다.
- 가능하면 불필요한 전역 변수 사용을 피한다.
- 반복되는 코드를 함수로 분리한다.
- 매개변수의 기본값을 신중하게 설정한다.
- 필요한 경우 Type Hint와 Docstring을 작성한다.
- 예외 상황을 고려한다.
- 함수별로 테스트할 수 있도록 구성한다.

---

36. Function 사용 시 주의할 점

- 함수 정의와 함수 호출을 구분해야 한다.
- Parameter와 Argument의 차이를 이해해야 한다.
- Positional Argument는 순서에 따라 전달된다.
- Keyword Argument는 이름을 기준으로 전달된다.
- Mutable 객체를 Default Parameter로 사용할 때 주의해야 한다.
- "return"과 "print()"의 차이를 구분해야 한다.
- 반환값이 없는 함수는 기본적으로 "None"을 반환한다.
- "*args"는 Tuple, "**kwargs"는 Dictionary로 처리된다.
- Scope에 따라 변수에 접근할 수 있는 범위가 달라진다.
- Lambda는 간단한 표현식에 사용하는 것이 좋다.
- 재귀 함수에는 종료 조건이 필요하다.
- 원본 데이터가 변경되는 Side Effect를 고려해야 한다.

---

37. 정리

- Function은 특정 작업을 수행하는 코드를 하나의 단위로 묶은 것이다.
- Python에서는 "def" 키워드로 함수를 정의한다.
- Parameter는 함수 정의 시 사용하는 매개변수이고, Argument는 호출 시 전달하는 값이다.
- Positional Argument는 위치를 기준으로, Keyword Argument는 이름을 기준으로 전달된다.
- Default Parameter를 사용하면 인자의 기본값을 설정할 수 있다.
- Mutable 객체를 기본값으로 사용할 때는 객체 공유 문제에 주의해야 한다.
- "return"은 함수의 결과를 반환하고 함수 실행을 종료한다.
- "*args"는 여러 위치 인자를 Tuple로 받는다.
- "**kwargs"는 여러 키워드 인자를 Dictionary로 받는다.
- Scope는 변수에 접근할 수 있는 범위이며 LEGB 규칙을 따른다.
- "global"은 전역 변수, "nonlocal"은 바깥쪽 함수의 변수를 재할당할 때 사용한다.
- Lambda는 간단한 익명 함수를 정의하는 표현식이다.
- "map()"은 각 요소에 함수를 적용하고 "filter()"는 조건에 맞는 요소를 선택한다.
- Python에서는 함수를 변수에 저장하거나 다른 함수에 전달할 수 있다.
- Closure는 내부 함수가 바깥쪽 함수의 변수를 기억하는 구조이다.
- Recursive Function은 자기 자신을 다시 호출하는 함수이다.
- Docstring은 함수의 목적과 사용법을 문서화한다.
- Type Hint는 함수의 입력과 출력 자료형을 명시하는 데 도움을 준다.
- 데이터 분석과 머신러닝 프로젝트에서는 전처리, 학습, 평가 기능을 함수로 분리하면 유지보수가 쉬워진다.