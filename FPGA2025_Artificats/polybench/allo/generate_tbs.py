# import regex
import re
import argparse
import os
import sys
import json

models = ["gemm", "atax", "bicg", "mvt", "gesummv"]
tops_folders = ["gemm", "atax", "bicg", "mvt", "gesummv"]
# load from psize.json
psizes = json.load(open('psize.json', 'r'))
for model, top_folder in zip(models, tops_folders):
  # psize = psizes[model]['medium']
  print(f'Generating testbench for {model}')
  tb_path = f'{model}/{top_folder}_tb.cpp'
  kernel_path = f'{model}/{top_folder}.cpp'
  # with open(tb_path, 'w') as f:

  # print func signature
  # store kernel source code
  kernel_code = ''
  with open(kernel_path, 'r') as kernel_file:
    kernel_code = kernel_file.read()

  # search for top function with name 'forward' and store its signature
  # the signature starts with ( and ends with )
  # example:
  # /// This is top function.
  # void kernel_gemm(
  #   float v24[200][240],
  #   float v25[240][220],
  #   float v26[200][220],
  #   float v27[200][220]
  # )
  top_name = f'kernel_{top_folder}'
  signature = re.search(rf'void {top_name}\(([^)]+)\)', kernel_code)
  
  if signature is None:
    print(f'Function forward not found in {kernel_path}')
    sys.exit(1)
  signature = signature.group(1)
  arguments = signature.split(',')
  arguments_type_shape = [arg.strip() for arg in arguments]
  # arguments without type and array size
  arguments_type = [re.sub(r'\[[0-9]+\]', '', arg) for arg in arguments_type_shape]
  # arguments without type
  arguments_names = [re.sub(r'float ', '', arg) for arg in arguments_type]
  # generate testbench
  tb_code = ''
  tb_code += f'void {top_name}(\n'
  for idx, arg in enumerate(arguments_type_shape):
    tb_code += f'\t{arg}'
    if idx < len(arguments_type_shape) - 1:
      tb_code += ',\n'
  tb_code += '\n);\n'
  tb_code += '\n'
  tb_code += 'int main() {\n'
  tb_code += '\t// array declarations\n'
  for arg in arguments_type_shape:
    tb_code += f'\t{arg};\n'
  tb_code += '\n'
  tb_code += '\t// call top\n'
  tb_code += f'\t{top_name}('
  for idx, arg in enumerate(arguments_names):
    tb_code += f'{arg}'
    if idx < len(arguments_names) - 1:
      tb_code += ', '
  tb_code += ');\n'
  tb_code += '\n'
  tb_code += '\treturn 0;\n'
  tb_code += '}\n'

  # save to file
  with open(tb_path, 'w') as f:
    f.write(tb_code)
    



