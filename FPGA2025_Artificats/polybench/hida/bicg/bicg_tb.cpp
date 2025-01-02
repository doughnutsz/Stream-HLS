void test_bicg(
	float v0[410][390],
	float v1[390],
	float v2[410],
	float v3[410],
	float v4[390]
);

int main() {
	// array declarations
	float v0[410][390];
	float v1[390];
	float v2[410];
	float v3[410];
	float v4[390];

	// call top
	test_bicg(v0, v1, v2, v3, v4);

	return 0;
}
