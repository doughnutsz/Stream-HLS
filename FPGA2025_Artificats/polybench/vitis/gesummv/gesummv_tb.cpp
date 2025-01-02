#define N 250
void kernel(
	float alpha,
	float beta,
	float A[N][N],
	float B[N][N],
	float tmp[N],
	float x[N],
	float y[N]
);

int main() {
	// array declarations
	float alpha;
	float beta;
	float A[N][N];
	float B[N][N];
	float tmp[N];
	float x[N];
	float y[N];

	// call top
	kernel(alpha, beta, A, B, tmp, x, y);

	return 0;
}
