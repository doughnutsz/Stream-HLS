#define M 390
#define N 410
void kernel(
	float A[M][N],
	float x[N],
	float y[N],
	float tmp[M]
);

int main() {
	// array declarations
	float A[M][N];
	float x[N];
	float y[N];
	float tmp[M];

	// call top
	kernel(A, x, y, tmp);

	return 0;
}
