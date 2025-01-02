import torch_mlir
import torch 
import time

def convertTorchToMLIR(model, inputs, outPath, output_type="linalg-on-tensors", print_weights=False):
  model.train(False)
  model.eval()
  module = torch_mlir.compile(model, inputs, output_type=output_type, use_tracing=True)
  with open(outPath, "w") as f:
    if print_weights:
      print(module.operation.get_asm(), file=f)
    else:
      print(module.operation.get_asm(large_elements_limit=1), file=f)


def generateGoldenResults(model, inputs, outPath):
  print("Saving golden results to", outPath)
  # save inputs as binary files
  for i, input in enumerate(inputs):
    with open(outPath + f"input_{i}.bin", "wb") as f:
      f.write(input.detach().numpy().tobytes())
  # measure inference time
  model.train(False)
  model.eval()
  start = time.time()
  outputs = model(*inputs)
  end = time.time()
  # if outputs is a tuple, store each tensor as a separate binary file
  if isinstance(outputs, tuple):
    for idx, output in enumerate(outputs):
      # store torch tensor as binary file
      with open(outPath + f"output_{idx}.bin", "wb") as f:
        f.write(output.detach().numpy().tobytes())
  else:
    # store torch tensor as binary file
    with open(outPath + "output_0.bin", "wb") as f:
      f.write(outputs.detach().numpy().tobytes())
  return end - start
  # store to text file
  # linearize the tensor
  # outputs = outputs.flatten()
  # with open(outPath + ".txt", "w") as f:
  #   for i in range(outputs.shape[0]):
  #     print(outputs[i].item(), file=f)

  
def randTensor(*shape, dtype=torch.float32):
  if dtype.is_floating_point:
    return torch.rand(*shape, dtype=dtype) * 2 - 1
  elif dtype == torch.bool:
    return torch.randint(0, 2, shape, dtype=dtype)
  else:
    if dtype.is_signed:
      return torch.randint(-10, 10, shape, dtype=dtype)
    else:
      return torch.randint(0, 10, shape, dtype=dtype)

  