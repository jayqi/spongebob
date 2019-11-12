import setuptools

CURRENT_VERSION = "0.0.1"

setuptools.setup(
    name="spongebob",
    version=CURRENT_VERSION,
    author="Jay Qi",
    author_email="jayqi.opensource@gmail.com",
    description="SPoNgeBOb-CAse cONveRSioN iN PyTHoN",
    # long_description=long_description,
    # long_description_content_type="text/markdown",
    url="https://github.com/jayqi/spongebob",
    packages=setuptools.find_packages(),
    # classifiers=[
    #     "Programming Language :: Python :: 3",
    #     "License :: OSI Approved :: MIT License",
    #     "Operating System :: OS Independent",
    # ],
    python_requires=">=3.6",
)
