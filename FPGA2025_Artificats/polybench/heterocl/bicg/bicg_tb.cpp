void kernel(
	float v22[410][390],
	float v23[410][390],
	float v24[390],
	float v25[410],
	float v26[410],
	float v27[390]
);

int main() {
	// array declarations
	float v22[410][390];
	float v23[410][390];
	float v24[390];
	float v25[410];
	float v26[410];
	float v27[390];

	// call top
	kernel(v22, v23, v24, v25, v26, v27);

	return 0;
}
