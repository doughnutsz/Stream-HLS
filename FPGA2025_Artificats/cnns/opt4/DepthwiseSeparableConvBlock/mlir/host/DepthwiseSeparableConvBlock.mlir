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
      weight: "0x01000000D93D9CBEBB6D14BE102E61BEDA17533E96FE34BB2E29903EDB9F77BE709EE33D086883BEC6AD433E0493543E37F77CBEB5598F3E415005BEFEAF39BE1EE9B0BE04AECEBD178D9CBDEEBF9CBE0AAB6ABD03A264BD71AC77BE8A96433E438B62BE0112B6BD93B0183EE81AFABDCCD1ABBD444001BD6B480A3DDBB3813E44F7B13EC2A8633E4EAE283B41089EBE4B5E1F3DBF22D93D18227D3AA2588F3CBCDE4F3C1C32473DD1B2103E00B1C5BD315CACBE3172CF3B5C8DC53D3526843E661103BEBE7B353D994F23BD3A2E50BEB776853E44E2F6BC3616AF3E09CF663D89A4373E523728BEF4A4073E8F06A4BE38D49CBD8FC0453EC1E643BED5E4CBBD170FB5BD",
      weight_1: "0x01000000988E813E56D8BB3B08866EBE2B228A3CD07FEB3D20A58B3EABD74BBEA444993ED6F458BDCFED87BE5609903EE66709BED691A1BE3BF648BE86FB35BEB6CD42BE3A3380BE3EE14EBE649B8C3EE0CA063D86524C3E70EA0ABE770EA4BECBABE8BDD68939BC66D070BE2B4963BE3082133E1010D73D86EEF63D92928EBE8023223C60D8B1BDA29E9D3E3B08513EDEE6433E36329ABD2BD3A1BE7B74D23D1671033E2BFEA9BD10F88ABECBAC9C3E00153ABECEA3453E4083D3BC60AB4D3DD0FA563E26833A3E2B7096BEFA41853EEBE00F3E38D9533E182792BE40A486BDA075213D56C5C2BBC0FB0FBEEB29D5BC4033A3BE82058E3EBBA1F6BD602DA3BEEB9B95BE60E317BDB87E00BE3208A7BE64D284BE56394A3B5B1CA1BDD640713E4693C63D",
      input_0: "0x00000000",
      output_0: "0x00000000"
    }
  }
#-}

