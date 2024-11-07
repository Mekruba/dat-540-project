#!/bin/bash

# Check if the virtual environment directory exists
if [ ! -d "venv" ]; then
    # Create a new virtual environment
    echo "Creating virtual environment..."
    python3 -m venv venv
else
    echo "Virtual environment already exists."
fi

# Check the operating system and activate the virtual environment accordingly
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    echo "Linux detected. Activating virtual environment..."
    source venv/bin/activate
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    echo "macOS detected. Activating virtual environment..."
    source venv/bin/activate
elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    # Windows (Cygwin, MSYS, or native Windows)
    echo "Windows detected. Activating virtual environment..."
    source venv/Scripts/activate
else
    echo "Unsupported OS: $OSTYPE"
    exit 1
fi

# Install dependencies from requirements.txt
if [ -f "requirements.txt" ]; then
    echo "Installing dependencies from requirements.txt..."
    pip install -r requirements.txt
else
    echo "No requirements.txt file found!"
fi

# Deactivate the virtual environment
echo "Deactivating virtual environment..."
deactivate
