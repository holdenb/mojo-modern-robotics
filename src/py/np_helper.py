import ast
import numpy as np


def array(arrays: str, dtype):
    _, dtype = dtype.split(".")
    return np.array(ast.literal_eval(arrays), getattr(np, dtype))
