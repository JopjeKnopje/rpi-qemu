from pyinfra.operations import apt, files


apt.packages(
    name="install required packages",
    packages=["git", "python3-pip", "curl"],
    update=True,
    _sudo = True,
)


files.put(src="rpi-scripts/create-swap.sh", dest="scripts/")
