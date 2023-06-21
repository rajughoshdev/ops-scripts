#!/bin/bash

# Install Homebrew if not already installed
if test ! $(which brew); then
    echo "Installing Homebrew..."
    sudo apt install build-essential
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Read list of packages from packages.txt file
PACKAGES=$(<packages.txt)

# Loop through packages and install each one
for PACKAGE in $PACKAGES
do
    # Split package name into parts separated by "/"
    IFS='/' read -ra PKG_PARTS <<< "$PACKAGE"

    # Check if package name has 3 parts (i.e. is from a custom tap)
    if [ ${#PKG_PARTS[@]} -eq 3 ]; then
        TAP=${PKG_PARTS[0]}/${PKG_PARTS[1]}
        PACKAGE_NAME=${PKG_PARTS[2]}
        if brew tap | grep -q "$TAP"; then
            echo "Custom tap $TAP is already installed."
        else
            echo "Adding custom tap $TAP..."
            brew tap "$TAP"
        fi
        if brew list "$PACKAGE" >/dev/null 2>&1; then
            echo "$PACKAGE is already installed."
        else
            echo "Installing $PACKAGE_NAME..."
            brew install "$PACKAGE"
        fi
    else
        if brew list "$PACKAGE" >/dev/null 2>&1; then
            echo "$PACKAGE is already installed."
        else
            echo "Installing $PACKAGE..."
            brew install "$PACKAGE"
        fi
    fi
done

echo "Homebrew packages installation complete."

