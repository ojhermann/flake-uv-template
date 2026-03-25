# flake-uv-template

A [copier](https://copier.readthedocs.io) template for Python projects using Nix
flakes and uv.

## Expectations

- [Nix](https://nixos.org/) installed on the destination machine
- [direnv](https://direnv.net/) installed on the destination machine
- [nix-direnv](https://github.com/nix-community/nix-direnv) installed on the
  destination machine

## Usage

```bash
copier copy https://github.com/ojhermann/flake-uv-template /path/to/new-project
```

You will be prompted for:

- `project_slug` — hyphen-separated project name (e.g. `my-project`)
- `module_name` — underscore-separated Python module name (e.g. `my_module`)
- `description` — short project description
- `author_name` — your full name
- `author_email` — your email address

## Updating a generated project

If the template changes, you can pull in updates from inside a generated
project:

```bash
copier update
```
