void kernel(
	float v20[390][410],
	float v21[390][410],
	float v22[410],
	float v23[410]
);

int main() {
	// array declarations
	float v20[390][410];
	float v21[390][410];
	float v22[410];
	float v23[410];

	// call top
	kernel(v20, v21, v22, v23);

	return 0;
}
