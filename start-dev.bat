@echo off
setlocal EnableDelayedExpansion

echo 🚀 Starting Quantum Observer Development Environment...

REM Check if .env.local exists
if not exist ".env.local" (
    echo ⚠️  Warning: .env.local not found. Copying from .env...
    copy .env .env.local >nul
    echo Please edit .env.local and add your GEMINI_API_KEY
)

REM Check if node_modules exists
if not exist "node_modules" (
    echo 📦 Installing Node.js dependencies...
    call npm install
)

REM Check if Python backend virtual environment exists
if not exist "python-backend\venv" (
    echo 🐍 Setting up Python backend virtual environment...
    cd python-backend
    python -m venv venv
    call venv\Scripts\activate.bat
    pip install -r requirements.txt
    cd ..
)

echo 🔧 Starting Python backend...
cd python-backend
call venv\Scripts\activate.bat
start /B python app.py
cd ..

REM Wait for backend to start
timeout /t 3 /nobreak >nul

REM Check if backend is running (simplified check for Windows)
echo ✅ Backend should be running at http://localhost:5000

echo 🖥️  Starting Next.js frontend...
call npm run dev

echo Press Ctrl+C to stop all servers
pause