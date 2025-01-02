module {
  func @test_gemm(%arg0: f32, %arg1: f32, %arg2: memref<200x240xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>, %arg3: memref<240x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>, %arg4: memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>) attributes {resource = #hls.r<lut=0, dsp=26, bram=0>, timing = #hls.t<0 -> 2651034, 2651034, 2651034>, top_func} {
    affine.for %arg5 = 0 to 100 {
      affine.for %arg6 = 0 to 110 {
        %0 = affine.load %arg4[%arg5 * 2, %arg6 * 2] {partition_indices = [0, 0]} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1 = arith.mulf %0, %arg1 : f32
        affine.store %1, %arg4[%arg5 * 2, %arg6 * 2] {partition_indices = [0, 0]} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %2 = affine.load %arg4[%arg5 * 2, %arg6 * 2 + 1] {partition_indices = [0, 1]} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %3 = arith.mulf %2, %arg1 : f32
        affine.store %3, %arg4[%arg5 * 2, %arg6 * 2 + 1] {partition_indices = [0, 1]} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %4 = affine.load %arg4[%arg5 * 2 + 1, %arg6 * 2] {partition_indices = [1, 0]} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %5 = arith.mulf %4, %arg1 : f32
        affine.store %5, %arg4[%arg5 * 2 + 1, %arg6 * 2] {partition_indices = [1, 0]} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %6 = affine.load %arg4[%arg5 * 2 + 1, %arg6 * 2 + 1] {partition_indices = [1, 1]} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %7 = arith.mulf %6, %arg1 : f32
        affine.store %7, %arg4[%arg5 * 2 + 1, %arg6 * 2 + 1] {partition_indices = [1, 1]} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    affine.for %arg5 = 0 to 120 {
      affine.for %arg6 = 0 to 100 {
        affine.for %arg7 = 0 to 110 {
          %0 = affine.load %arg2[%arg6 * 2, %arg5 * 2] {partition_indices = [0, 0], timing = #hls.t<22 -> 24, 2, 1>} : memref<200x240xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %1 = arith.mulf %arg0, %0 {timing = #hls.t<18 -> 22, 4, 1>} : f32
          %2 = affine.load %arg3[%arg5 * 2, %arg7 * 2] {partition_indices = [0, 0], timing = #hls.t<18 -> 20, 2, 1>} : memref<240x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %3 = arith.mulf %2, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %4 = affine.load %arg4[%arg6 * 2, %arg7 * 2] {partition_indices = [0, 0], timing = #hls.t<14 -> 16, 2, 1>} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %5 = arith.addf %3, %4 {timing = #hls.t<9 -> 14, 5, 1>} : f32
          affine.store %5, %arg4[%arg6 * 2, %arg7 * 2] {partition_indices = [0, 0], timing = #hls.t<8 -> 9, 1, 1>} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %6 = affine.load %arg3[%arg5 * 2, %arg7 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<18 -> 20, 2, 1>} : memref<240x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %7 = arith.mulf %6, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %8 = affine.load %arg4[%arg6 * 2, %arg7 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<14 -> 16, 2, 1>} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %9 = arith.addf %7, %8 {timing = #hls.t<9 -> 14, 5, 1>} : f32
          affine.store %9, %arg4[%arg6 * 2, %arg7 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<8 -> 9, 1, 1>} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %10 = affine.load %arg2[%arg6 * 2 + 1, %arg5 * 2] {partition_indices = [1, 0], timing = #hls.t<22 -> 24, 2, 1>} : memref<200x240xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %11 = arith.mulf %arg0, %10 {timing = #hls.t<18 -> 22, 4, 1>} : f32
          %12 = arith.mulf %2, %11 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %13 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 2] {partition_indices = [1, 0], timing = #hls.t<14 -> 16, 2, 1>} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %14 = arith.addf %12, %13 {timing = #hls.t<9 -> 14, 5, 1>} : f32
          affine.store %14, %arg4[%arg6 * 2 + 1, %arg7 * 2] {partition_indices = [1, 0], timing = #hls.t<8 -> 9, 1, 1>} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %15 = arith.mulf %6, %11 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %16 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<14 -> 16, 2, 1>} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %17 = arith.addf %15, %16 {timing = #hls.t<9 -> 14, 5, 1>} : f32
          affine.store %17, %arg4[%arg6 * 2 + 1, %arg7 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<8 -> 9, 1, 1>} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %18 = affine.load %arg2[%arg6 * 2, %arg5 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<14 -> 16, 2, 1>} : memref<200x240xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %19 = arith.mulf %arg0, %18 {timing = #hls.t<10 -> 14, 4, 1>} : f32
          %20 = affine.load %arg3[%arg5 * 2 + 1, %arg7 * 2] {partition_indices = [1, 0], timing = #hls.t<10 -> 12, 2, 1>} : memref<240x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %21 = arith.mulf %20, %19 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %22 = affine.load %arg4[%arg6 * 2, %arg7 * 2] {partition_indices = [0, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %23 = arith.addf %21, %22 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %23, %arg4[%arg6 * 2, %arg7 * 2] {partition_indices = [0, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %24 = affine.load %arg3[%arg5 * 2 + 1, %arg7 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<10 -> 12, 2, 1>} : memref<240x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %25 = arith.mulf %24, %19 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %26 = affine.load %arg4[%arg6 * 2, %arg7 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %27 = arith.addf %25, %26 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %27, %arg4[%arg6 * 2, %arg7 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %28 = affine.load %arg2[%arg6 * 2 + 1, %arg5 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<14 -> 16, 2, 1>} : memref<200x240xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %29 = arith.mulf %arg0, %28 {timing = #hls.t<10 -> 14, 4, 1>} : f32
          %30 = arith.mulf %20, %29 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %31 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 2] {partition_indices = [1, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %32 = arith.addf %30, %31 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %32, %arg4[%arg6 * 2 + 1, %arg7 * 2] {partition_indices = [1, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %33 = arith.mulf %24, %29 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %34 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %35 = arith.addf %33, %34 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %35, %arg4[%arg6 * 2 + 1, %arg7 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<200x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=110, iterLatency=24, minII=2>, parallel, timing = #hls.t<0 -> 244, 244, 244>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=11000, iterLatency=24, minII=2>, parallel, timing = #hls.t<0 -> 22024, 22024, 22024>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=1320000, iterLatency=24, minII=2>, resource = #hls.r<lut=0, dsp=26, bram=0>, timing = #hls.t<0 -> 2640024, 2640024, 2640024>}
    return
  }
}