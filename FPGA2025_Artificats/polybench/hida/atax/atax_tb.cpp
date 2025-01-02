void test_atax(
	float v0[390][410],
	float v1[410],
	float v2[410],
	float v3[390]
);

int main() {
	// array declarations
	float v0[390][410];
	float v1[410];
	float v2[410];
	float v3[390];

	// call top
	test_atax(v0, v1, v2, v3);

	return 0;
}
