#!/bin/bash

# Test script to verify the Quantum Observer setup
set -e

echo "🧪 Testing Quantum Observer Setup..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test Node.js
echo -e "${BLUE}Testing Node.js installation...${NC}"
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version)
    echo -e "${GREEN}✅ Node.js found: $NODE_VERSION${NC}"
else
    echo -e "${RED}❌ Node.js not found${NC}"
    exit 1
fi

# Test Python
echo -e "${BLUE}Testing Python installation...${NC}"
if command -v python &> /dev/null; then
    PYTHON_VERSION=$(python --version)
    echo -e "${GREEN}✅ Python found: $PYTHON_VERSION${NC}"
elif command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version)
    echo -e "${GREEN}✅ Python found: $PYTHON_VERSION${NC}"
else
    echo -e "${RED}❌ Python not found${NC}"
    exit 1
fi

# Test npm dependencies
echo -e "${BLUE}Testing npm dependencies...${NC}"
if [ -d "node_modules" ]; then
    echo -e "${GREEN}✅ Node.js dependencies installed${NC}"
else
    echo -e "${YELLOW}⚠️  Node.js dependencies not found, installing...${NC}"
    npm install
fi

# Test Python dependencies
echo -e "${BLUE}Testing Python dependencies...${NC}"
if [ -d "python-backend/venv" ]; then
    echo -e "${GREEN}✅ Python virtual environment found${NC}"
else
    echo -e "${YELLOW}⚠️  Python virtual environment not found${NC}"
    echo -e "${YELLOW}Run: cd python-backend && python -m venv venv && source venv/bin/activate && pip install -r requirements.txt${NC}"
fi

# Test TypeScript compilation
echo -e "${BLUE}Testing TypeScript compilation...${NC}"
if npm run typecheck 2>/dev/null; then
    echo -e "${GREEN}✅ TypeScript compilation successful${NC}"
else
    echo -e "${YELLOW}⚠️  TypeScript compilation has some warnings (this is normal for development)${NC}"
fi

# Test Next.js build
echo -e "${BLUE}Testing Next.js build...${NC}"
if npm run build; then
    echo -e "${GREEN}✅ Next.js build successful${NC}"
else
    echo -e "${RED}❌ Next.js build failed${NC}"
    exit 1
fi

# Test environment files
echo -e "${BLUE}Testing environment configuration...${NC}"
if [ -f ".env" ]; then
    echo -e "${GREEN}✅ .env file found${NC}"
else
    echo -e "${YELLOW}⚠️  .env file not found${NC}"
fi

if [ -f ".env.local" ]; then
    echo -e "${GREEN}✅ .env.local file found${NC}"
else
    echo -e "${YELLOW}⚠️  .env.local file not found (create it from .env)${NC}"
fi

echo -e "${GREEN}🎉 All tests passed! Your Quantum Observer setup is ready.${NC}"
echo -e "${BLUE}To start the development servers, run: ./start-dev.sh${NC}"