#define N 400
void kernel(
	float x1[N],
	float x2[N],
	float y1[N],
	float y2[N],
	float A[N][N]
);

int main() {
	// array declarations
	float x1[N];
	float x2[N];
	float y1[N];
	float y2[N];
	float A[N][N];

	// call top
	kernel(x1, x2, y1, y2, A);

	return 0;
}
