void test_2mm(
	float v0[180][210],
	float v1[210][190],
	float v2[190][220],
	float v3[180][220],
	float v4[180][220],
	float v5,
	float v6,
	float v7[180][190],
	float v8[180][220]
);

int main() {
	// array declarations
	float v0[180][210];
	float v1[210][190];
	float v2[190][220];
	float v3[180][220];
	float v4[180][220];
	float v5;
	float v6;
	float v7[180][190];
	float v8[180][220];

	// call top
	test_2mm(v0, v1, v2, v3, v4, v5, v6, v7, v8);

	return 0;
}
