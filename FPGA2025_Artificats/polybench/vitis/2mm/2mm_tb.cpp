#define NI 180
#define NJ 190
#define NK 210
#define NL 220
void kernel(
	float alpha,
	float beta,
	float tmp[NI][NJ],
	float A[NI][NK],
	float B[NK][NJ],
	float C[NJ][NL],
	float D[NI][NL]
);

int main() {
	// array declarations
	float alpha;
	float beta;
	float tmp[NI][NJ];
	float A[NI][NK];
	float B[NK][NJ];
	float C[NJ][NL];
	float D[NI][NL];

	// call top
	kernel(alpha, beta, tmp, A, B, C, D);

	return 0;
}
