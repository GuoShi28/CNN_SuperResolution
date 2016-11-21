Change Notes:
Original Model: 16ECCV
Training data:72162
Var data:17838

1.2016/11/21
    Change1:
    Plus: Residual learning. 
    Change2:
    plus: GPU support
    Change3:
    plus: Batch support ---> x (H x W x D x N) batch:20
    Change4:
    change model: 
        old model: $\sum \bar{k_g}\phi(k_g \cdot g) + \sum \bar{k_d}\phi(k_d \cdot d)$
        new model: $\sum \bar{k_g}\phi(k_g \cdot g + k_d \cdot d)$