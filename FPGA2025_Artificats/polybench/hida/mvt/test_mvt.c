
#define N 400

void test_mvt(float A[N][N], float y1[N], float y2[N], float x1[N],
                float x2[N]) {
#pragma scop
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      x1[i] += A[i][j] * y1[j];
    }
  }

  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      x2[i] += A[j][i] * y2[j];
    }
  }
#pragma endscop
}