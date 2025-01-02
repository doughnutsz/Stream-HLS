void kernel(
	float v45[180][200],
	float v46[200][190],
	float v47[190][220],
	float v48[220][210],
	float v49[180][210]
);

int main() {
	// array declarations
	float v45[180][200];
	float v46[200][190];
	float v47[190][220];
	float v48[220][210];
	float v49[180][210];

	// call top
	kernel(v45, v46, v47, v48, v49);

	return 0;
}
