Regularization 개념 정리

1. Regularization

Regularization은 모델이 학습 데이터에 지나치게 맞춰지는 것을 방지하기 위한 방법이다.

딥러닝 모델은 표현력이 강하기 때문에 학습 데이터의 패턴뿐만 아니라 노이즈까지 외워버릴 수 있다.
이런 현상을 과대적합 Overfitting이라고 한다.

Regularization은 모델의 복잡도를 줄이거나, 학습 과정을 조절하여 새로운 데이터에 대해서도 잘 예측하도록 돕는다.

---

2. Overfitting 과대적합

과대적합은 모델이 학습 데이터에는 매우 잘 맞지만, 검증 데이터나 새로운 데이터에서는 성능이 떨어지는 현상이다.

특징

- 학습 데이터 성능은 높다.
- 검증 데이터 성능은 낮다.
- 모델이 데이터의 일반적인 패턴보다 학습 데이터의 세부적인 노이즈까지 학습한다.

발생 원인

- 모델이 너무 복잡한 경우
- 학습 데이터가 부족한 경우
- 학습을 너무 오래 진행한 경우
- 데이터에 노이즈가 많은 경우

---

3. L1 / L2 Regularization

L1, L2 Regularization은 손실 함수에 가중치에 대한 패널티를 추가하는 방식이다.

가중치가 지나치게 커지는 것을 막아 모델이 복잡해지는 것을 방지한다.

---

3.1. L1 Regularization

L1 Regularization은 가중치의 절댓값 합을 패널티로 추가한다.

$$
Loss = Original Loss + \lambda \sum |w|
$$

특징

- 일부 가중치를 0으로 만들 수 있다.
- 불필요한 특성을 제거하는 효과가 있다.
- 희소한 모델 Sparse Model을 만들 수 있다.

---

3.2. L2 Regularization

L2 Regularization은 가중치의 제곱합을 패널티로 추가한다.

$$
Loss = Original Loss + \lambda \sum w^2
$$

특징

- 가중치의 크기를 전체적으로 작게 만든다.
- 특정 가중치가 지나치게 커지는 것을 방지한다.
- 딥러닝에서는 Weight Decay라는 이름으로 자주 사용된다.

---

3.3. L1과 L2 비교

구분| L1 Regularization| L2 Regularization
패널티| 가중치 절댓값 합| 가중치 제곱합
특징| 일부 가중치를 0으로 만듦| 전체 가중치를 작게 줄임
효과| 특성 선택 효과| 가중치 크기 제어
관련 개념| Sparse Model| Weight Decay

---

4. Dropout

Dropout은 학습 과정에서 일부 뉴런을 임의로 비활성화하는 방법이다.

매 학습 단계마다 일부 뉴런을 꺼서, 특정 뉴런에 지나치게 의존하지 않도록 만든다.

특징

- 과대적합을 줄이는 데 효과적이다.
- 여러 신경망을 앙상블한 것과 비슷한 효과를 낼 수 있다.
- 학습 시에만 적용하고, 예측 시에는 모든 뉴런을 사용한다.

예를 들어 Dropout 비율이 0.5라면, 학습 과정에서 뉴런의 약 50%를 임의로 비활성화한다.

---

5. Early Stopping

Early Stopping은 검증 데이터의 성능이 더 이상 좋아지지 않을 때 학습을 중단하는 방법이다.

딥러닝 모델은 학습을 오래 할수록 학습 데이터에 더 잘 맞게 된다.
하지만 어느 시점 이후에는 검증 데이터 성능이 오히려 나빠질 수 있다.

Early Stopping은 이 시점에서 학습을 멈춰 과대적합을 방지한다.

특징

- 학습을 너무 오래 진행하는 것을 막는다.
- 검증 손실 Validation Loss를 기준으로 자주 사용한다.
- 불필요한 학습 시간을 줄일 수 있다.

---

6. Batch Normalization

Batch Normalization은 각 층의 입력값 분포를 일정하게 조정하는 방법이다.

학습 과정에서 데이터 분포가 계속 바뀌면 학습이 불안정해질 수 있다.
Batch Normalization은 각 mini-batch 단위로 평균과 분산을 조정하여 학습을 안정화한다.

특징

- 학습을 안정적으로 만든다.
- 학습 속도를 높일 수 있다.
- 기울기 소실 문제를 완화할 수 있다.
- 약한 Regularization 효과도 있다.

---

7. Data Augmentation

Data Augmentation은 기존 데이터를 변형하여 학습 데이터를 늘리는 방법이다.

특히 이미지 데이터에서 자주 사용된다.

예시

- 이미지 회전
- 이미지 좌우 반전
- 이미지 확대 또는 축소
- 이미지 자르기
- 밝기 조절
- 노이즈 추가

Data Augmentation을 사용하면 모델이 다양한 형태의 데이터를 학습할 수 있어 일반화 성능이 좋아질 수 있다.

---

8. Regularization 방법 정리

방법| 핵심 개념| 효과
L1 Regularization| 가중치 절댓값에 패널티| 일부 가중치를 0으로 만듦
L2 Regularization| 가중치 제곱에 패널티| 가중치 크기를 작게 만듦
Dropout| 일부 뉴런을 임의로 비활성화| 특정 뉴런 의존도 감소
Early Stopping| 검증 성능이 나빠지기 전에 학습 중단| 과도한 학습 방지
Batch Normalization| 층의 입력 분포를 정규화| 학습 안정화
Data Augmentation| 데이터를 변형하여 증가| 일반화 성능 향상

---

9. 정리

- Regularization은 과대적합을 줄이기 위한 방법이다.
- 과대적합은 학습 데이터에는 잘 맞지만 새로운 데이터에는 성능이 떨어지는 현상이다.
- L1 Regularization은 일부 가중치를 0으로 만들 수 있다.
- L2 Regularization은 전체 가중치의 크기를 줄인다.
- Dropout은 학습 중 일부 뉴런을 비활성화한다.
- Early Stopping은 검증 성능이 나빠지기 전에 학습을 멈춘다.
- Batch Normalization은 학습을 안정화하고 약한 Regularization 효과를 줄 수 있다.
- Data Augmentation은 데이터를 늘려 일반화 성능을 높인다.