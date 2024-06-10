from PIL import Image, ImageOps
import numpy as np
import matplotlib.pyplot as plt


def create_img() -> None:
    img = Image.open("c_space.png")
    img = ImageOps.grayscale(img)

    # Invert grayscale np array
    np_img = ~np.array(img)
    np_img[np_img > 0] = 1

    plt.set_cmap("binary")
    plt.imshow(np_img)

    # Save image as a .npy
    np.save("c_space.npy", np_img)


def read_img() -> None:
    grid = np.load("c_space.npy")
    plt.imshow(grid)
    plt.tight_layout()
    plt.show()


def read_to_np_array():
    return np.load("src/py/c_space.npy")
