module {
  func @test_2mm(%arg0: f32, %arg1: f32, %arg2: f32, %arg3: memref<180x210xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>, %arg4: memref<210x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>, %arg5: memref<190x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>, %arg6: memref<180x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>, %arg7: memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>) attributes {resource = #hls.r<lut=0, dsp=26, bram=0>, timing = #hls.t<0 -> 3922706, 3922706, 3922706>, top_func} {
    affine.for %arg8 = 0 to 90 {
      affine.for %arg9 = 0 to 95 {
        affine.store %arg2, %arg7[%arg8 * 2, %arg9 * 2] {partition_indices = [0, 0]} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        affine.store %arg2, %arg7[%arg8 * 2, %arg9 * 2 + 1] {partition_indices = [0, 1]} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        affine.store %arg2, %arg7[%arg8 * 2 + 1, %arg9 * 2] {partition_indices = [1, 0]} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        affine.store %arg2, %arg7[%arg8 * 2 + 1, %arg9 * 2 + 1] {partition_indices = [1, 1]} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    affine.for %arg8 = 0 to 105 {
      affine.for %arg9 = 0 to 90 {
        affine.for %arg10 = 0 to 95 {
          %0 = affine.load %arg3[%arg9 * 2, %arg8 * 2] {partition_indices = [0, 0]} : memref<180x210xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %1 = arith.mulf %arg0, %0 : f32
          %2 = affine.load %arg4[%arg8 * 2, %arg10 * 2] {partition_indices = [0, 0]} : memref<210x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %3 = arith.mulf %2, %1 : f32
          %4 = affine.load %arg7[%arg9 * 2, %arg10 * 2] {partition_indices = [0, 0]} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %5 = arith.addf %3, %4 : f32
          affine.store %5, %arg7[%arg9 * 2, %arg10 * 2] {partition_indices = [0, 0]} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %6 = affine.load %arg4[%arg8 * 2, %arg10 * 2 + 1] {partition_indices = [0, 1]} : memref<210x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %7 = arith.mulf %6, %1 : f32
          %8 = affine.load %arg7[%arg9 * 2, %arg10 * 2 + 1] {partition_indices = [0, 1]} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %9 = arith.addf %7, %8 : f32
          affine.store %9, %arg7[%arg9 * 2, %arg10 * 2 + 1] {partition_indices = [0, 1]} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %10 = affine.load %arg3[%arg9 * 2 + 1, %arg8 * 2] {partition_indices = [1, 0]} : memref<180x210xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %11 = arith.mulf %arg0, %10 : f32
          %12 = arith.mulf %2, %11 : f32
          %13 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 2] {partition_indices = [1, 0]} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %14 = arith.addf %12, %13 : f32
          affine.store %14, %arg7[%arg9 * 2 + 1, %arg10 * 2] {partition_indices = [1, 0]} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %15 = arith.mulf %6, %11 : f32
          %16 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 2 + 1] {partition_indices = [1, 1]} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %17 = arith.addf %15, %16 : f32
          affine.store %17, %arg7[%arg9 * 2 + 1, %arg10 * 2 + 1] {partition_indices = [1, 1]} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %18 = affine.load %arg3[%arg9 * 2, %arg8 * 2 + 1] {partition_indices = [0, 1]} : memref<180x210xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %19 = arith.mulf %arg0, %18 : f32
          %20 = affine.load %arg4[%arg8 * 2 + 1, %arg10 * 2] {partition_indices = [1, 0]} : memref<210x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %21 = arith.mulf %20, %19 : f32
          %22 = affine.load %arg7[%arg9 * 2, %arg10 * 2] {partition_indices = [0, 0]} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %23 = arith.addf %21, %22 : f32
          affine.store %23, %arg7[%arg9 * 2, %arg10 * 2] {partition_indices = [0, 0]} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %24 = affine.load %arg4[%arg8 * 2 + 1, %arg10 * 2 + 1] {partition_indices = [1, 1]} : memref<210x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %25 = arith.mulf %24, %19 : f32
          %26 = affine.load %arg7[%arg9 * 2, %arg10 * 2 + 1] {partition_indices = [0, 1]} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %27 = arith.addf %25, %26 : f32
          affine.store %27, %arg7[%arg9 * 2, %arg10 * 2 + 1] {partition_indices = [0, 1]} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %28 = affine.load %arg3[%arg9 * 2 + 1, %arg8 * 2 + 1] {partition_indices = [1, 1]} : memref<180x210xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %29 = arith.mulf %arg0, %28 : f32
          %30 = arith.mulf %20, %29 : f32
          %31 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 2] {partition_indices = [1, 0]} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %32 = arith.addf %30, %31 : f32
          affine.store %32, %arg7[%arg9 * 2 + 1, %arg10 * 2] {partition_indices = [1, 0]} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %33 = arith.mulf %24, %29 : f32
          %34 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 2 + 1] {partition_indices = [1, 1]} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %35 = arith.addf %33, %34 : f32
          affine.store %35, %arg7[%arg9 * 2 + 1, %arg10 * 2 + 1] {partition_indices = [1, 1]} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg8 = 0 to 180 {
      affine.for %arg9 = 0 to 220 {
        %0 = affine.load %arg6[%arg8, %arg9] {max_mux_size = 2 : i64, partition_indices = [-1, -1]} : memref<180x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1 = arith.mulf %0, %arg1 : f32
        affine.store %1, %arg6[%arg8, %arg9] {max_mux_size = 2 : i64, partition_indices = [-1, -1]} : memref<180x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    affine.for %arg8 = 0 to 105 {
      affine.for %arg9 = 0 to 90 {
        affine.for %arg10 = 0 to 110 {
          %0 = affine.load %arg7[%arg9 * 2, %arg8 * 2] {partition_indices = [0, 0], timing = #hls.t<18 -> 20, 2, 1>} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %1 = affine.load %arg5[%arg8 * 2, %arg10 * 2] {partition_indices = [0, 0], timing = #hls.t<18 -> 20, 2, 1>} : memref<190x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %2 = arith.mulf %0, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %3 = affine.load %arg6[%arg9 * 2, %arg10 * 2] {partition_indices = [0, 0], timing = #hls.t<14 -> 16, 2, 1>} : memref<180x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %4 = arith.addf %2, %3 {timing = #hls.t<9 -> 14, 5, 1>} : f32
          affine.store %4, %arg6[%arg9 * 2, %arg10 * 2] {partition_indices = [0, 0], timing = #hls.t<8 -> 9, 1, 1>} : memref<180x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %5 = affine.load %arg5[%arg8 * 2, %arg10 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<18 -> 20, 2, 1>} : memref<190x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %6 = arith.mulf %0, %5 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %7 = affine.load %arg6[%arg9 * 2, %arg10 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<14 -> 16, 2, 1>} : memref<180x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %8 = arith.addf %6, %7 {timing = #hls.t<9 -> 14, 5, 1>} : f32
          affine.store %8, %arg6[%arg9 * 2, %arg10 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<8 -> 9, 1, 1>} : memref<180x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %9 = affine.load %arg7[%arg9 * 2 + 1, %arg8 * 2] {partition_indices = [1, 0], timing = #hls.t<18 -> 20, 2, 1>} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %10 = arith.mulf %9, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %11 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 2] {partition_indices = [1, 0], timing = #hls.t<14 -> 16, 2, 1>} : memref<180x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %12 = arith.addf %10, %11 {timing = #hls.t<9 -> 14, 5, 1>} : f32
          affine.store %12, %arg6[%arg9 * 2 + 1, %arg10 * 2] {partition_indices = [1, 0], timing = #hls.t<8 -> 9, 1, 1>} : memref<180x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %13 = arith.mulf %9, %5 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %14 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<14 -> 16, 2, 1>} : memref<180x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %15 = arith.addf %13, %14 {timing = #hls.t<9 -> 14, 5, 1>} : f32
          affine.store %15, %arg6[%arg9 * 2 + 1, %arg10 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<8 -> 9, 1, 1>} : memref<180x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %16 = affine.load %arg7[%arg9 * 2, %arg8 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<10 -> 12, 2, 1>} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %17 = affine.load %arg5[%arg8 * 2 + 1, %arg10 * 2] {partition_indices = [1, 0], timing = #hls.t<10 -> 12, 2, 1>} : memref<190x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %18 = arith.mulf %16, %17 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %19 = affine.load %arg6[%arg9 * 2, %arg10 * 2] {partition_indices = [0, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<180x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %20 = arith.addf %18, %19 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %20, %arg6[%arg9 * 2, %arg10 * 2] {partition_indices = [0, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<180x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %21 = affine.load %arg5[%arg8 * 2 + 1, %arg10 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<10 -> 12, 2, 1>} : memref<190x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %22 = arith.mulf %16, %21 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %23 = affine.load %arg6[%arg9 * 2, %arg10 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<180x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %24 = arith.addf %22, %23 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %24, %arg6[%arg9 * 2, %arg10 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<180x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %25 = affine.load %arg7[%arg9 * 2 + 1, %arg8 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<10 -> 12, 2, 1>} : memref<180x190xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %26 = arith.mulf %25, %17 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %27 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 2] {partition_indices = [1, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<180x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %28 = arith.addf %26, %27 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %28, %arg6[%arg9 * 2 + 1, %arg10 * 2] {partition_indices = [1, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<180x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %29 = arith.mulf %25, %21 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %30 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<180x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %31 = arith.addf %29, %30 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %31, %arg6[%arg9 * 2 + 1, %arg10 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<180x220xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=110, iterLatency=20, minII=2>, parallel, timing = #hls.t<0 -> 240, 240, 240>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=9900, iterLatency=20, minII=2>, parallel, timing = #hls.t<0 -> 19820, 19820, 19820>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=1039500, iterLatency=20, minII=2>, resource = #hls.r<lut=0, dsp=20, bram=0>, timing = #hls.t<0 -> 2079020, 2079020, 2079020>}
    return
  }
}