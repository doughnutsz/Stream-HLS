#define M 390
#define N 410
void kernel(
	float A[N][M],
	float s[M],
	float q[N],
	float p[M],
	float r[N]
);

int main() {
	// array declarations
	float A[N][M];
	float s[M];
	float q[N];
	float p[M];
	float r[N];

	// call top
	kernel(A, s, q, p, r);

	return 0;
}
