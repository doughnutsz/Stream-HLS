void test_gemm(
	float v0,
	float v1,
	float v2[200][240],
	float v3[240][220],
	float v4[200][220]
);

int main() {
	// array declarations
	float v0;
	float v1;
	float v2[200][240];
	float v3[240][220];
	float v4[200][220];

	// call top
	test_gemm(v0, v1, v2, v3, v4);

	return 0;
}
