void test_2mm(
	float v0,
	float v1,
	float v2,
	float v3[180][210],
	float v4[210][190],
	float v5[190][220],
	float v6[180][220],
	float v7[180][190]
);

int main() {
	// array declarations
	float v0;
	float v1;
	float v2;
	float v3[180][210];
	float v4[210][190];
	float v5[190][220];
	float v6[180][220];
	float v7[180][190];

	// call top
	test_2mm(v0, v1, v2, v3, v4, v5, v6, v7);

	return 0;
}
