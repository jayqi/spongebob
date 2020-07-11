from pathlib import Path
import pkg_resources
import setuptools


with (Path(__file__).parent / "README.md").open("r") as fp:
    long_description = fp.read().strip()

with (Path(__file__).parent / "requirements.txt").open("r") as fp:
    install_requires = [str(req) for req in pkg_resources.parse_requirements(fp)]

with (Path(__file__).parent / "spongebobsay" / "VERSION").open("r") as fp:
    version = fp.read().strip()

setuptools.setup(
    name="spongebobsay",
    author="Jay Qi",
    author_email="jayqi.opensource@gmail.com",
    description="AScIi MOcKiNg sPONgEbOB comMAnD-lIne ProGrAm",
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: BSD License",
        "Operating System :: OS Independent",
        "Topic :: Text Processing",
        "Topic :: Utilities",
    ],
    entry_points={"console_scripts": ["spongebobsay=spongebobsay.spongebobsay:app"]},
    include_package_data=True,
    install_requires=install_requires,
    keywords=["mocking spongebob case", "spongebob", "spongebob case", "spongebobsay"],
    long_description=long_description,
    long_description_content_type="text/markdown",
    packages=setuptools.find_packages(include=["spongebobsay"]),
    python_requires=">=3.6",
    url="https://github.com/jayqi/spongebob",
    version=version,
)
