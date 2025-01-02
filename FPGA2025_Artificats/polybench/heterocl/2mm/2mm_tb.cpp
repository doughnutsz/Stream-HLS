void kernel(
	float v40[180][210],
	float v41[210][190],
	float v42[190][220],
	float v43[180][220],
	float v44[180][220]
);

int main() {
	// array declarations
	float v40[180][210];
	float v41[210][190];
	float v42[190][220];
	float v43[180][220];
	float v44[180][220];

	// call top
	kernel(v40, v41, v42, v43, v44);

	return 0;
}
