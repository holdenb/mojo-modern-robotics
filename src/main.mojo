# RUN: %mojo %s | FileCheck %s
from logger import Logger
from mr import ModernRobotics
from planning.rrt import TreeNode, RRTAlgorithm
from tensor import Tensor, TensorShape
from memory import memcpy
from python import Python


fn main() raises:
    # CHECK: Hello Mojo 🔥!
    Logger.log_info("Hello Mojo 🔥!")

    # Test MR
    var mr = ModernRobotics()
    mr.rot_inv()

    # Test RRT
    var node = TreeNode(1.1, 1.1)
    var rrt = RRTAlgorithm(node, node, 100, 1, 1)

    var reader = Python.import_module("src.py.read_cspace")
    var grid = reader.read_to_np_array()

    var pointer = int(grid.ctypes.data)

    # Convert grid to Tensor
    var t = Tensor[DType.int32](TensorShape(4))
    memcpy(
        t._ptr, DTypePointer[DType.int32](address=pointer), 4
    )  # Copy 4 elements from the NumPy array to the Mojo Tensor

    print(t)
