module attributes {torch.debug_module_name = "DepthwiseSeparableConvBlock"} {
  func.func private @forward(memref<1x8x112x112xf32>, memref<8x8x1x1xf32> {builtin.dense_resource = dense_resource<weight> : memref<8x8x1x1xf32>}, memref<8x3x3xf32> {builtin.dense_resource = dense_resource<weight_1> : memref<8x3x3xf32>}, memref<1x8x112x112xf32>)
  func.func @main() -> i32 {
    %cst = arith.constant dense_resource<input_0> : memref<1x8x112x112xf32>
    %cst_0 = arith.constant dense_resource<weight> : memref<8x8x1x1xf32>
    %cst_1 = arith.constant dense_resource<weight_1> : memref<8x3x3xf32>
    %alloc = memref.alloc() : memref<1x8x112x112xf32>
    call @forward(%cst, %cst_0, %cst_1, %alloc) : (memref<1x8x112x112xf32>, memref<8x8x1x1xf32>, memref<8x3x3xf32>, memref<1x8x112x112xf32>) -> ()
    %cst_2 = arith.constant dense<true> : memref<1xi1>
    %cst_3 = arith.constant dense_resource<output_0> : memref<1x8x112x112xf32>
    affine.for %arg0 = 0 to 1 {
      affine.for %arg1 = 0 to 8 {
        affine.for %arg2 = 0 to 112 {
          affine.for %arg3 = 0 to 112 {
            %1 = affine.load %alloc[%arg0, %arg1, %arg2, %arg3] : memref<1x8x112x112xf32>
            %2 = affine.load %cst_3[%arg0, %arg1, %arg2, %arg3] : memref<1x8x112x112xf32>
            %3 = arith.subf %1, %2 : f32
            %4 = arith.subf %2, %1 : f32
            %cst_4 = arith.constant 0.00999999977 : f32
            %5 = arith.cmpf ugt, %3, %cst_4 : f32
            %6 = arith.cmpf ugt, %4, %cst_4 : f32
            %7 = arith.ori %5, %6 : i1
            scf.if %7 {
              %c0_5 = arith.constant 0 : index
              %false = arith.constant false
              affine.store %false, %cst_2[%c0_5] : memref<1xi1>
            }
          }
        }
      }
    }
    %c0 = arith.constant 0 : index
    %0 = affine.load %cst_2[%c0] : memref<1xi1>
    cf.assert %0, "Error!"
    %c0_i32 = arith.constant 0 : i32
    return %c0_i32 : i32
  }
}

{-#
  dialect_resources: {
    builtin: {
      weight: "0x01000000A43E493EE6CC673E9E4F943E497325BE7DEAED3D9DE993BE360BAC3E090F09BD57891FBDCCECC1BDFB3B9BBEBE960E3E9B7FD33C9413A8BE6602503E5FD25E3E63DA78BD5AE7643D66713ABD96D134BE6B6E833EAFF9593E51574C3D15EE6CBECDDC3EBE5CC29C3ED73F82BD78216D3E2D88E93D838C793E0D31B3BEA04B9B3E70F771BCC240953EAE0350BEB49D963E86C4C3BD5810043E885B0EBE63EB9E3CE7D69F3E68FBF7BD4D5F8FBE45783E3D8B2539BDB3F98FBD489571BD854550BE5747C4BD14B840BD18C540BEEC6C893E185187BE1C8909BEBEA7153E0A24983D001D273EDB7AE03DEB76283E3443273D16029ABE48A7C9BD41688C3E49F560BE",
      weight_1: "0x010000003B0DFBBD337D053EA627793E70B577BE900DC83D3CF9873E0B256DBE061F273E0BD287BD9BC7703EC3137B3E3B47703E17919BBEBB55673EC8FF33BE262D293EA0E39F3D5BA972BE6CBC97BEBE763BBE0BE7CB3D00C8E03B962AE93DABD67B3E0BD9173DB01ADB3D6B20E4BD906AEC3DD612AF3C3BC58FBE106581BD5616E8BDB05C6E3E601C96BE4B8F45BE63D77BBE4B90A4BEAC448C3EB36781BE74018ABE102A9D3E80B58C3E404E173DBBD4843EB87AA63EA0B966BE3636733EB67E333DA0D115BEC65F5BBEE80956BE0BA461BD161339BD0650973EAB2CCBBDBEA342BE8BF667BEB6A2B23DD8EA93BECB185D3EA623983D8E0E98BE565B01BB5B886FBE669118BEFBAA9FBD5342333EB67A153E38C61FBEFB34363EA63443BE081279BE",
      input_0: "0x00000000",
      output_0: "0x00000000"
    }
  }
#-}

