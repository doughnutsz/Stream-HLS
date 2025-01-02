func.func @test_gesummv(%arg0: f32, %arg1: f32, %arg2: memref<250x250xf32, #hls.partition<[cyclic, none], [10, 1]>>, %arg3: memref<250x250xf32, #hls.partition<[cyclic, none], [10, 1]>>, %arg4: memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>, %arg5: memref<250xf32>, %arg6: memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>) attributes {llvm.linkage = #llvm.linkage<external>, resource = #hls.res<lut = 0, dsp = 180, bram = 0>, timing = #hls.time<0 -> 6274, latency = 6274, interval = 6274>, top_func} {
  affine.for %arg7 = 0 to 250 {
    affine.for %arg8 = 0 to 25 {
      %0 = affine.load %arg2[%arg8 * 10, %arg7] {partition_indices = [0, 0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<250x250xf32, #hls.partition<[cyclic, none], [10, 1]>>
      %1 = affine.load %arg5[%arg7] {partition_indices = [0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<250xf32>
      %2 = arith.mulf %0, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %3 = affine.load %arg4[%arg8 * 10] {partition_indices = [0], timing = #hls.time<4 -> 6, latency = 2, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %4 = arith.addf %3, %2 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      affine.store %4, %arg4[%arg8 * 10] {partition_indices = [0], timing = #hls.time<20 -> 21, latency = 1, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %5 = affine.load %arg3[%arg8 * 10, %arg7] {partition_indices = [0, 0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<250x250xf32, #hls.partition<[cyclic, none], [10, 1]>>
      %6 = arith.mulf %5, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %7 = affine.load %arg6[%arg8 * 10] {partition_indices = [0], timing = #hls.time<4 -> 6, latency = 2, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %8 = arith.addf %7, %6 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %9 = arith.mulf %arg0, %4 {timing = #hls.time<11 -> 15, latency = 4, interval = 1>} : f32
      %10 = arith.mulf %arg1, %8 {timing = #hls.time<11 -> 15, latency = 4, interval = 1>} : f32
      %11 = arith.addf %9, %10 {timing = #hls.time<15 -> 20, latency = 5, interval = 1>} : f32
      %12 = hls.affine.select affine_set<(d0) : (-d0 + 249 == 0)>(%arg7) %11, %8 {timing = #hls.time<20 -> 20, latency = 0, interval = 0>} : f32
      affine.store %12, %arg6[%arg8 * 10] {partition_indices = [0], timing = #hls.time<20 -> 21, latency = 1, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %13 = affine.load %arg2[%arg8 * 10 + 1, %arg7] {partition_indices = [1, 0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<250x250xf32, #hls.partition<[cyclic, none], [10, 1]>>
      %14 = arith.mulf %13, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %15 = affine.load %arg4[%arg8 * 10 + 1] {partition_indices = [1], timing = #hls.time<4 -> 6, latency = 2, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %16 = arith.addf %15, %14 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      affine.store %16, %arg4[%arg8 * 10 + 1] {partition_indices = [1], timing = #hls.time<20 -> 21, latency = 1, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %17 = affine.load %arg3[%arg8 * 10 + 1, %arg7] {partition_indices = [1, 0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<250x250xf32, #hls.partition<[cyclic, none], [10, 1]>>
      %18 = arith.mulf %17, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %19 = affine.load %arg6[%arg8 * 10 + 1] {partition_indices = [1], timing = #hls.time<4 -> 6, latency = 2, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %20 = arith.addf %19, %18 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %21 = arith.mulf %arg0, %16 {timing = #hls.time<11 -> 15, latency = 4, interval = 1>} : f32
      %22 = arith.mulf %arg1, %20 {timing = #hls.time<11 -> 15, latency = 4, interval = 1>} : f32
      %23 = arith.addf %21, %22 {timing = #hls.time<15 -> 20, latency = 5, interval = 1>} : f32
      %24 = hls.affine.select affine_set<(d0) : (-d0 + 249 == 0)>(%arg7) %23, %20 {timing = #hls.time<20 -> 20, latency = 0, interval = 0>} : f32
      affine.store %24, %arg6[%arg8 * 10 + 1] {partition_indices = [1], timing = #hls.time<20 -> 21, latency = 1, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %25 = affine.load %arg2[%arg8 * 10 + 2, %arg7] {partition_indices = [2, 0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<250x250xf32, #hls.partition<[cyclic, none], [10, 1]>>
      %26 = arith.mulf %25, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %27 = affine.load %arg4[%arg8 * 10 + 2] {partition_indices = [2], timing = #hls.time<4 -> 6, latency = 2, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %28 = arith.addf %27, %26 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      affine.store %28, %arg4[%arg8 * 10 + 2] {partition_indices = [2], timing = #hls.time<20 -> 21, latency = 1, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %29 = affine.load %arg3[%arg8 * 10 + 2, %arg7] {partition_indices = [2, 0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<250x250xf32, #hls.partition<[cyclic, none], [10, 1]>>
      %30 = arith.mulf %29, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %31 = affine.load %arg6[%arg8 * 10 + 2] {partition_indices = [2], timing = #hls.time<4 -> 6, latency = 2, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %32 = arith.addf %31, %30 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %33 = arith.mulf %arg0, %28 {timing = #hls.time<11 -> 15, latency = 4, interval = 1>} : f32
      %34 = arith.mulf %arg1, %32 {timing = #hls.time<11 -> 15, latency = 4, interval = 1>} : f32
      %35 = arith.addf %33, %34 {timing = #hls.time<15 -> 20, latency = 5, interval = 1>} : f32
      %36 = hls.affine.select affine_set<(d0) : (-d0 + 249 == 0)>(%arg7) %35, %32 {timing = #hls.time<20 -> 20, latency = 0, interval = 0>} : f32
      affine.store %36, %arg6[%arg8 * 10 + 2] {partition_indices = [2], timing = #hls.time<20 -> 21, latency = 1, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %37 = affine.load %arg2[%arg8 * 10 + 3, %arg7] {partition_indices = [3, 0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<250x250xf32, #hls.partition<[cyclic, none], [10, 1]>>
      %38 = arith.mulf %37, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %39 = affine.load %arg4[%arg8 * 10 + 3] {partition_indices = [3], timing = #hls.time<4 -> 6, latency = 2, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %40 = arith.addf %39, %38 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      affine.store %40, %arg4[%arg8 * 10 + 3] {partition_indices = [3], timing = #hls.time<20 -> 21, latency = 1, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %41 = affine.load %arg3[%arg8 * 10 + 3, %arg7] {partition_indices = [3, 0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<250x250xf32, #hls.partition<[cyclic, none], [10, 1]>>
      %42 = arith.mulf %41, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %43 = affine.load %arg6[%arg8 * 10 + 3] {partition_indices = [3], timing = #hls.time<4 -> 6, latency = 2, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %44 = arith.addf %43, %42 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %45 = arith.mulf %arg0, %40 {timing = #hls.time<11 -> 15, latency = 4, interval = 1>} : f32
      %46 = arith.mulf %arg1, %44 {timing = #hls.time<11 -> 15, latency = 4, interval = 1>} : f32
      %47 = arith.addf %45, %46 {timing = #hls.time<15 -> 20, latency = 5, interval = 1>} : f32
      %48 = hls.affine.select affine_set<(d0) : (-d0 + 249 == 0)>(%arg7) %47, %44 {timing = #hls.time<20 -> 20, latency = 0, interval = 0>} : f32
      affine.store %48, %arg6[%arg8 * 10 + 3] {partition_indices = [3], timing = #hls.time<20 -> 21, latency = 1, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %49 = affine.load %arg2[%arg8 * 10 + 4, %arg7] {partition_indices = [4, 0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<250x250xf32, #hls.partition<[cyclic, none], [10, 1]>>
      %50 = arith.mulf %49, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %51 = affine.load %arg4[%arg8 * 10 + 4] {partition_indices = [4], timing = #hls.time<4 -> 6, latency = 2, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %52 = arith.addf %51, %50 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      affine.store %52, %arg4[%arg8 * 10 + 4] {partition_indices = [4], timing = #hls.time<20 -> 21, latency = 1, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %53 = affine.load %arg3[%arg8 * 10 + 4, %arg7] {partition_indices = [4, 0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<250x250xf32, #hls.partition<[cyclic, none], [10, 1]>>
      %54 = arith.mulf %53, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %55 = affine.load %arg6[%arg8 * 10 + 4] {partition_indices = [4], timing = #hls.time<4 -> 6, latency = 2, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %56 = arith.addf %55, %54 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %57 = arith.mulf %arg0, %52 {timing = #hls.time<11 -> 15, latency = 4, interval = 1>} : f32
      %58 = arith.mulf %arg1, %56 {timing = #hls.time<11 -> 15, latency = 4, interval = 1>} : f32
      %59 = arith.addf %57, %58 {timing = #hls.time<15 -> 20, latency = 5, interval = 1>} : f32
      %60 = hls.affine.select affine_set<(d0) : (-d0 + 249 == 0)>(%arg7) %59, %56 {timing = #hls.time<20 -> 20, latency = 0, interval = 0>} : f32
      affine.store %60, %arg6[%arg8 * 10 + 4] {partition_indices = [4], timing = #hls.time<20 -> 21, latency = 1, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %61 = affine.load %arg2[%arg8 * 10 + 5, %arg7] {partition_indices = [5, 0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<250x250xf32, #hls.partition<[cyclic, none], [10, 1]>>
      %62 = arith.mulf %61, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %63 = affine.load %arg4[%arg8 * 10 + 5] {partition_indices = [5], timing = #hls.time<4 -> 6, latency = 2, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %64 = arith.addf %63, %62 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      affine.store %64, %arg4[%arg8 * 10 + 5] {partition_indices = [5], timing = #hls.time<20 -> 21, latency = 1, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %65 = affine.load %arg3[%arg8 * 10 + 5, %arg7] {partition_indices = [5, 0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<250x250xf32, #hls.partition<[cyclic, none], [10, 1]>>
      %66 = arith.mulf %65, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %67 = affine.load %arg6[%arg8 * 10 + 5] {partition_indices = [5], timing = #hls.time<4 -> 6, latency = 2, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %68 = arith.addf %67, %66 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %69 = arith.mulf %arg0, %64 {timing = #hls.time<11 -> 15, latency = 4, interval = 1>} : f32
      %70 = arith.mulf %arg1, %68 {timing = #hls.time<11 -> 15, latency = 4, interval = 1>} : f32
      %71 = arith.addf %69, %70 {timing = #hls.time<15 -> 20, latency = 5, interval = 1>} : f32
      %72 = hls.affine.select affine_set<(d0) : (-d0 + 249 == 0)>(%arg7) %71, %68 {timing = #hls.time<20 -> 20, latency = 0, interval = 0>} : f32
      affine.store %72, %arg6[%arg8 * 10 + 5] {partition_indices = [5], timing = #hls.time<20 -> 21, latency = 1, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %73 = affine.load %arg2[%arg8 * 10 + 6, %arg7] {partition_indices = [6, 0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<250x250xf32, #hls.partition<[cyclic, none], [10, 1]>>
      %74 = arith.mulf %73, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %75 = affine.load %arg4[%arg8 * 10 + 6] {partition_indices = [6], timing = #hls.time<4 -> 6, latency = 2, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %76 = arith.addf %75, %74 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      affine.store %76, %arg4[%arg8 * 10 + 6] {partition_indices = [6], timing = #hls.time<20 -> 21, latency = 1, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %77 = affine.load %arg3[%arg8 * 10 + 6, %arg7] {partition_indices = [6, 0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<250x250xf32, #hls.partition<[cyclic, none], [10, 1]>>
      %78 = arith.mulf %77, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %79 = affine.load %arg6[%arg8 * 10 + 6] {partition_indices = [6], timing = #hls.time<4 -> 6, latency = 2, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %80 = arith.addf %79, %78 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %81 = arith.mulf %arg0, %76 {timing = #hls.time<11 -> 15, latency = 4, interval = 1>} : f32
      %82 = arith.mulf %arg1, %80 {timing = #hls.time<11 -> 15, latency = 4, interval = 1>} : f32
      %83 = arith.addf %81, %82 {timing = #hls.time<15 -> 20, latency = 5, interval = 1>} : f32
      %84 = hls.affine.select affine_set<(d0) : (-d0 + 249 == 0)>(%arg7) %83, %80 {timing = #hls.time<20 -> 20, latency = 0, interval = 0>} : f32
      affine.store %84, %arg6[%arg8 * 10 + 6] {partition_indices = [6], timing = #hls.time<20 -> 21, latency = 1, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %85 = affine.load %arg2[%arg8 * 10 + 7, %arg7] {partition_indices = [7, 0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<250x250xf32, #hls.partition<[cyclic, none], [10, 1]>>
      %86 = arith.mulf %85, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %87 = affine.load %arg4[%arg8 * 10 + 7] {partition_indices = [7], timing = #hls.time<4 -> 6, latency = 2, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %88 = arith.addf %87, %86 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      affine.store %88, %arg4[%arg8 * 10 + 7] {partition_indices = [7], timing = #hls.time<20 -> 21, latency = 1, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %89 = affine.load %arg3[%arg8 * 10 + 7, %arg7] {partition_indices = [7, 0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<250x250xf32, #hls.partition<[cyclic, none], [10, 1]>>
      %90 = arith.mulf %89, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %91 = affine.load %arg6[%arg8 * 10 + 7] {partition_indices = [7], timing = #hls.time<4 -> 6, latency = 2, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %92 = arith.addf %91, %90 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %93 = arith.mulf %arg0, %88 {timing = #hls.time<11 -> 15, latency = 4, interval = 1>} : f32
      %94 = arith.mulf %arg1, %92 {timing = #hls.time<11 -> 15, latency = 4, interval = 1>} : f32
      %95 = arith.addf %93, %94 {timing = #hls.time<15 -> 20, latency = 5, interval = 1>} : f32
      %96 = hls.affine.select affine_set<(d0) : (-d0 + 249 == 0)>(%arg7) %95, %92 {timing = #hls.time<20 -> 20, latency = 0, interval = 0>} : f32
      affine.store %96, %arg6[%arg8 * 10 + 7] {partition_indices = [7], timing = #hls.time<20 -> 21, latency = 1, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %97 = affine.load %arg2[%arg8 * 10 + 8, %arg7] {partition_indices = [8, 0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<250x250xf32, #hls.partition<[cyclic, none], [10, 1]>>
      %98 = arith.mulf %97, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %99 = affine.load %arg4[%arg8 * 10 + 8] {partition_indices = [8], timing = #hls.time<4 -> 6, latency = 2, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %100 = arith.addf %99, %98 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      affine.store %100, %arg4[%arg8 * 10 + 8] {partition_indices = [8], timing = #hls.time<20 -> 21, latency = 1, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %101 = affine.load %arg3[%arg8 * 10 + 8, %arg7] {partition_indices = [8, 0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<250x250xf32, #hls.partition<[cyclic, none], [10, 1]>>
      %102 = arith.mulf %101, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %103 = affine.load %arg6[%arg8 * 10 + 8] {partition_indices = [8], timing = #hls.time<4 -> 6, latency = 2, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %104 = arith.addf %103, %102 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %105 = arith.mulf %arg0, %100 {timing = #hls.time<11 -> 15, latency = 4, interval = 1>} : f32
      %106 = arith.mulf %arg1, %104 {timing = #hls.time<11 -> 15, latency = 4, interval = 1>} : f32
      %107 = arith.addf %105, %106 {timing = #hls.time<15 -> 20, latency = 5, interval = 1>} : f32
      %108 = hls.affine.select affine_set<(d0) : (-d0 + 249 == 0)>(%arg7) %107, %104 {timing = #hls.time<20 -> 20, latency = 0, interval = 0>} : f32
      affine.store %108, %arg6[%arg8 * 10 + 8] {partition_indices = [8], timing = #hls.time<20 -> 21, latency = 1, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %109 = affine.load %arg2[%arg8 * 10 + 9, %arg7] {partition_indices = [9, 0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<250x250xf32, #hls.partition<[cyclic, none], [10, 1]>>
      %110 = arith.mulf %109, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %111 = affine.load %arg4[%arg8 * 10 + 9] {partition_indices = [9], timing = #hls.time<4 -> 6, latency = 2, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %112 = arith.addf %111, %110 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      affine.store %112, %arg4[%arg8 * 10 + 9] {partition_indices = [9], timing = #hls.time<20 -> 21, latency = 1, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %113 = affine.load %arg3[%arg8 * 10 + 9, %arg7] {partition_indices = [9, 0], timing = #hls.time<0 -> 2, latency = 2, interval = 1>} : memref<250x250xf32, #hls.partition<[cyclic, none], [10, 1]>>
      %114 = arith.mulf %113, %1 {timing = #hls.time<2 -> 6, latency = 4, interval = 1>} : f32
      %115 = affine.load %arg6[%arg8 * 10 + 9] {partition_indices = [9], timing = #hls.time<4 -> 6, latency = 2, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
      %116 = arith.addf %115, %114 {timing = #hls.time<6 -> 11, latency = 5, interval = 1>} : f32
      %117 = arith.mulf %arg0, %112 {timing = #hls.time<11 -> 15, latency = 4, interval = 1>} : f32
      %118 = arith.mulf %arg1, %116 {timing = #hls.time<11 -> 15, latency = 4, interval = 1>} : f32
      %119 = arith.addf %117, %118 {timing = #hls.time<15 -> 20, latency = 5, interval = 1>} : f32
      %120 = hls.affine.select affine_set<(d0) : (-d0 + 249 == 0)>(%arg7) %119, %116 {timing = #hls.time<20 -> 20, latency = 0, interval = 0>} : f32
      affine.store %120, %arg6[%arg8 * 10 + 9] {partition_indices = [9], timing = #hls.time<20 -> 21, latency = 1, interval = 1>} : memref<250xf32, #hls.partition<[cyclic], [10]>, #hls.mem<lutram_2p>>
    } {loop_directive = #hls.loop<pipeline = true, target_ii = 1, dataflow = false, flatten = false>, loop_info = #hls.info<flatten_trip_count = 25, iter_latency = 21, min_ii = 1>, parallel, timing = #hls.time<0 -> 47, latency = 47, interval = 47>}
  } {loop_directive = #hls.loop<pipeline = false, target_ii = 1, dataflow = false, flatten = true>, loop_info = #hls.info<flatten_trip_count = 6250, iter_latency = 21, min_ii = 1>, timing = #hls.time<0 -> 6272, latency = 6272, interval = 6272>}
  return {timing = #hls.time<6272 -> 6272, latency = 0, interval = 0>}
}
