import torch
import torch.nn as nn

class gesummv(nn.Module):
  def __init__(self):
    super(gesummv, self).__init__()
  
  def forward(self, A, B, x):
    # return alpha * A @ B + beta * B.sum(dim=1).unsqueeze(1)
    tmp = A @ x
    y = B @ x
    y = 1.5 * tmp + 1.2 * y
    return y