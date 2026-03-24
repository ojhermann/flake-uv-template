import pytest

from grokking.filler import dummy


@pytest.mark.unit_test
def test_dummy() -> None:
    assert dummy() == 0
