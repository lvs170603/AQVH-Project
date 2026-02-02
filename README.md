<div align="center">

# 🔬 Quantum Observer

### Real-time Quantum Computing Monitoring Dashboard

[![Next.js](https://img.shields.io/badge/Next.js-15.5-black?style=flat-square&logo=next.js)](https://nextjs.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.0-blue?style=flat-square&logo=typescript)](https://www.typescriptlang.org/)
[![React](https://img.shields.io/badge/React-18.3-61DAFB?style=flat-square&logo=react)](https://react.dev/)
[![Firebase Genkit](https://img.shields.io/badge/Firebase-Genkit-FFA611?style=flat-square&logo=firebase)](https://firebase.google.com/docs/genkit)
[![License](https://img.shields.io/badge/license-MIT-green?style=flat-square)](LICENSE)

**[Features](#-features) • [Quick Start](#-quick-start) • [Documentation](#-documentation) • [API](#-api-reference) • [Contributing](#-contributing)**

</div>

---

## 📖 Overview

**Quantum Observer** is a modern, full-stack monitoring dashboard designed for quantum computing workloads. Built with Next.js and powered by AI, it provides real-time visibility into quantum job execution, backend health monitoring, and intelligent anomaly detection.

> 🚀 **New to this project?** Check out our [Quick Start Guide](QUICKSTART.md) to get up and running in minutes!

### Key Highlights

- 🎯 **Real-time Monitoring** - Track quantum jobs as they execute with live status updates
- 🧠 **AI-Powered Insights** - Automatic anomaly detection using Firebase Genkit and Google Gemini
- 📊 **Interactive Analytics** - Visualize trends, metrics, and performance data
- 🎨 **Modern UI/UX** - Responsive design with dark/light mode support
- 🔌 **Flexible Backend** - Mock mode for development, ready for real Qiskit integration
- 🐳 **Docker Ready** - Containerized deployment for production environments

## ✨ Features

### Core Capabilities

| Feature | Description |
|---------|-------------|
| **Real-time Job Tracking** | Monitor quantum jobs across all states (Queued, Running, Completed, Error, Cancelled) |
| **Backend Health Dashboard** | Track status, queue depth, and error rates for all quantum backends |
| **Performance KPIs** | View key metrics including job counts, wait times, and success rates |
| **Historical Analysis** | Interactive charts showing job status trends and patterns over time |
| **AI Anomaly Detection** | Intelligent analysis of job data to identify unusual behavior and system issues |
| **Responsive Design** | Seamless experience across desktop, tablet, and mobile devices |
| **Theme Support** | Switch between light and dark modes for optimal viewing comfort |

## 🛠️ Tech Stack

### Frontend
- **Framework:** [Next.js 15.5](https://nextjs.org/) with App Router
- **Language:** [TypeScript 5.0](https://www.typescriptlang.org/)
- **UI Library:** [React 18.3](https://react.dev/)
- **Styling:** [Tailwind CSS 3.4](https://tailwindcss.com/)
- **Components:** [ShadCN UI](https://ui.shadcn.com/)
- **Charts:** [Recharts 2.15](https://recharts.org/)
- **Icons:** [Lucide React](https://lucide.dev/)

### Backend
- **Runtime:** Python 3.8+
- **Framework:** Flask with CORS support
- **Quantum:** Mock simulator (Qiskit-ready)

### AI & Analytics
- **AI Platform:** [Firebase Genkit](https://firebase.google.com/docs/genkit)
- **AI Model:** Google Gemini API

## 🚀 Quick Start

Get started with Quantum Observer in just a few commands!

### Prerequisites

Before you begin, ensure you have the following installed:

| Tool | Version | Required | Purpose |
|------|---------|----------|---------|
| [Node.js](https://nodejs.org/) | 18.x or later | ✅ Yes | Frontend runtime |
| [npm](https://www.npmjs.com/) | 9.x or later | ✅ Yes | Package management |
| [Python](https://python.org/) | 3.8 or later | ✅ Yes | Backend runtime |
| [Docker](https://docker.com/) | Latest | ⚪ Optional | Container deployment |
| [Git](https://git-scm.com/) | Latest | ✅ Yes | Version control |

### Installation Methods

Choose your preferred setup method:

### Method 1: Automated Setup ⚡ (Recommended)

The fastest way to get started! Our startup scripts handle everything automatically.

#### Step 1: Clone the Repository

```bash
git clone https://github.com/lvs170603/AQVH-Project.git
cd AQVH-Project
```

#### Step 2: Configure Environment

```bash
cp .env .env.local
# Edit .env.local and add your Gemini API key:
# GEMINI_API_KEY=your_api_key_here
```

<details>
<summary>📝 How to get a Gemini API Key</summary>

1. Visit [Google AI Studio](https://makersuite.google.com/app/apikey)
2. Sign in with your Google account
3. Click "Create API Key"
4. Copy the key and paste it into your `.env.local` file

</details>

#### Step 3: Run the Application

**Linux/macOS:**
```bash
chmod +x start-dev.sh
./start-dev.sh
```

**Windows:**
```batch
start-dev.bat
```

The scripts will automatically:
- ✅ Check and install all dependencies
- ✅ Set up Python virtual environment
- ✅ Start both backend and frontend servers
- ✅ Provide helpful status messages

#### Step 4: Access the Application

Once the setup completes, open your browser and navigate to:

- 🌐 **Frontend Dashboard:** http://localhost:9002
- 🔧 **Backend API:** http://localhost:5000
- 🧪 **Genkit Inspector:** http://localhost:4000 (optional)

### Method 2: Manual Setup 🔧

If you prefer more control over the setup process:

### Method 2: Manual Setup 🔧

If you prefer more control over the setup process:

<details>
<summary>Click to expand manual setup instructions</summary>

#### 1. Clone the Repository

```bash
git clone https://github.com/lvs170603/AQVH-Project.git
cd AQVH-Project
```

#### 2. Set Up Environment Variables

Create a `.env.local` file with your API credentials:

```bash
cp .env .env.local
```

Edit `.env.local` and add:
```env
GEMINI_API_KEY=your_api_key_here
NEXTAUTH_SECRET=your_nextauth_secret_here  # Optional
```

#### 3. Install Frontend Dependencies

```bash
npm install
```

#### 4. Set Up Python Backend

Navigate to the backend directory and create a virtual environment:

```bash
cd python-backend
python -m venv venv

# Activate the virtual environment:
# Linux/macOS:
source venv/bin/activate

# Windows:
venv\Scripts\activate

# Install dependencies:
pip install -r requirements.txt
```

#### 5. Start the Services

You'll need two terminal windows:

**Terminal 1 - Backend:**
```bash
cd python-backend
python app.py
```
Backend runs on http://localhost:5000

**Terminal 2 - Frontend:**
```bash
npm run dev
```
Frontend runs on http://localhost:9002

#### 6. Verify Installation

Check backend health:
```bash
curl http://localhost:5000/health
```

Expected response:
```json
{
  "status": "ok",
  "note": "Running in MOCK mode (Qiskit not installed). Replace with real Qiskit backend when ready."
}
```

#### 7. Optional: Run Genkit Inspector

For AI flow debugging:
```bash
npm run genkit:dev
```
Inspector available at http://localhost:4000

</details>

### Method 3: Docker Setup 🐳

For containerized deployment:

<details>
<summary>Click to expand Docker setup instructions</summary>

#### 1. Set Up Environment

```bash
cp .env .env.local
# Add your GEMINI_API_KEY to .env.local
```

#### 2. Run with Docker Compose

```bash
docker-compose -f docker-compose_Version3.yml up
```

This starts:
- Backend: http://localhost:5000
- Frontend: http://localhost:3000 (Note: different port than local dev)

#### 3. Run in Background

```bash
docker-compose -f docker-compose_Version3.yml up -d
```

#### 4. Stop Services

```bash
docker-compose -f docker-compose_Version3.yml down
```

</details>

---

## 📚 Documentation

### Project Structure

```
AQVH-Project/
├── 📁 src/                          # Frontend source code
│   ├── 📁 app/                      # Next.js App Router pages
│   │   ├── api/                     # API routes
│   │   ├── login/                   # Authentication pages
│   │   ├── quantum/                 # Quantum-specific pages
│   │   └── page.tsx                 # Main dashboard page
│   ├── 📁 components/               # React components
│   │   ├── dashboard/               # Dashboard-specific components
│   │   ├── ui/                      # Reusable UI components (ShadCN)
│   │   └── providers/               # React Context Providers
│   ├── 📁 ai/                       # AI & Genkit integration
│   │   ├── flows/                   # AI flow definitions
│   │   ├── genkit.ts                # Genkit configuration
│   │   └── dev.ts                   # Development entry point
│   ├── 📁 data/                     # Mock/demo data
│   ├── 📁 hooks/                    # Custom React hooks
│   └── 📁 lib/                      # Utility functions & types
├── 📁 python-backend/               # Python Flask backend
│   ├── app.py                       # Main Flask application
│   ├── requirements.txt             # Python dependencies
│   └── environment.yml              # Conda environment file
├── 📁 public/                       # Static assets
├── 📄 .env                          # Environment template
├── 📄 .env.local                    # Local environment (gitignored)
├── 📄 package.json                  # Node.js dependencies
├── 📄 next.config.ts                # Next.js configuration
├── 📄 tailwind.config.ts            # Tailwind CSS configuration
├── 📄 tsconfig.json                 # TypeScript configuration
├── 📄 docker-compose_Version3.yml   # Docker Compose configuration
├── 📄 start-dev.sh                  # Linux/macOS startup script
├── 📄 start-dev.bat                 # Windows startup script
└── 📄 test-setup.sh                 # Setup verification script
```

### Available Scripts

#### Frontend Scripts

```bash
npm run dev          # Start development server on port 9002
npm run build        # Build for production
npm run start        # Start production server
npm run lint         # Run ESLint
npm run typecheck    # Run TypeScript type checking
npm run genkit:dev   # Start Genkit AI inspector (port 4000)
npm run genkit:watch # Start Genkit inspector with hot reload
```

#### Backend Commands

```bash
python app.py        # Start Flask backend (port 5000)
```

#### Testing & Verification

```bash
./test-setup.sh      # Verify complete setup
curl http://localhost:5000/health  # Check backend health
```

## 🔌 API Reference

### Backend Endpoints

The Python Flask backend provides the following REST API endpoints:

#### Health Check

Check the status of the backend service.

```http
GET /health
```

**Response:**
```json
{
  "status": "ok",
  "note": "Running in MOCK mode (Qiskit not installed). Replace with real Qiskit backend when ready."
}
```

**Status Codes:**
- `200 OK` - Service is healthy

---

#### Quantum Circuit Execution

Execute a quantum circuit simulation.

```http
POST /quantum
```

**Request Body:**
```json
{
  "n_qubits": 2,
  "shots": 1024
}
```

**Parameters:**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `n_qubits` | integer | No | 2 | Number of qubits (1-20) |
| `shots` | integer | No | 1024 | Number of measurement shots |

**Response:**
```json
{
  "source": "mock",
  "backend": "mock_simulator",
  "counts": {
    "00": 512,
    "11": 512
  }
}
```

**Status Codes:**
- `200 OK` - Circuit executed successfully
- `400 Bad Request` - Invalid parameters

**Example Usage:**

```bash
# Using curl
curl -X POST http://localhost:5000/quantum \
  -H "Content-Type: application/json" \
  -d '{"n_qubits": 3, "shots": 2048}'

# Using Python requests
import requests

response = requests.post(
    'http://localhost:5000/quantum',
    json={'n_qubits': 3, 'shots': 2048}
)
print(response.json())
```

**Notes:**
- Currently runs in MOCK mode with simulated results
- Ready for Qiskit integration (see [Backend Integration](#backend-integration))
- Results follow GHZ-like distribution for demonstration

---

## 🚨 Troubleshooting

### Common Issues and Solutions

<details>
<summary><strong>Port Conflicts</strong></summary>

**Problem:** Port 5000 or 9002 is already in use.

**Solution:**

For **port 5000** (Backend):
```bash
# Find process using port 5000
lsof -i :5000  # Linux/macOS
netstat -ano | findstr :5000  # Windows

# Kill the process or change port in python-backend/app.py:
# app.run(host="0.0.0.0", port=5001, debug=True)
```

For **port 9002** (Frontend):
```bash
# Change port in package.json:
# "dev": "next dev --turbopack -p 9003"
```

</details>

<details>
<summary><strong>Python Dependencies Issues</strong></summary>

**Problem:** Error installing Python dependencies.

**Solutions:**

1. **Upgrade pip:**
   ```bash
   pip install --upgrade pip
   ```

2. **Use virtual environment:**
   ```bash
   cd python-backend
   python -m venv venv
   source venv/bin/activate  # Linux/macOS
   venv\Scripts\activate     # Windows
   pip install -r requirements.txt
   ```

3. **Try conda:**
   ```bash
   conda env create -f python-backend/environment.yml
   conda activate quantum-backend
   ```

</details>

<details>
<summary><strong>AI Features Not Working</strong></summary>

**Problem:** Gemini AI features fail or don't respond.

**Solutions:**

1. **Check API key:**
   ```bash
   # Verify .env.local exists and contains:
   cat .env.local
   # Should show: GEMINI_API_KEY=your_key_here
   ```

2. **Verify key permissions:**
   - Go to [Google AI Studio](https://makersuite.google.com/app/apikey)
   - Ensure key is active and has necessary permissions

3. **Check console logs:**
   - Open browser DevTools (F12)
   - Look for error messages in the Console tab

4. **Restart development server:**
   ```bash
   # Stop the server (Ctrl+C) and restart:
   npm run dev
   ```

</details>

<details>
<summary><strong>Build Errors</strong></summary>

**Problem:** `npm run build` fails.

**Solutions:**

1. **Clear caches:**
   ```bash
   npm cache clean --force
   rm -rf node_modules package-lock.json
   npm install
   ```

2. **Check Node.js version:**
   ```bash
   node --version  # Should be v18.x or later
   nvm install 18  # If using nvm
   nvm use 18
   ```

3. **Check TypeScript errors:**
   ```bash
   npm run typecheck
   ```

</details>

<details>
<summary><strong>Docker Issues</strong></summary>

**Problem:** Docker Compose fails to start.

**Solutions:**

1. **Check Docker is running:**
   ```bash
   docker --version
   docker-compose --version
   ```

2. **Rebuild containers:**
   ```bash
   docker-compose -f docker-compose_Version3.yml down
   docker-compose -f docker-compose_Version3.yml build --no-cache
   docker-compose -f docker-compose_Version3.yml up
   ```

3. **Check logs:**
   ```bash
   docker-compose -f docker-compose_Version3.yml logs
   ```

</details>

---

---

## 🚀 Deployment

### Production Build

Build the application for production:

```bash
# Build frontend
npm run build

# Test production build locally
npm run start
```

### Deployment Platforms

#### Vercel (Recommended for Next.js)

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/lvs170603/AQVH-Project)

1. Push your code to GitHub
2. Import your repository on [Vercel](https://vercel.com)
3. Add environment variables:
   - `GEMINI_API_KEY`
   - `NEXTAUTH_SECRET`
4. Deploy!

#### Netlify

The project includes a `netlify.toml` configuration file.

1. Connect your repository to [Netlify](https://netlify.com)
2. Configure environment variables
3. Deploy automatically on push

#### Docker Deployment

For containerized production deployment:

```bash
# Build and run with Docker Compose
docker-compose -f docker-compose_Version3.yml up -d

# Or build individual images
docker build -t quantum-observer-frontend .
docker build -t quantum-observer-backend ./python-backend
```

#### Google Firebase App Hosting

The project includes an `apphosting.yaml` configuration file for Firebase App Hosting deployment.

### Backend Integration

To replace the mock backend with real Qiskit:

1. Install Qiskit in the Python backend:
   ```bash
   cd python-backend
   pip install qiskit qiskit-aer
   ```

2. Update `app.py` to use real Qiskit backends
3. Configure IBM Quantum credentials if needed

---

## 🤝 Contributing

We welcome contributions! Here's how you can help:

### Ways to Contribute

- 🐛 **Report bugs** - Open an issue describing the bug
- 💡 **Suggest features** - Share your ideas for improvements
- 📖 **Improve documentation** - Help make our docs better
- 🔧 **Submit pull requests** - Fix bugs or add features

### Development Workflow

1. **Fork the repository**
   ```bash
   # Click "Fork" on GitHub, then clone your fork
   git clone https://github.com/YOUR_USERNAME/AQVH-Project.git
   cd AQVH-Project
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes**
   - Write clean, documented code
   - Follow existing code style
   - Add tests if applicable

4. **Test your changes**
   ```bash
   npm run typecheck  # Check TypeScript
   npm run lint       # Check code style
   npm run build      # Test build
   ./test-setup.sh    # Verify setup
   ```

5. **Commit and push**
   ```bash
   git add .
   git commit -m "feat: add your feature description"
   git push origin feature/your-feature-name
   ```

6. **Open a Pull Request**
   - Go to the original repository
   - Click "New Pull Request"
   - Select your branch
   - Describe your changes

### Code Style

- **TypeScript:** Use TypeScript for all new code
- **Formatting:** Follow existing code style
- **Components:** Use functional components with hooks
- **Naming:** Use descriptive variable and function names
- **Comments:** Add comments for complex logic

### Commit Messages

Follow conventional commits format:

- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation changes
- `style:` Formatting, missing semicolons, etc.
- `refactor:` Code restructuring
- `test:` Adding tests
- `chore:` Maintenance tasks

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

### Technologies

- [Next.js](https://nextjs.org/) - React framework
- [Firebase Genkit](https://firebase.google.com/docs/genkit) - AI integration
- [ShadCN UI](https://ui.shadcn.com/) - Component library
- [Tailwind CSS](https://tailwindcss.com/) - CSS framework
- [Recharts](https://recharts.org/) - Charting library
- [Flask](https://flask.palletsprojects.com/) - Python web framework

### Inspiration

This project was built to demonstrate modern full-stack development practices with AI integration, providing a real-world example of quantum computing monitoring.

---

## 📬 Contact & Support

- **Issues:** [GitHub Issues](https://github.com/lvs170603/AQVH-Project/issues)
- **Discussions:** [GitHub Discussions](https://github.com/lvs170603/AQVH-Project/discussions)
- **Repository:** [lvs170603/AQVH-Project](https://github.com/lvs170603/AQVH-Project)

---

## 🗺️ Roadmap

### Current Features ✅

- Real-time job monitoring
- Backend health dashboard
- AI-powered anomaly detection
- Mock quantum simulation
- Responsive UI with dark mode

### Planned Features 🔮

- [ ] Real Qiskit backend integration
- [ ] User authentication and authorization
- [ ] Job history and analytics
- [ ] Custom quantum circuit builder
- [ ] Real-time WebSocket notifications
- [ ] Advanced filtering and search
- [ ] Export data to CSV/JSON
- [ ] Multi-backend comparison tools
- [ ] Performance optimization
- [ ] Comprehensive test coverage

---

<div align="center">

**[⬆ Back to Top](#-quantum-observer)**

Made with ❤️ by the Quantum Observer Team

**Star this repo ⭐ if you find it helpful!**

</div>
