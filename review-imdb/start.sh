#!/bin/bash
set -e  # Exit on error

echo "========================================"
echo "Starting IMDB Review Sentiment Analyzer"
echo "========================================"
echo ""

# Check Python version
echo "Python version:"
python3 --version || python --version
echo ""

# Install Python dependencies if requirements.txt exists
if [ -f "requirements.txt" ]; then
    echo "Installing Python dependencies..."
    pip3 install --upgrade pip || pip install --upgrade pip
    pip3 install -r requirements.txt || pip install -r requirements.txt
    echo "Python dependencies installed successfully!"
fi

# Install Node.js dependencies if package.json exists
if [ -f "package.json" ]; then
    echo "Installing Node.js dependencies..."
    npm install
    echo "Node.js dependencies installed successfully!"
    
    # Build Next.js app
    echo "Building Next.js application..."
    npm run build
    echo "Next.js build completed!"
fi

# Start Flask API server with gunicorn
echo ""
echo "========================================"
echo "Starting Flask API server with gunicorn"
echo "========================================"
echo "Server will run on port: ${PORT:-5000}"
echo ""

# Use gunicorn to start the Flask app
gunicorn api_server:app \
    --bind 0.0.0.0:${PORT:-5000} \
    --workers 2 \
    --timeout 120 \
    --access-logfile - \
    --error-logfile -

