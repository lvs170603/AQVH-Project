# Quantum Observer - Quick Start Guide

## 🚀 Fastest Way to Get Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/lvs170603/AQVH-Project.git
   cd AQVH-Project
   ```

2. **Set up your API key:**
   ```bash
   cp .env .env.local
   # Edit .env.local and add your GEMINI_API_KEY
   ```

3. **Run everything:**
   
   **Linux/macOS:**
   ```bash
   ./start-dev.sh
   ```
   
   **Windows:**
   ```bash
   start-dev.bat
   ```

4. **Access the application:**
   - Frontend: http://localhost:9002
   - Backend API: http://localhost:5000
   - Genkit Inspector (optional): http://localhost:4000

## 🧪 Test Your Setup

```bash
./test-setup.sh
```

## 📋 What You Get

- **Real-time quantum job monitoring dashboard**
- **Backend health monitoring**
- **AI-powered anomaly detection**
- **Mock quantum circuit execution**
- **Responsive design with dark/light mode**

## 🔧 Manual Setup (if needed)

### Frontend
```bash
npm install
npm run dev
```

### Backend
```bash
cd python-backend
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install -r requirements.txt
python app.py
```

### Docker (Alternative)
```bash
docker-compose -f docker-compose_Version3.yml up
```

## 📚 More Info

See the main [README.md](README.md) for comprehensive documentation.