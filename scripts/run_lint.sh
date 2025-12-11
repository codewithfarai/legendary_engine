#!/usr/bin/env bash

# Default to check-only mode
FIX=false

# Check for the --fix flag
for arg in "$@"; do
  if [ "$arg" == "--fix" ]; then
    FIX=true
  fi
done

# Define colors for pretty output
grn=$'\e[1;32m'
mag=$'\e[1;35m'
red=$'\e[1;31m'
end=$'\e[0m'

# Track failures
EXIT_CODE=0

if [ "$FIX" = true ]; then
    echo "Running ${mag}Ruff${end} (Fixing)..."
    poetry run ruff check --fix . || EXIT_CODE=1
    poetry run ruff format . || EXIT_CODE=1
else
    echo "Running ${mag}Ruff${end} (Read-only)..."
    poetry run ruff check . || EXIT_CODE=1
    poetry run ruff format --check . || EXIT_CODE=1
fi

echo "Running ${mag}MyPy${end} (Type Checking)..."
poetry run mypy . || EXIT_CODE=1

echo ""
if [ $EXIT_CODE -eq 0 ]; then
    echo "${grn}All checks passed!${end}"
    exit 0
else
    echo "${red}Checks failed.${end}"
    exit 1
fi