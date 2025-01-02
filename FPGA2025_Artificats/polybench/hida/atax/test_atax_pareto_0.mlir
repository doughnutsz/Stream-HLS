func.func @test_atax(%arg0: memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>, %arg1: memref<410xf32, #hls.partition<[cyclic], [2]>>, %arg2: memref<410xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>, %arg3: memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>) attributes {llvm.linkage = #llvm.linkage<external>, resource = #hls.res<lut = 0, dsp = 150, bram = 0>, timing = #hls.time<0 -> 13363, latency = 13363, interval = 13363>, top_func} {
  affine.for %arg4 = 0 to 205 {
    affine.for %arg5 = 0 to 26 {
      %0 = affine.load %arg0[%arg5 * 15, %arg4 * 2] {max_mux_size = 10 : i64, partition_indices = [0, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %1 = affine.load %arg1[%arg4 * 2] {partition_indices = [0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<410xf32, #hls.partition<[cyclic], [2]>>
      %2 = arith.mulf %0, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %3 = affine.load %arg0[%arg5 * 15 + 1, %arg4 * 2] {max_mux_size = 10 : i64, partition_indices = [1, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %4 = arith.mulf %3, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %5 = affine.load %arg0[%arg5 * 15 + 2, %arg4 * 2] {max_mux_size = 10 : i64, partition_indices = [2, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %6 = arith.mulf %5, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %7 = affine.load %arg0[%arg5 * 15 + 3, %arg4 * 2] {max_mux_size = 10 : i64, partition_indices = [3, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %8 = arith.mulf %7, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %9 = affine.load %arg0[%arg5 * 15 + 4, %arg4 * 2] {max_mux_size = 10 : i64, partition_indices = [4, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %10 = arith.mulf %9, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %11 = affine.load %arg0[%arg5 * 15 + 5, %arg4 * 2] {max_mux_size = 10 : i64, partition_indices = [5, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %12 = arith.mulf %11, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %13 = affine.load %arg0[%arg5 * 15 + 6, %arg4 * 2] {max_mux_size = 10 : i64, partition_indices = [6, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %14 = arith.mulf %13, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %15 = affine.load %arg0[%arg5 * 15 + 7, %arg4 * 2] {max_mux_size = 10 : i64, partition_indices = [7, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %16 = arith.mulf %15, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %17 = affine.load %arg0[%arg5 * 15 + 8, %arg4 * 2] {max_mux_size = 10 : i64, partition_indices = [8, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %18 = arith.mulf %17, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %19 = affine.load %arg0[%arg5 * 15 + 9, %arg4 * 2] {max_mux_size = 10 : i64, partition_indices = [9, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %20 = arith.mulf %19, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %21 = affine.load %arg0[%arg5 * 15 + 10, %arg4 * 2] {max_mux_size = 10 : i64, partition_indices = [10, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %22 = arith.mulf %21, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %23 = affine.load %arg0[%arg5 * 15 + 11, %arg4 * 2] {max_mux_size = 10 : i64, partition_indices = [11, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %24 = arith.mulf %23, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %25 = affine.load %arg0[%arg5 * 15 + 12, %arg4 * 2] {max_mux_size = 10 : i64, partition_indices = [12, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %26 = arith.mulf %25, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %27 = affine.load %arg0[%arg5 * 15 + 13, %arg4 * 2] {max_mux_size = 10 : i64, partition_indices = [13, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %28 = arith.mulf %27, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %29 = affine.load %arg0[%arg5 * 15 + 14, %arg4 * 2] {max_mux_size = 10 : i64, partition_indices = [14, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %30 = arith.mulf %29, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %31 = affine.load %arg0[%arg5 * 15, %arg4 * 2 + 1] {max_mux_size = 10 : i64, partition_indices = [0, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %32 = affine.load %arg1[%arg4 * 2 + 1] {partition_indices = [1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<410xf32, #hls.partition<[cyclic], [2]>>
      %33 = arith.mulf %31, %32 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %34 = arith.addf %2, %33 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %35 = affine.load %arg3[%arg5 * 15] {partition_indices = [0], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %36 = arith.addf %35, %34 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %36, %arg3[%arg5 * 15] {partition_indices = [0], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %37 = affine.load %arg0[%arg5 * 15 + 1, %arg4 * 2 + 1] {max_mux_size = 10 : i64, partition_indices = [1, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %38 = arith.mulf %37, %32 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %39 = arith.addf %4, %38 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %40 = affine.load %arg3[%arg5 * 15 + 1] {partition_indices = [1], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %41 = arith.addf %40, %39 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %41, %arg3[%arg5 * 15 + 1] {partition_indices = [1], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %42 = affine.load %arg0[%arg5 * 15 + 2, %arg4 * 2 + 1] {max_mux_size = 10 : i64, partition_indices = [2, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %43 = arith.mulf %42, %32 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %44 = arith.addf %6, %43 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %45 = affine.load %arg3[%arg5 * 15 + 2] {partition_indices = [2], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %46 = arith.addf %45, %44 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %46, %arg3[%arg5 * 15 + 2] {partition_indices = [2], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %47 = affine.load %arg0[%arg5 * 15 + 3, %arg4 * 2 + 1] {max_mux_size = 10 : i64, partition_indices = [3, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %48 = arith.mulf %47, %32 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %49 = arith.addf %8, %48 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %50 = affine.load %arg3[%arg5 * 15 + 3] {partition_indices = [3], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %51 = arith.addf %50, %49 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %51, %arg3[%arg5 * 15 + 3] {partition_indices = [3], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %52 = affine.load %arg0[%arg5 * 15 + 4, %arg4 * 2 + 1] {max_mux_size = 10 : i64, partition_indices = [4, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %53 = arith.mulf %52, %32 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %54 = arith.addf %10, %53 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %55 = affine.load %arg3[%arg5 * 15 + 4] {partition_indices = [4], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %56 = arith.addf %55, %54 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %56, %arg3[%arg5 * 15 + 4] {partition_indices = [4], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %57 = affine.load %arg0[%arg5 * 15 + 5, %arg4 * 2 + 1] {max_mux_size = 10 : i64, partition_indices = [5, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %58 = arith.mulf %57, %32 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %59 = arith.addf %12, %58 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %60 = affine.load %arg3[%arg5 * 15 + 5] {partition_indices = [5], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %61 = arith.addf %60, %59 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %61, %arg3[%arg5 * 15 + 5] {partition_indices = [5], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %62 = affine.load %arg0[%arg5 * 15 + 6, %arg4 * 2 + 1] {max_mux_size = 10 : i64, partition_indices = [6, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %63 = arith.mulf %62, %32 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %64 = arith.addf %14, %63 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %65 = affine.load %arg3[%arg5 * 15 + 6] {partition_indices = [6], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %66 = arith.addf %65, %64 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %66, %arg3[%arg5 * 15 + 6] {partition_indices = [6], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %67 = affine.load %arg0[%arg5 * 15 + 7, %arg4 * 2 + 1] {max_mux_size = 10 : i64, partition_indices = [7, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %68 = arith.mulf %67, %32 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %69 = arith.addf %16, %68 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %70 = affine.load %arg3[%arg5 * 15 + 7] {partition_indices = [7], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %71 = arith.addf %70, %69 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %71, %arg3[%arg5 * 15 + 7] {partition_indices = [7], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %72 = affine.load %arg0[%arg5 * 15 + 8, %arg4 * 2 + 1] {max_mux_size = 10 : i64, partition_indices = [8, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %73 = arith.mulf %72, %32 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %74 = arith.addf %18, %73 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %75 = affine.load %arg3[%arg5 * 15 + 8] {partition_indices = [8], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %76 = arith.addf %75, %74 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %76, %arg3[%arg5 * 15 + 8] {partition_indices = [8], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %77 = affine.load %arg0[%arg5 * 15 + 9, %arg4 * 2 + 1] {max_mux_size = 10 : i64, partition_indices = [9, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %78 = arith.mulf %77, %32 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %79 = arith.addf %20, %78 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %80 = affine.load %arg3[%arg5 * 15 + 9] {partition_indices = [9], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %81 = arith.addf %80, %79 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %81, %arg3[%arg5 * 15 + 9] {partition_indices = [9], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %82 = affine.load %arg0[%arg5 * 15 + 10, %arg4 * 2 + 1] {max_mux_size = 10 : i64, partition_indices = [10, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %83 = arith.mulf %82, %32 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %84 = arith.addf %22, %83 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %85 = affine.load %arg3[%arg5 * 15 + 10] {partition_indices = [10], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %86 = arith.addf %85, %84 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %86, %arg3[%arg5 * 15 + 10] {partition_indices = [10], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %87 = affine.load %arg0[%arg5 * 15 + 11, %arg4 * 2 + 1] {max_mux_size = 10 : i64, partition_indices = [11, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %88 = arith.mulf %87, %32 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %89 = arith.addf %24, %88 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %90 = affine.load %arg3[%arg5 * 15 + 11] {partition_indices = [11], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %91 = arith.addf %90, %89 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %91, %arg3[%arg5 * 15 + 11] {partition_indices = [11], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %92 = affine.load %arg0[%arg5 * 15 + 12, %arg4 * 2 + 1] {max_mux_size = 10 : i64, partition_indices = [12, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %93 = arith.mulf %92, %32 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %94 = arith.addf %26, %93 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %95 = affine.load %arg3[%arg5 * 15 + 12] {partition_indices = [12], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %96 = arith.addf %95, %94 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %96, %arg3[%arg5 * 15 + 12] {partition_indices = [12], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %97 = affine.load %arg0[%arg5 * 15 + 13, %arg4 * 2 + 1] {max_mux_size = 10 : i64, partition_indices = [13, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %98 = arith.mulf %97, %32 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %99 = arith.addf %28, %98 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %100 = affine.load %arg3[%arg5 * 15 + 13] {partition_indices = [13], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %101 = arith.addf %100, %99 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %101, %arg3[%arg5 * 15 + 13] {partition_indices = [13], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %102 = affine.load %arg0[%arg5 * 15 + 14, %arg4 * 2 + 1] {max_mux_size = 10 : i64, partition_indices = [14, -1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %103 = arith.mulf %102, %32 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %104 = arith.addf %30, %103 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %105 = affine.load %arg3[%arg5 * 15 + 14] {partition_indices = [14], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %106 = arith.addf %105, %104 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %106, %arg3[%arg5 * 15 + 14] {partition_indices = [14], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
    } {loop_directive = #hls.loop<pipeline = true, target_ii = 1, dataflow = false, flatten = false>, loop_info = #hls.info<flatten_trip_count = 26, iter_latency = 17, min_ii = 1>, parallel, timing = #hls.time<8013 -> 8057, latency = 44, interval = 44>}
  } {loop_directive = #hls.loop<pipeline = false, target_ii = 1, dataflow = false, flatten = true>, loop_info = #hls.info<flatten_trip_count = 5330, iter_latency = 17, min_ii = 1>, timing = #hls.time<0 -> 5348, latency = 5348, interval = 5348>}
  affine.for %arg4 = 0 to 195 {
    affine.for %arg5 = 0 to 41 {
      %0 = affine.load %arg0[%arg4 * 2, %arg5 * 10] {max_mux_size = 15 : i64, partition_indices = [-1, 0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %1 = affine.load %arg3[%arg4 * 2] {max_mux_size = 15 : i64, partition_indices = [-1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %2 = arith.mulf %0, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %3 = affine.load %arg0[%arg4 * 2, %arg5 * 10 + 1] {max_mux_size = 15 : i64, partition_indices = [-1, 1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %4 = arith.mulf %3, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %5 = affine.load %arg0[%arg4 * 2, %arg5 * 10 + 2] {max_mux_size = 15 : i64, partition_indices = [-1, 2], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %6 = arith.mulf %5, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %7 = affine.load %arg0[%arg4 * 2, %arg5 * 10 + 3] {max_mux_size = 15 : i64, partition_indices = [-1, 3], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %8 = arith.mulf %7, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %9 = affine.load %arg0[%arg4 * 2, %arg5 * 10 + 4] {max_mux_size = 15 : i64, partition_indices = [-1, 4], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %10 = arith.mulf %9, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %11 = affine.load %arg0[%arg4 * 2, %arg5 * 10 + 5] {max_mux_size = 15 : i64, partition_indices = [-1, 5], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %12 = arith.mulf %11, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %13 = affine.load %arg0[%arg4 * 2, %arg5 * 10 + 6] {max_mux_size = 15 : i64, partition_indices = [-1, 6], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %14 = arith.mulf %13, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %15 = affine.load %arg0[%arg4 * 2, %arg5 * 10 + 7] {max_mux_size = 15 : i64, partition_indices = [-1, 7], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %16 = arith.mulf %15, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %17 = affine.load %arg0[%arg4 * 2, %arg5 * 10 + 8] {max_mux_size = 15 : i64, partition_indices = [-1, 8], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %18 = arith.mulf %17, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %19 = affine.load %arg0[%arg4 * 2, %arg5 * 10 + 9] {max_mux_size = 15 : i64, partition_indices = [-1, 9], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %20 = arith.mulf %19, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %21 = affine.load %arg0[%arg4 * 2 + 1, %arg5 * 10] {max_mux_size = 15 : i64, partition_indices = [-1, 0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %22 = affine.load %arg3[%arg4 * 2 + 1] {max_mux_size = 15 : i64, partition_indices = [-1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390xf32, #hls.partition<[cyclic], [15]>, #hls.mem<lutram_2p>>
      %23 = arith.mulf %21, %22 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %24 = arith.addf %2, %23 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %25 = affine.load %arg2[%arg5 * 10] {partition_indices = [0], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<410xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %26 = arith.addf %25, %24 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %26, %arg2[%arg5 * 10] {partition_indices = [0], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<410xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %27 = affine.load %arg0[%arg4 * 2 + 1, %arg5 * 10 + 1] {max_mux_size = 15 : i64, partition_indices = [-1, 1], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %28 = arith.mulf %27, %22 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %29 = arith.addf %4, %28 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %30 = affine.load %arg2[%arg5 * 10 + 1] {partition_indices = [1], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<410xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %31 = arith.addf %30, %29 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %31, %arg2[%arg5 * 10 + 1] {partition_indices = [1], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<410xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %32 = affine.load %arg0[%arg4 * 2 + 1, %arg5 * 10 + 2] {max_mux_size = 15 : i64, partition_indices = [-1, 2], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %33 = arith.mulf %32, %22 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %34 = arith.addf %6, %33 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %35 = affine.load %arg2[%arg5 * 10 + 2] {partition_indices = [2], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<410xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %36 = arith.addf %35, %34 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %36, %arg2[%arg5 * 10 + 2] {partition_indices = [2], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<410xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %37 = affine.load %arg0[%arg4 * 2 + 1, %arg5 * 10 + 3] {max_mux_size = 15 : i64, partition_indices = [-1, 3], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %38 = arith.mulf %37, %22 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %39 = arith.addf %8, %38 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %40 = affine.load %arg2[%arg5 * 10 + 3] {partition_indices = [3], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<410xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %41 = arith.addf %40, %39 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %41, %arg2[%arg5 * 10 + 3] {partition_indices = [3], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<410xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %42 = affine.load %arg0[%arg4 * 2 + 1, %arg5 * 10 + 4] {max_mux_size = 15 : i64, partition_indices = [-1, 4], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %43 = arith.mulf %42, %22 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %44 = arith.addf %10, %43 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %45 = affine.load %arg2[%arg5 * 10 + 4] {partition_indices = [4], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<410xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %46 = arith.addf %45, %44 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %46, %arg2[%arg5 * 10 + 4] {partition_indices = [4], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<410xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %47 = affine.load %arg0[%arg4 * 2 + 1, %arg5 * 10 + 5] {max_mux_size = 15 : i64, partition_indices = [-1, 5], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %48 = arith.mulf %47, %22 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %49 = arith.addf %12, %48 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %50 = affine.load %arg2[%arg5 * 10 + 5] {partition_indices = [5], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<410xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %51 = arith.addf %50, %49 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %51, %arg2[%arg5 * 10 + 5] {partition_indices = [5], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<410xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %52 = affine.load %arg0[%arg4 * 2 + 1, %arg5 * 10 + 6] {max_mux_size = 15 : i64, partition_indices = [-1, 6], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %53 = arith.mulf %52, %22 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %54 = arith.addf %14, %53 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %55 = affine.load %arg2[%arg5 * 10 + 6] {partition_indices = [6], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<410xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %56 = arith.addf %55, %54 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %56, %arg2[%arg5 * 10 + 6] {partition_indices = [6], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<410xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %57 = affine.load %arg0[%arg4 * 2 + 1, %arg5 * 10 + 7] {max_mux_size = 15 : i64, partition_indices = [-1, 7], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %58 = arith.mulf %57, %22 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %59 = arith.addf %16, %58 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %60 = affine.load %arg2[%arg5 * 10 + 7] {partition_indices = [7], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<410xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %61 = arith.addf %60, %59 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %61, %arg2[%arg5 * 10 + 7] {partition_indices = [7], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<410xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %62 = affine.load %arg0[%arg4 * 2 + 1, %arg5 * 10 + 8] {max_mux_size = 15 : i64, partition_indices = [-1, 8], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %63 = arith.mulf %62, %22 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %64 = arith.addf %18, %63 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %65 = affine.load %arg2[%arg5 * 10 + 8] {partition_indices = [8], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<410xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %66 = arith.addf %65, %64 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %66, %arg2[%arg5 * 10 + 8] {partition_indices = [8], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<410xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %67 = affine.load %arg0[%arg4 * 2 + 1, %arg5 * 10 + 9] {max_mux_size = 15 : i64, partition_indices = [-1, 9], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<390x410xf32, #hls.partition<[cyclic, cyclic], [15, 10]>>
      %68 = arith.mulf %67, %22 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %69 = arith.addf %20, %68 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %70 = affine.load %arg2[%arg5 * 10 + 9] {partition_indices = [9], timing = #hls.time<9 -> 11, latency = 2, interval = 1>} : memref<410xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %71 = arith.addf %70, %69 {timing = #hls.time<11 -> 16, latency = 5, interval = 1>} : f32
      affine.store %71, %arg2[%arg5 * 10 + 9] {partition_indices = [9], timing = #hls.time<16 -> 17, latency = 1, interval = 1>} : memref<410xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
    } {loop_directive = #hls.loop<pipeline = true, target_ii = 1, dataflow = false, flatten = false>, loop_info = #hls.info<flatten_trip_count = 41, iter_latency = 17, min_ii = 1>, parallel, timing = #hls.time<0 -> 59, latency = 59, interval = 59>}
  } {loop_directive = #hls.loop<pipeline = false, target_ii = 1, dataflow = false, flatten = true>, loop_info = #hls.info<flatten_trip_count = 7995, iter_latency = 17, min_ii = 1>, timing = #hls.time<5348 -> 13361, latency = 8013, interval = 8013>}
  return {timing = #hls.time<13361 -> 13361, latency = 0, interval = 0>}
}
