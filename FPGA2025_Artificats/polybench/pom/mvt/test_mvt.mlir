module {
  func @test_heat(%arg0: memref<400x400xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 32, d0 floordiv 16, d1 floordiv 32)>>, %arg1: memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>, %arg2: memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>, %arg3: memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>, %arg4: memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>) attributes {resource = #hls.r<lut=0, dsp=5, bram=0>, timing = #hls.t<0 -> 320020, 320020, 320020>, top_func} {
    affine.for %arg5 = 0 to 200 {
      affine.for %arg6 = 0 to 200 {
        %0 = affine.load %arg0[%arg6 * 2, %arg5 * 2] {max_mux_size = 32 : i64, partition_indices = [-1, -1], timing = #hls.t<22 -> 24, 2, 1>} : memref<400x400xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 32, d0 floordiv 16, d1 floordiv 32)>>
        %1 = affine.load %arg3[%arg5 * 2] {partition_indices = [0], timing = #hls.t<18 -> 20, 2, 1>} : memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %2 = arith.mulf %0, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %3 = affine.load %arg1[%arg6 * 2] {partition_indices = [0], timing = #hls.t<14 -> 16, 2, 1>} : memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %4 = arith.addf %2, %3 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %4, %arg1[%arg6 * 2] {partition_indices = [0], timing = #hls.t<8 -> 9, 1, 1>} : memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %5 = affine.load %arg0[%arg5 * 2, %arg6 * 2] {max_mux_size = 32 : i64, partition_indices = [-1, -1], timing = #hls.t<20 -> 22, 2, 1>} : memref<400x400xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 32, d0 floordiv 16, d1 floordiv 32)>>
        %6 = affine.load %arg4[%arg5 * 2] {partition_indices = [0], timing = #hls.t<18 -> 20, 2, 1>} : memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %7 = arith.mulf %5, %6 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %8 = affine.load %arg2[%arg6 * 2] {partition_indices = [0], timing = #hls.t<14 -> 16, 2, 1>} : memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %9 = arith.addf %7, %8 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %9, %arg2[%arg6 * 2] {partition_indices = [0], timing = #hls.t<8 -> 9, 1, 1>} : memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %10 = affine.load %arg0[%arg6 * 2 + 1, %arg5 * 2] {max_mux_size = 32 : i64, partition_indices = [-1, -1], timing = #hls.t<19 -> 21, 2, 1>} : memref<400x400xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 32, d0 floordiv 16, d1 floordiv 32)>>
        %11 = arith.mulf %10, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %12 = affine.load %arg1[%arg6 * 2 + 1] {partition_indices = [1], timing = #hls.t<14 -> 16, 2, 1>} : memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %13 = arith.addf %11, %12 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %13, %arg1[%arg6 * 2 + 1] {partition_indices = [1], timing = #hls.t<8 -> 9, 1, 1>} : memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %14 = affine.load %arg0[%arg5 * 2, %arg6 * 2 + 1] {max_mux_size = 32 : i64, partition_indices = [-1, -1], timing = #hls.t<18 -> 20, 2, 1>} : memref<400x400xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 32, d0 floordiv 16, d1 floordiv 32)>>
        %15 = arith.mulf %14, %6 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %16 = affine.load %arg2[%arg6 * 2 + 1] {partition_indices = [1], timing = #hls.t<14 -> 16, 2, 1>} : memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %17 = arith.addf %15, %16 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %17, %arg2[%arg6 * 2 + 1] {partition_indices = [1], timing = #hls.t<8 -> 9, 1, 1>} : memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %18 = affine.load %arg0[%arg6 * 2, %arg5 * 2 + 1] {max_mux_size = 32 : i64, partition_indices = [-1, -1], timing = #hls.t<13 -> 15, 2, 1>} : memref<400x400xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 32, d0 floordiv 16, d1 floordiv 32)>>
        %19 = affine.load %arg3[%arg5 * 2 + 1] {partition_indices = [1], timing = #hls.t<10 -> 12, 2, 1>} : memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %20 = arith.mulf %18, %19 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %21 = affine.load %arg1[%arg6 * 2] {partition_indices = [0], timing = #hls.t<6 -> 8, 2, 1>} : memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %22 = arith.addf %20, %21 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %22, %arg1[%arg6 * 2] {partition_indices = [0], timing = #hls.t<0 -> 1, 1, 1>} : memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %23 = affine.load %arg0[%arg5 * 2 + 1, %arg6 * 2] {max_mux_size = 32 : i64, partition_indices = [-1, -1], timing = #hls.t<11 -> 13, 2, 1>} : memref<400x400xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 32, d0 floordiv 16, d1 floordiv 32)>>
        %24 = affine.load %arg4[%arg5 * 2 + 1] {partition_indices = [1], timing = #hls.t<10 -> 12, 2, 1>} : memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %25 = arith.mulf %23, %24 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %26 = affine.load %arg2[%arg6 * 2] {partition_indices = [0], timing = #hls.t<6 -> 8, 2, 1>} : memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %27 = arith.addf %25, %26 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %27, %arg2[%arg6 * 2] {partition_indices = [0], timing = #hls.t<0 -> 1, 1, 1>} : memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %28 = affine.load %arg0[%arg6 * 2 + 1, %arg5 * 2 + 1] {max_mux_size = 32 : i64, partition_indices = [-1, -1], timing = #hls.t<12 -> 14, 2, 1>} : memref<400x400xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 32, d0 floordiv 16, d1 floordiv 32)>>
        %29 = arith.mulf %28, %19 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %30 = affine.load %arg1[%arg6 * 2 + 1] {partition_indices = [1], timing = #hls.t<6 -> 8, 2, 1>} : memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %31 = arith.addf %29, %30 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %31, %arg1[%arg6 * 2 + 1] {partition_indices = [1], timing = #hls.t<0 -> 1, 1, 1>} : memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %32 = affine.load %arg0[%arg5 * 2 + 1, %arg6 * 2 + 1] {max_mux_size = 32 : i64, partition_indices = [-1, -1], timing = #hls.t<10 -> 12, 2, 1>} : memref<400x400xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 32, d0 floordiv 16, d1 floordiv 32)>>
        %33 = arith.mulf %32, %24 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %34 = affine.load %arg2[%arg6 * 2 + 1] {partition_indices = [1], timing = #hls.t<6 -> 8, 2, 1>} : memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %35 = arith.addf %33, %34 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %35, %arg2[%arg6 * 2 + 1] {partition_indices = [1], timing = #hls.t<0 -> 1, 1, 1>} : memref<400xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=200, iterLatency=24, minII=8>, parallel, timing = #hls.t<0 -> 1618, 1618, 1618>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=40000, iterLatency=24, minII=8>, resource = #hls.r<lut=0, dsp=5, bram=0>, timing = #hls.t<0 -> 320018, 320018, 320018>}
    return
  }
}