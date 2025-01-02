void kernel_mvt(
	float v28[400][400],
	float v29[400][400],
	float v30[400],
	float v31[400],
	float v32[400],
	float v33[400],
	float v34[400],
	float v35[400]
);

int main() {
	// array declarations
	float v28[400][400];
	float v29[400][400];
	float v30[400];
	float v31[400];
	float v32[400];
	float v33[400];
	float v34[400];
	float v35[400];

	// call top
	kernel_mvt(v28, v29, v30, v31, v32, v33, v34, v35);

	return 0;
}
