Optimizer 개념 정리

1. Optimizer

Optimizer는 손실 함수 값을 줄이기 위해 모델의 가중치와 편향을 업데이트하는 알고리즘이다.

딥러닝 모델은 예측값과 실제값의 차이를 손실 함수로 계산하고, Optimizer를 통해 손실이 줄어드는 방향으로 파라미터를 조정한다.

---

2. Optimizer가 필요한 이유

신경망은 학습 과정에서 가중치와 편향을 계속 수정한다.

이때 어떤 방향으로, 얼마나 크게 값을 수정할지 결정하는 역할을 Optimizer가 한다.

즉, Optimizer는 모델이 더 나은 예측을 하도록 파라미터를 업데이트하는 방법이다.

---

3. Gradient Descent 경사하강법

Gradient Descent는 손실 함수의 기울기를 이용해 손실이 작아지는 방향으로 파라미터를 업데이트하는 방법이다.

$$
w = w - \eta \frac{\partial L}{\partial w}
$$

- $w$: 가중치
- $\eta$: 학습률 Learning Rate
- $L$: 손실 함수
- $\frac{\partial L}{\partial w}$: 가중치에 대한 손실 함수의 기울기

기울기가 양수이면 가중치를 줄이고, 기울기가 음수이면 가중치를 늘리는 방향으로 업데이트한다.

---

4. Learning Rate 학습률

Learning Rate는 한 번 업데이트할 때 파라미터를 얼마나 크게 조정할지 결정하는 값이다.

- 학습률이 너무 크면 최적점을 지나쳐 학습이 불안정해질 수 있다.
- 학습률이 너무 작으면 학습 속도가 느려질 수 있다.
- 적절한 학습률을 선택하는 것이 중요하다.

---

5. Batch Gradient Descent

Batch Gradient Descent는 전체 학습 데이터를 한 번에 사용하여 기울기를 계산하는 방법이다.

특징

- 전체 데이터를 사용하므로 업데이트 방향이 안정적이다.
- 데이터가 많으면 계산 비용이 크다.
- 한 번 업데이트하는 데 시간이 오래 걸릴 수 있다.

---

6. Stochastic Gradient Descent SGD

SGD는 한 번에 하나의 데이터만 사용하여 기울기를 계산하고 파라미터를 업데이트하는 방법이다.

특징

- 업데이트가 빠르다.
- 계산 비용이 적다.
- 데이터 하나마다 업데이트하므로 학습 과정이 불안정할 수 있다.
- 손실값이 진동하면서 최적점에 접근할 수 있다.

---

7. Mini-batch Gradient Descent

Mini-batch Gradient Descent는 전체 데이터 중 일부 묶음인 mini-batch를 사용하여 기울기를 계산하는 방법이다.

딥러닝에서는 보통 Mini-batch Gradient Descent를 가장 많이 사용한다.

특징

- Batch Gradient Descent보다 계산이 빠르다.
- SGD보다 업데이트가 안정적이다.
- GPU 연산에 효율적이다.
- batch size를 조절하여 학습 속도와 안정성을 조정할 수 있다.

---

8. Momentum

Momentum은 이전 업데이트 방향을 현재 업데이트에 반영하는 방법이다.

기울기가 계속 비슷한 방향으로 움직이면 더 빠르게 이동하고, 방향이 자주 바뀌면 진동을 줄이는 효과가 있다.

특징

- 학습 속도를 높일 수 있다.
- 진동을 줄여 더 안정적으로 학습할 수 있다.
- 지역 최솟값에 갇히는 문제를 어느 정도 완화할 수 있다.

---

9. RMSProp

RMSProp은 각 파라미터마다 학습률을 다르게 조정하는 Optimizer이다.

최근 기울기의 제곱 평균을 이용하여, 기울기가 큰 파라미터는 작게 업데이트하고 기울기가 작은 파라미터는 상대적으로 크게 업데이트한다.

특징

- 파라미터별로 학습률을 조정한다.
- 학습이 비교적 안정적이다.
- 기울기 크기 차이가 큰 문제에서 유용하다.
- RNN 학습에서 자주 사용되었다.

---

10. Adam

Adam은 Momentum과 RMSProp의 장점을 결합한 Optimizer이다.

이전 기울기의 방향성과 기울기 크기 정보를 함께 사용하여 파라미터를 업데이트한다.

딥러닝에서 가장 많이 사용되는 Optimizer 중 하나이다.

특징

- 학습 속도가 빠른 편이다.
- 다양한 문제에서 안정적으로 작동한다.
- 학습률을 자동으로 어느 정도 조정한다.
- 기본 Optimizer로 자주 사용된다.

---

11. Optimizer 비교

Optimizer| 핵심 개념| 특징
Gradient Descent| 전체 데이터로 기울기 계산| 안정적이지만 느림
SGD| 데이터 하나씩 업데이트| 빠르지만 불안정할 수 있음
Mini-batch GD| 일부 데이터 묶음으로 업데이트| 속도와 안정성의 균형
Momentum| 이전 업데이트 방향 반영| 진동 감소, 학습 가속
RMSProp| 파라미터별 학습률 조정| 기울기 크기 차이에 대응
Adam| Momentum + RMSProp| 가장 널리 사용됨

---

12. Optimizer 선택 기준

상황| 추천 Optimizer
기본 딥러닝 모델 학습| Adam
단순한 모델 또는 기본 실험| SGD
학습이 진동하거나 느릴 때| Momentum
RNN 계열 모델| RMSProp, Adam
빠른 초기 실험| Adam

일반적으로 처음에는 Adam을 사용하고, 성능을 더 세밀하게 조정하고 싶을 때 다른 Optimizer를 비교한다.

---

13. Optimizer와 Loss Function의 관계

Loss Function은 모델이 얼마나 틀렸는지를 측정한다.

Optimizer는 그 손실값을 줄이기 위해 파라미터를 업데이트한다.

즉, Loss Function이 학습의 목표를 정의한다면, Optimizer는 그 목표에 도달하기 위한 방법을 결정한다.

---

14. 정리

- Optimizer는 손실을 줄이기 위해 가중치와 편향을 업데이트하는 알고리즘이다.
- Gradient Descent는 손실 함수의 기울기를 이용해 파라미터를 수정한다.
- Learning Rate는 한 번에 얼마나 크게 업데이트할지 결정한다.
- Mini-batch Gradient Descent는 딥러닝에서 가장 많이 사용되는 방식이다.
- Momentum은 이전 업데이트 방향을 반영해 학습을 안정화한다.
- RMSProp은 파라미터별로 학습률을 조정한다.
- Adam은 Momentum과 RMSProp의 장점을 결합한 Optimizer이다.
- 실무에서는 Adam을 기본 Optimizer로 많이 사용한다.