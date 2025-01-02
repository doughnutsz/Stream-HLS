#define NI 180
#define NJ 190
#define NK 200
#define NL 210
#define NM 220
void kernel(
	float E[NI][NJ],
	float A[NI][NK],
	float B[NK][NJ],
	float F[NJ][NL],
	float C[NJ][NM],
	float D[NM][NL],
	float G[NI][NL]
);

int main() {
	// array declarations
	float E[NI][NJ];
	float A[NI][NK];
	float B[NK][NJ];
	float F[NJ][NL];
	float C[NJ][NM];
	float D[NM][NL];
	float G[NI][NL];

	// call top
	kernel(E, A, B, F, C, D, G);

	return 0;
}
