#!/bin/bash

# Check if the virtual environment directory exists
if [ ! -d "venv" ]; then
    # Create a new virtual environment
    echo "Creating virtual environment..."
    python3 -m venv venv
else
    echo "Virtual environment already exists."
fi

# Activate the virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

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