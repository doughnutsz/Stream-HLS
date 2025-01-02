import torch.nn as nn
import torch.nn.functional as F

'''
5. Depthwise Separable Convolution Block
Used in MobileNets, this block factorizes a standard convolution into a depthwise convolution followed by a pointwise convolution.
'''

class DepthwiseSeparableConvBlock(nn.Module):
    def __init__(self, in_channels, out_channels, stride=1):
        super(DepthwiseSeparableConvBlock, self).__init__()
        self.depthwise = nn.Conv2d(in_channels, in_channels, kernel_size=3, stride=stride, padding=1, groups=in_channels, bias=False)
        self.pointwise = nn.Conv2d(in_channels, out_channels, kernel_size=1, bias=False)
        self.bn = nn.BatchNorm2d(out_channels)
        self.relu = nn.ReLU(inplace=True)

    def forward(self, x):
        # conv1Ops = self.depthwise.in_channels * self.depthwise.kernel_size[0] * self.depthwise.kernel_size[1]
        # conv1Ops *= x.size()[2] * x.size()[3]
        out = self.depthwise(x)
        # conv2Ops = self.pointwise.in_channels * self.pointwise.out_channels * self.pointwise.kernel_size[0] * self.pointwise.kernel_size[1]
        # conv2Ops *= out.size()[2] * out.size()[3]
        out = self.pointwise(out)
        out = self.bn(out)
        # hlsmlir = max(conv1Ops, conv2Ops)
        # hida = conv1Ops + conv2Ops
        # print("conv1Ops:", conv1Ops)
        # print("conv2Ops:", conv2Ops)
        # print("hlsmlir:", hlsmlir)
        # print("hida:", hida)
        # print(f"speedup: {hida / hlsmlir:.2f}x")
        return self.relu(out)
