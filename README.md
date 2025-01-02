# Stream-HLS

Stream-HLS is a novel framework designed to simplify the development of customized hardware circuits for software applications using high-level synthesis (HLS). Traditional HLS approaches often require significant expertise in hardware design and frameworks, making the process non-trivial.
## Key Features

Stream-HLS offers the following features:

- **Automatic Hardware Generation**: Converts C/C++ or PyTorch software code into optimized custom hardware designs and host code for FPGAs.
- **Streaming Dataflow Architectures**: Generates hardware designs consisting of modules that communicate purely through streaming channels.
- **Global Scheduling Performance Model**: Provides an accurate analytical performance model for global scheduling of streaming dataflow architectures.
- **High Performance**: Evaluated using various HLS benchmarks and real-world benchmarks from convolutional neural networks and transformer models. Stream-HLS designs outperform the designs of prior state-of-the-art automation frameworks and manually-optimized designs of abstraction frameworks by up to 79.43× and 10.62× geometric means respectively.
- **Built on MLIR**: Utilizes the multi-level intermediate representation (MLIR) framework, allowing for future reuse and extensions.

## How to Use

For simple usage, refer to the examples provided in the `example` directory. This directory includes sample scripts and configurations to help you get started with Stream-HLS.
