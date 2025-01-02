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
            %cst_4 = arith.constant 1.000000e-01 : f32
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
      weight: "0x01000000423FB13E028CE7BD4255F7BC02FC763E27156DBE743BDDBCCAFE6A3EF36DA2BEF3E92D3EBEB3B33E455C9ABEADDA9ABEC50C98BE645B643EC6DFE0BCBD0904BD734A583ED1F8803E3264A73D3EE7A93E225C22BED1CE8FBE3547B23ECF4E7F3D058FADBE8F48693E17D1233CB305073E91614F3EFAC4933CB819483E9D48C13DAF103DBEC9E39FBE54284ABEC0D659BE8440FABD23E0383EEEA4163E9FE83CBC42741DBE1247963E663B96BEDF0573BE7068F73C2E1879BEB0E5A2BD0BC259BE0929913E11AF083E351B30BE54886E3BF989873E2DE1903EBC0F2ABE8856183E267B173DE85B6BBD386B673EB961833E62A3973EEBB519BD8EB78F3EF7F6EA3D",
      weight_1: "0x010000000852A1BEABA1ABBBE0E2123D0836893ED6777CBCFBE2483ED6FFE7BDF481A43EC8E62EBEFE17173E4ABF92BE2093D9BD9770A33E06E56B3EDB80C83D5BF5D3BD63891FBEAB2D293C165781BD70D881BE004962BE3750973EA01E083D90A7B1BD08FD553E3BBC193EA0CE073DA83DA93E00F9F33D3B20553ECB424BBD40E5A73D2E647BBE787F753E38157BBEC6804D3E80B9DC3C202078BD560AB3BC0B5B503DEBF5263D7AFEA13E56ACD43B76E5143D9F4997BE6BF39CBEFE9D8D3E4B66EA3D6B327E3D0AC999BEB65B963DD0AC98BEA32721BE2674433EA06A323DE31D1DBEB7C18BBEABB2723A58FA873E56DC4E3C40B945BD56EF62BB00F46A3C16CF05BE8673873EACD9A3BEBE7C0E3E16DB6DBD809A4CBEEB91933EF6DD5D3DC716983E",
      input_0: "0x00000000",
      output_0: "0x00000000"
    }
  }
#-}

