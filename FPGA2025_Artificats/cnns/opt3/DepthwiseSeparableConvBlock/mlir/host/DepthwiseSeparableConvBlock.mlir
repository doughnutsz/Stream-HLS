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
      weight: "0x010000007C64B1BEA24FB63DB150B43E6FFFAABD20AFD1BC6355A03E50D4A23E5EDD6ABEEFCBB0BE31BBAE3EA7DF053ED746E43B9DB0653DE4DA64BDC8D7B23E73B1A23E7F92ACBE8A0A0F3ED26643BEF50982BE25A999BEFD17023E7DF8DE3D1198A43E1FB99B3ECB3B053E62138D3EE73A113E9D6F933D0422923D27ED013D19CBA83D26019EBE7D9605BEA42733BE66573A3ECA489ABE3D61A0BED359CEBDD84620BEC6D18E3D1FD7233E07B0BD3D423D9C3E941FF8BD16EA15BEC87257BE5352AABED8E8D13CAEA022BED438CF3D5CDF45BC9F5E2A3E2DB9823E350CD5BDA22A9A3E7FEF923DFC0351BE61729DBE42406CBABA8E97BD6F8A23BE4FEBD33D00E82ABE",
      weight_1: "0x01000000430B12BEE0C172BE8000223EF3B873BE56B1343CE0191B3E2081C73D2AFDA5BE28565C3E36A3873E3617023DCB2792BDDF39A6BE2BB162BD4BC640BE0B18DE3D801F11BC962150BD30BB70BE00CC993D2B75013C06F391BEEE00163E3F0A84BEAB779ABD36447A3EC2509A3E5647EEBC8E04373EB3E601BEE6A0C03D3B7554BE965A51BD167889BE6B5D93BD3452A43E76FD34BD40D9E2BD204561BD7BBFC03DD6D1373D13BD0D3E3B4E253E7EED73BE3F7DA6BE2B7624BE5003003E40516DBD676C8C3EEB71CCBD169A9CBCF427913E76A59F3D08BE48BEBB956E3E80E894BD3B640B3E5655693EB30765BEE65E0ABE2B942EBC00D20A3B83F69A3E1E042FBE7B2957BEA0B51C3E0B06C8BD88D72ABE48B973BE8BD0573ED38371BE8A5482BE",
      input_0: "0x00000000",
      output_0: "0x00000000"
    }
  }
#-}

