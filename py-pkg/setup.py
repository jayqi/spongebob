from pathlib import Path
import setuptools


with (Path(__file__).parent / "README.md").open("r") as fp:
    long_description = fp.read().strip()

with (Path(__file__).parent / "spongebobcase" / "VERSION").open("r") as fp:
    version = fp.read().strip()


setuptools.setup(
    name="spongebobcase",
    author="Jay Qi",
    author_email="jayqi.opensource@gmail.com",
    description=("SPoNgeBOb-CAse cONveRSioN iN PyTHoN."),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: BSD License",
        "Operating System :: OS Independent",
        "Topic :: Text Processing",
        "Topic :: Utilities",
    ],
    include_package_data=True,
    install_requires=[],
    keywords=["mocking spongebob case", "spongebob", "spongebob case", "spongebobsay"],
    long_description=long_description,
    long_description_content_type="text/markdown",
    packages=setuptools.find_packages(include=["spongebobcase"]),
    python_requires=">=3.6",
    url="https://github.com/jayqi/spongebob",
    version=version,
)
