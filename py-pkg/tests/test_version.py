from spongebobcase import __version__


def test_version():
    assert isinstance(__version__, str)
    assert len(__version__) > 0
