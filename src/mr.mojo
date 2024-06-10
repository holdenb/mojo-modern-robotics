from logger import Logger
from python import Python, PythonObject


struct ModernRobotics:
    var _mr: PythonObject
    var _np: PythonObject
    var _np_helper: PythonObject
    var _py: PythonObject

    fn __init__(inout self) raises:
        Python.add_to_path(".")
        # Python.import_module("src.py.py_mr")
        self._mr = Python.import_module("modern_robotics")
        self._np = Python.import_module("numpy")
        self._np_helper = Python.import_module("src.py.np_helper")
        self._py = Python.import_module("builtins")

    fn rot_inv(self) raises:
        var R = self._np_helper.array(
            "[[0, 0, 1], [1, 0, 0], [0, 1, 0]]", "np.int32"
        )
        var inv_R = self._mr.RotInv(R)
        Logger.log_info(inv_R)

        var r = self._np_helper.array(
            "[[1, 2, 3], [1, 2, 3], [1, 2, 3]]", "np.int32"
        )
        var inv_r = self._mr.RotInv(r)
        Logger.log_info(inv_r)
