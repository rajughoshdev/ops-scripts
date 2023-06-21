
# Homebrew Package Installer for Ubuntu

This bash script installs multiple Homebrew packages listed in a `packages.txt` file, including packages from custom taps.

## Requirements

- [Homebrew](https://brew.sh/) package manager installed on your system


## Usage

1. Download the `install_packages.sh` script to your local machine.
2. Open a terminal window and navigate to the directory containing the script.
3. Make the script executable by running `chmod +x install_packages.sh`.
4. Open the `packages.txt` file and add the list of package names you want to install, separated by new lines.
5. Run the script with the command `./install_packages.sh`.

The script will check if Homebrew is already installed on your system. If it is not, it will be installed using the official installation script. Then, it will read the list of package names from the `packages.txt` file, and loop through the list, checking if each package is already installed. If the package is not installed, the script will use `brew install` command to install the package.

If any of the packages need to be installed from a custom tap (i.e., the package name contains three parts, separated by `/`), the script will also run `brew tap` to add the custom tap to your system before installing the package.

## Example usage with k9s

In your particular case, where you need to install the `k9s` package from the `derailed/k9s` tap, you can simply add "derailed/k9s/k9s" to the `packages.txt` file. 

Here is how you can do that:

1. Create a new file named `packages.txt` in the same directory as the `install_packages.sh` script.
2. Add the following line to the `packages.txt` file: `derailed/k9s/k9s`
3. Save and close the `packages.txt` file.
4. Open a terminal window and navigate to the directory containing the script and the `packages.txt` file.
5. Run the script with the command `./install_packages.sh`.

## Note

- This script assumes that you have administrative privileges on your system, as Homebrew requires sudo access to install packages.

I hope this helps you get started with the script! Let me know if you need any further assistance.