void test_mvt(
	float v0[400][400],
	float v1[400],
	float v2[400],
	float v3[400],
	float v4[400]
);

int main() {
	// array declarations
	float v0[400][400];
	float v1[400];
	float v2[400];
	float v3[400];
	float v4[400];

	// call top
	test_mvt(v0, v1, v2, v3, v4);

	return 0;
}
