#!/usr/bin/env python3
import os
import sys


def non_dunder_directories(directory_names: list[str]) -> list[str]:
    return [d for d in directory_names if not d.startswith("__")]


def non_dunder_python_files(file_names: list[str]) -> list[str]:
    return [f for f in file_names if not f.startswith("__") and f.endswith(".py")]


def main() -> None:
    bogus: list[str] = []
    for dirpath, dirnames, filenames in os.walk("tests"):
        dirnames: list[str] = non_dunder_directories(dirnames)
        filenames: list[str] = non_dunder_python_files(filenames)

        bogus = bogus + [
            os.path.join(dirpath, d) for d in dirnames if not d.endswith("test")
        ]
        bogus = bogus + [
            os.path.join(dirpath, f) for f in filenames if not f.endswith("test.py")
        ]

    if len(bogus) > 0:
        for path in bogus:
            print(f"Does not end with 'test': {path}")
        sys.exit(1)


if __name__ == "__main__":
    main()
