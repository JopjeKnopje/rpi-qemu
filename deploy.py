from platform import system

from pyinfra.context import host
from pyinfra.operations import apt, files


apt.packages(
    name="install required packages",
    packages=["git", "python3-pip", "curl", "ffmpeg", "libsm6", "libxext6"],
    update=True,
    _sudo = True,
    _sudo_password = "raspberry"
)

apt.packages(
    name="install packages to fix libgl1 error",
    packages=["ffmpeg", "libsm6", "libxext6"],
    update=True,
    _sudo = True,
    _sudo_password = "raspberry"
)


files.put(src="rpi-scripts/create-swap.sh",
          dest="scripts/",
          create_remote_dir=True)

