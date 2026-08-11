CNN 개념 정리

1. CNN

CNN은 Convolutional Neural Network의 약자로, 이미지와 같은 격자 형태의 데이터를 처리하는 데 많이 사용되는 딥러닝 모델이다.

한국어로는 합성곱 신경망이라고 한다.

CNN은 이미지의 전체 픽셀을 한 번에 보는 것이 아니라, 작은 영역을 순차적으로 보면서 특징을 추출한다.

---

2. CNN이 사용되는 이유

이미지 데이터는 픽셀 수가 많고, 위치에 따라 의미가 달라질 수 있다.

일반적인 Fully Connected Neural Network를 이미지에 그대로 사용하면 다음과 같은 문제가 있다.

- 파라미터 수가 너무 많아진다.
- 이미지의 공간적 구조를 잘 활용하기 어렵다.
- 위치가 조금만 바뀌어도 다른 패턴으로 인식할 수 있다.

CNN은 이미지의 공간적 구조를 유지하면서 중요한 특징을 추출할 수 있기 때문에 이미지 처리에 적합하다.

---

3. CNN의 기본 구조

CNN은 보통 다음과 같은 구조로 이루어진다.

Input Image
→ Convolution Layer
→ Activation Function
→ Pooling Layer
→ Flatten
→ Fully Connected Layer
→ Output

각 단계는 이미지에서 특징을 추출하고, 최종적으로 분류나 예측을 수행하는 역할을 한다.

---

4. Convolution Layer

Convolution Layer는 이미지에서 특징을 추출하는 층이다.

작은 필터를 이미지 위에서 이동시키며 계산을 수행하고, 이미지의 특정 패턴을 감지한다.

예를 들어 필터는 다음과 같은 특징을 감지할 수 있다.

- 선
- 모서리
- 색상 변화
- 질감
- 특정 형태

---

5. Filter / Kernel

Filter 또는 Kernel은 이미지에서 특징을 찾기 위해 사용하는 작은 행렬이다.

예를 들어 3x3 필터는 이미지의 3x3 영역을 보면서 계산을 수행한다.

필터는 학습 과정에서 자동으로 업데이트되며, 모델이 중요한 특징을 스스로 학습하게 된다.

---

6. Feature Map

Feature Map은 필터가 이미지를 지나가며 계산한 결과이다.

즉, 특정 필터가 감지한 특징이 이미지의 어느 위치에 강하게 나타나는지를 보여주는 결과라고 볼 수 있다.

하나의 필터는 하나의 Feature Map을 만든다.
여러 개의 필터를 사용하면 여러 개의 Feature Map이 생성된다.

---

7. Stride

Stride는 필터가 한 번에 이동하는 간격이다.

예를 들어 Stride가 1이면 필터가 한 칸씩 이동하고, Stride가 2이면 두 칸씩 이동한다.

Stride| 특징
작을수록| 더 촘촘하게 특징 추출
클수록| 출력 크기 감소, 계산량 감소

Stride가 커질수록 Feature Map의 크기는 작아진다.

---

8. Padding

Padding은 이미지의 가장자리에 값을 추가하는 방법이다.

Convolution 연산을 하면 이미지 크기가 줄어들 수 있는데, Padding을 사용하면 출력 크기를 조절할 수 있다.

Padding을 사용하는 이유

- 이미지 크기가 너무 빨리 줄어드는 것을 방지한다.
- 가장자리 정보도 충분히 반영할 수 있다.
- Convolution 이후 Feature Map 크기를 유지할 수 있다.

대표적으로 가장자리에 0을 채우는 Zero Padding을 많이 사용한다.

---

9. Activation Function

Convolution Layer 이후에는 보통 활성화 함수를 적용한다.

CNN에서는 주로 ReLU를 많이 사용한다.

Convolution → ReLU

ReLU는 음수 값을 0으로 만들고, 양수 값은 그대로 통과시킨다.

이를 통해 모델이 비선형 패턴을 학습할 수 있다.

---

10. Pooling Layer

Pooling Layer는 Feature Map의 크기를 줄이는 역할을 한다.

이미지의 중요한 특징은 유지하면서 데이터 크기와 계산량을 줄인다.

