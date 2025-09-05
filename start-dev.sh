#!/bin/bash

# Quantum Observer Development Server Startup Script
# This script starts both the Python backend and Next.js frontend

set -e

echo "🚀 Starting Quantum Observer Development Environment..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if .env.local exists
if [ ! -f ".env.local" ]; then
    echo -e "${YELLOW}⚠️  Warning: .env.local not found. Copying from .env...${NC}"
    cp .env .env.local
    echo -e "${YELLOW}Please edit .env.local and add your GEMINI_API_KEY${NC}"
fi

# Check if node_modules exists
if [ ! -d "node_modules" ]; then
    echo -e "${BLUE}📦 Installing Node.js dependencies...${NC}"
    npm install
fi

# Check if Python backend dependencies are installed
if [ ! -d "python-backend/venv" ]; then
    echo -e "${BLUE}🐍 Setting up Python backend virtual environment...${NC}"
    cd python-backend
    python -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
    cd ..
fi

# Function to cleanup on exit
cleanup() {
    echo -e "\n${RED}🛑 Shutting down services...${NC}"
    if [ ! -z "$BACKEND_PID" ]; then
        kill $BACKEND_PID 2>/dev/null
    fi
    if [ ! -z "$FRONTEND_PID" ]; then
        kill $FRONTEND_PID 2>/dev/null
    fi
    exit 0
}

# Trap SIGINT and SIGTERM to cleanup
trap cleanup INT TERM

echo -e "${GREEN}🔧 Starting Python backend...${NC}"
cd python-backend
source venv/bin/activate
python app.py &
BACKEND_PID=$!
cd ..

# Wait for backend to start
sleep 3

# Check if backend is running
if curl -s http://localhost:5000/health > /dev/null; then
    echo -e "${GREEN}✅ Backend started successfully at http://localhost:5000${NC}"
else
    echo -e "${RED}❌ Failed to start backend${NC}"
    cleanup
fi

echo -e "${GREEN}🖥️  Starting Next.js frontend...${NC}"
npm run dev &
FRONTEND_PID=$!

echo -e "${GREEN}✅ Development servers started successfully!${NC}"
echo -e "${BLUE}📱 Frontend: http://localhost:9002${NC}"
echo -e "${BLUE}🔧 Backend:  http://localhost:5000${NC}"
echo -e "${YELLOW}💡 Press Ctrl+C to stop all servers${NC}"

# Wait for both processes
wait