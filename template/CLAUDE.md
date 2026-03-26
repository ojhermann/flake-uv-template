# {{ project_slug }}

{{ description }}

## Project structure

- `src/{{ module_name }}/` — main package
- `tests/{{ module_name }}_test/` — tests (pytest)

## Dev workflow

Enter the dev environment:

```
nix develop
```

Run tests:

```
pytest
```

Type-check:

```
ty check
```

Lint / format:

```
ruff check
ruff format
```

## Tools

- **uv**: dependency management (`uv add <pkg>`, `uv sync`)
- **prek**: git hooks (`prek run --all-files`)
- **zellij**: terminal multiplexer — `zellij --layout layout.kdl`
