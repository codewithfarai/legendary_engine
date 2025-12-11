# Installing Poetry

This project uses Poetry for dependency and virtualenv management. Follow the steps below to install Poetry and set up the project environment.

1. Install Poetry (recommended — official installer)
```bash
curl -sSL https://install.python-poetry.org | python3 -
```

2. Make sure Poetry is on your PATH (restart shell or add to your shell RC file)
```bash
export PATH="$HOME/.local/bin:$PATH"
# or add the above line to ~/.bashrc, ~/.zshrc, etc.
```

3. Verify installation
```bash
poetry --version
```

4. Install project dependencies and create the in-project virtualenv
This repository uses an in-project virtualenv (see poetry.toml). From the project root:
```bash
poetry install
```
This will create a `.venv` directory (per poetry.toml) and install dependencies.

Optional: on Debian/Ubuntu you can install a packaged version (may be older):
```bash
sudo apt install python3-poetry
```

## Helper scripts

Two convenience scripts are included:

- ./lint.sh — runs ruff, mypy and pytest (uses `poetry run` if available or the in-project .venv).
- ./scripts/run_lint.sh — runs a command inside the in-project venv or via `poetry run` if available.

Make scripts executable and run:

```bash
cd /home/dev_two/Documents/legendary_engine
chmod +x ./lint.sh ./scripts/run_lint.sh
```

Run linting:

```bash
./lint.sh
```