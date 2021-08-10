#!/bin/bash -e

if ! command -v brew &> /dev/null; then
    echo "Homebrew not found, installing..."
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

    export PATH=/opt/homebrew/bin:/usr/local/bin:$PATH
fi
