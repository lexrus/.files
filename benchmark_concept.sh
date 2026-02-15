#!/bin/bash

TEMP_DIR=$(mktemp -d)
echo "Using temp dir: $TEMP_DIR"

# Mock curl function
mock_curl() {
  echo "Downloading..."
  sleep 1
}

# Baseline: Always download
echo "--- Baseline: Always Download ---"
start_time=$(date +%s%N)
mock_curl
end_time=$(date +%s%N)
elapsed=$(( (end_time - start_time) / 1000000 ))
echo "Baseline time: ${elapsed}ms"

# Optimized: Check file existence
echo "--- Optimized: Check File Existence ---"
# Simulate file existing in temp dir
mkdir -p "$TEMP_DIR/.vim/autoload"
touch "$TEMP_DIR/.vim/autoload/plug.vim"

start_time=$(date +%s%N)
if [ ! -f "$TEMP_DIR/.vim/autoload/plug.vim" ]; then
  mock_curl
else
  echo "File exists, skipping download."
fi
end_time=$(date +%s%N)
elapsed=$(( (end_time - start_time) / 1000000 ))
echo "Optimized time: ${elapsed}ms"

rm -rf "$TEMP_DIR"
