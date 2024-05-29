# RUN: %mojo %s | FileCheck %s
from logger import Logger
from mr import ModernRobotics


fn main() raises:
    # CHECK: Hello Mojo 🔥!
    Logger.log_info("Hello Mojo 🔥!")
    var mr = ModernRobotics()
    mr.rot_inv()
