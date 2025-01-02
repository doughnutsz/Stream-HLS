void test_gemm(
	float v0[200][240],
	float v1[240][220],
	float v2[200][220],
	float v3,
	float v4,
	float v5[200][220]
);

int main() {
	// array declarations
	float v0[200][240];
	float v1[240][220];
	float v2[200][220];
	float v3;
	float v4;
	float v5[200][220];

	// call top
	test_gemm(v0, v1, v2, v3, v4, v5);

	return 0;
}
