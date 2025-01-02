void test_3mm(
	float v0[180][200],
	float v1[200][190],
	float v2[190][220],
	float v3[220][210],
	float v4[180][210],
	float v5[180][190],
	float v6[190][210]
);

int main() {
	// array declarations
	float v0[180][200];
	float v1[200][190];
	float v2[190][220];
	float v3[220][210];
	float v4[180][210];
	float v5[180][190];
	float v6[190][210];

	// call top
	test_3mm(v0, v1, v2, v3, v4, v5, v6);

	return 0;
}
