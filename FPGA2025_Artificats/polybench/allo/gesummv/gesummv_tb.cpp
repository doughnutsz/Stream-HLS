void kernel_gesummv(
	float v35[250][250],
	float v36[250][250],
	float v37[250],
	float v38[250]
);

int main() {
	// array declarations
	float v35[250][250];
	float v36[250][250];
	float v37[250];
	float v38[250];

	// call top
	kernel_gesummv(v35, v36, v37, v38);

	return 0;
}
