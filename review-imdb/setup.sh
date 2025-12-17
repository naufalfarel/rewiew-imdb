#!/bin/bash
set -e  # Exit on error

echo "========================================"
echo "Setting up Python Virtual Environment"
echo "========================================"
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "ERROR: Python 3 is not installed"
    echo "Please install Python 3.11 or later"
    exit 1
fi

echo "Python found:"
python3 --version
echo ""

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
    echo "Virtual environment created!"
else
    echo "Virtual environment already exists."
fi
echo ""

# Activate virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip
echo ""

# Install dependencies
echo "Installing Python dependencies..."
pip install -r requirements.txt
echo ""

echo "========================================"
echo "Setup completed successfully!"
echo "========================================"
echo ""
echo "To activate the virtual environment manually, run:"
echo "  source venv/bin/activate"
echo ""
echo "To deactivate, run:"
echo "  deactivate"
echo ""