대표적인 Pooling 방법은 다음과 같다.

Pooling| 설명
Max Pooling| 영역 안에서 가장 큰 값 선택
Average Pooling| 영역 안의 평균값 계산

CNN에서는 보통 Max Pooling을 많이 사용한다.

---

11. Max Pooling

Max Pooling은 정해진 영역 안에서 가장 큰 값을 선택하는 방식이다.

예를 들어 2x2 영역에서 가장 큰 값 하나만 남긴다.

특징

- 중요한 특징을 강조한다.
- Feature Map 크기를 줄인다.
- 계산량을 줄인다.
- 위치 변화에 조금 더 강해질 수 있다.

---

12. Flatten

Flatten은 2차원 또는 3차원 형태의 Feature Map을 1차원 벡터로 변환하는 과정이다.

Convolution Layer와 Pooling Layer를 거친 결과는 이미지 구조를 가진 형태이다.
이를 Fully Connected Layer에 넣기 위해 1차원으로 펼친다.

Feature Map → Flatten → Fully Connected Layer

---

13. Fully Connected Layer

Fully Connected Layer는 Flatten된 벡터를 입력받아 최종 분류나 예측을 수행하는 층이다.

CNN의 앞부분이 이미지에서 특징을 추출하는 역할을 한다면, Fully Connected Layer는 추출된 특징을 바탕으로 최종 판단을 수행한다.

예를 들어 이미지 분류 문제에서는 각 클래스에 대한 점수를 출력한다.

---

14. CNN의 학습 과정

CNN의 학습 과정은 일반 신경망과 비슷하다.

1. 이미지를 입력한다.
2. Convolution Layer에서 특징을 추출한다.
3. Activation Function을 적용한다.
4. Pooling Layer에서 크기를 줄인다.
5. Flatten을 통해 1차원 벡터로 변환한다.
6. Fully Connected Layer에서 최종 예측을 수행한다.
7. 손실 함수를 계산한다.
8. 역전파를 통해 필터와 가중치를 업데이트한다.

---

15. CNN의 장점

CNN은 이미지 데이터 처리에서 다음과 같은 장점이 있다.

- 이미지의 공간적 구조를 활용할 수 있다.
- 필터를 통해 지역적인 특징을 추출할 수 있다.
- 파라미터 수를 줄일 수 있다.
- 위치 변화에 어느 정도 강하다.
- 이미지 분류, 객체 탐지, 이미지 생성 등 다양한 분야에 활용된다.

---

16. CNN의 한계

CNN도 몇 가지 한계가 있다.

- 많은 데이터가 필요할 수 있다.
- 학습에 많은 연산 자원이 필요하다.
- 이미지의 전체적인 관계를 이해하는 데 한계가 있을 수 있다.
- 모델이 왜 특정 예측을 했는지 해석하기 어려울 수 있다.

---

17. CNN 활용 분야

CNN은 주로 이미지 관련 문제에 많이 사용된다.

분야| 예시
이미지 분류| 고양이와 강아지 분류
객체 탐지| 이미지 속 사람, 자동차 위치 찾기
의료 영상 분석| X-ray, MRI 이미지 분석
얼굴 인식| 얼굴 검출 및 인증
자율주행| 차선, 보행자, 표지판 인식

---

18. 정리

- CNN은 이미지 데이터 처리에 많이 사용되는 딥러닝 모델이다.
- Convolution Layer는 필터를 이용해 이미지의 특징을 추출한다.
- Filter 또는 Kernel은 이미지의 작은 영역을 보며 패턴을 감지한다.
- Feature Map은 필터가 감지한 특징의 결과이다.
- Stride는 필터가 이동하는 간격이다.
- Padding은 이미지 크기를 조절하고 가장자리 정보를 보존하기 위해 사용한다.
- Pooling Layer는 Feature Map의 크기를 줄이고 중요한 특징을 유지한다.
- Flatten은 Feature Map을 Fully Connected Layer에 넣기 위해 1차원으로 펼치는 과정이다.
- CNN은 이미지 분류, 객체 탐지, 의료 영상 분석 등 다양한 분야에 활용된다.