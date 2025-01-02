
void kernel_2mm(
  float v40[180*210],
  float v41[210*190],
  float v42[190*220],
  float v43[180*220],
  float v44[180*220]
);

int main(){
  float v40[180*210];
  float v41[210*190];
  float v42[190*220];
  float v43[180*220];
  float v44[180*220];
  kernel_2mm(v40, v41, v42, v43, v44);
  return 0;
}