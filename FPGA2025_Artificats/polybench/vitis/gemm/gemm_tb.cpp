#define NI 200
#define NJ 220
#define NK 240
void kernel(
	float alpha,
	float beta,
	float C[NI][NJ],
	float A[NI][NK],
	float B[NK][NJ]
);

int main() {
	// array declarations
	float alpha;
	float beta;
	float C[NI][NJ];
	float A[NI][NK];
	float B[NK][NJ];

	// call top
	kernel(alpha, beta, C, A, B);

	return 0;
}
