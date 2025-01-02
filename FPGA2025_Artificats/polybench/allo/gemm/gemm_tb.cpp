void kernel_gemm(
	float v24[200][240],
	float v25[240][220],
	float v26[200][220],
	float v27[200][220]
);

int main() {
	// array declarations
	float v24[200][240];
	float v25[240][220];
	float v26[200][220];
	float v27[200][220];

	// call top
	kernel_gemm(v24, v25, v26, v27);

	return 0;
}
