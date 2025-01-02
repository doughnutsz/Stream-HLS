void kernel_bicg(
	float v22[410][390],
	// A
  float v23[410][390],
	// A copy
  float v24[390],
	// p
  float v25[410],
	// r
  float v26[410],
	// q
  float v27[390] // s
);

int main() {
	// array declarations
	float v22[410][390];
	// A
  float v23[410][390];
	// A copy
  float v24[390];
	// p
  float v25[410];
	// r
  float v26[410];
	// q
  float v27[390]; // s;

	// call top
	kernel_bicg(v22, // A
  v23, // A copy
  v24, // p
  v25, // r
  v26, // q
  v27);

	return 0;
}
