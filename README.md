# Quantum Observer

Quantum Observer is a real-time monitoring dashboard for quantum computing jobs and backend systems, built with Next.js, ShadCN UI, and Genkit. It provides a comprehensive view of job statuses, backend health, and performance metrics, along with AI-powered anomaly detection.

> 🚀 **New to this project?** Check out our [Quick Start Guide](QUICKSTART.md) for the fastest way to get up and running!

## Features

- **Real-time Job Tracking:** Monitor the status of all quantum jobs (Queued, Running, Completed, Error, Cancelled).
- **Backend Health Dashboard:** View the status, queue depth, and error rates of all available quantum backends.
- **Performance KPIs:** Key metrics at a glance, including live job counts, average wait times, and success rates.
- **Historical Analysis:** Visualize job status trends over time with an interactive chart.
- **AI-Powered Anomaly Detection:** Use Genkit to analyze job data and flag unusual behavior or potential system issues.
- **Responsive Design:** A clean and intuitive interface that works seamlessly across desktop and mobile devices.
- **Light & Dark Mode:** Switch between themes for your viewing comfort.

## Tech Stack

- **Framework:** [Next.js](https://nextjs.org/) (App Router)
- **AI Integration:** [Firebase Genkit](https://firebase.google.com/docs/genkit)
- **UI:** [React](https://react.dev/) with [TypeScript](https://www.typescriptlang.org/)
- **Styling:** [Tailwind CSS](https://tailwindcss.com/)
- **Components:** [ShadCN UI](https://ui.shadcn.com/)
- **Charts:** [Recharts](https://recharts.org/)
- **Icons:** [Lucide React](https://lucide.dev/guide/packages/lucide-react)

## Getting Started

To run the Quantum Observer application on your local machine, you can choose between two setup methods:

### Prerequisites

- [Node.js](https://nodejs.org/) (v18 or later recommended)
- [npm](https://www.npmjs.com/) (or another package manager like yarn or pnpm)
- [Python](https://python.org/) (3.8 or later recommended)
- [Docker](https://docker.com/) (optional, for containerized setup)

## Method 1: Local Development Setup

### Option A: Quick Start (Recommended)

For the easiest setup, use the provided startup scripts:

**Linux/macOS:**
```bash
./start-dev.sh
```

**Windows:**
```batch
start-dev.bat
```

These scripts will automatically:
- Check and install dependencies
- Set up the Python virtual environment
- Start both backend and frontend servers
- Provide helpful status messages

### Option B: Manual Setup

If you prefer to set up manually or need more control:

### 1. Clone the Repository

First, clone the project repository to your local machine:

```bash
git clone https://github.com/lvs170603/AQVH-Project.git
cd AQVH-Project
```

### 2. Set Up Environment Variables

For the AI features to work, you will need a Google AI API key.

1.  Create a copy of the `.env` file and name it `.env.local`:
    ```bash
    cp .env .env.local
    ```
2.  Open the `.env.local` file and add your Gemini API key:
    ```
    GEMINI_API_KEY=your_api_key_here
    ```

### 3. Install Frontend Dependencies

Install the necessary Node.js project dependencies:

```bash
npm install
```

### 4. Set Up Python Backend

1. Navigate to the Python backend directory:
   ```bash
   cd python-backend
   ```

2. Create a virtual environment (recommended):
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. Install Python dependencies:
   ```bash
   pip install -r requirements.txt
   ```

### 5. Start the Services

You need to run both the Python backend and the Next.js frontend:

#### Start the Python Backend (Terminal 1):
```bash
cd python-backend
python app.py
```

The backend will be available at `http://localhost:5000`.

#### Start the Next.js Frontend (Terminal 2):
```bash
# From the project root directory
npm run dev
```

The frontend application will be available at `http://localhost:9002`.

### 6. Verify Setup

1. Check the backend health endpoint:
   ```bash
   curl http://localhost:5000/health
   ```
   
2. Open your browser and navigate to `http://localhost:9002` to see the Quantum Observer dashboard.

### 7. Run the Genkit Inspector (Optional)

To inspect and debug your Genkit flows, you can run the Genkit Inspector in a separate terminal:

```bash
npm run genkit:dev
```

This will start the inspector, which is typically available at `http://localhost:4000`.

## Method 2: Docker Setup

For a containerized setup, you can use Docker Compose:

### 1. Set Up Environment Variables

Set up your environment variables as described in Method 1, step 2.

### 2. Run with Docker Compose

```bash
docker-compose -f docker-compose_Version3.yml up
```

This will start both the backend and frontend services:
- Backend: `http://localhost:5000`
- Frontend: `http://localhost:3000` (Note: different port than local development)

## Troubleshooting

### Port Conflicts

If you encounter port conflicts:
- **Port 5000 (Backend)**: Another service might be using port 5000. Kill the conflicting process or modify the port in `python-backend/app.py`.
- **Port 9002 (Frontend)**: Modify the port in `package.json` under the "dev" script.

### Python Dependencies Issues

If you encounter issues installing Python dependencies:
1. Make sure you're using a virtual environment
2. Try using conda instead of pip:
   ```bash
   conda env create -f python-backend/environment.yml
   conda activate quantum-backend
   ```

### AI Features Not Working

If AI features aren't working:
1. Ensure your `GEMINI_API_KEY` is correctly set in `.env.local`
2. Check that the key has the necessary permissions for Google AI services

### Build Errors

If you encounter build errors:
1. Clear npm cache: `npm cache clean --force`
2. Delete node_modules and reinstall: `rm -rf node_modules && npm install`
3. Check Node.js version: `node --version` (should be v18+)

## API Documentation

The Python backend provides the following endpoints:

### Health Check
```http
GET /health
```

Returns the status of the backend service.

**Response:**
```json
{
  "status": "ok",
  "note": "Running in MOCK mode (Qiskit not installed). Replace with real Qiskit backend when ready."
}
```

### Quantum Circuit Execution
```http
POST /quantum
```

Executes a quantum circuit simulation.

**Request Body:**
```json
{
  "n_qubits": 2,
  "shots": 1024
}
```

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

## Development

### Project Scripts

- `npm run dev` - Start Next.js development server on port 9002
- `npm run build` - Build the production application
- `npm run start` - Start production server
- `npm run typecheck` - Run TypeScript type checking
- `npm run genkit:dev` - Start Genkit AI inspector on port 4000
- `npm run genkit:watch` - Start Genkit inspector with file watching

### Environment Variables

Create a `.env.local` file with the following variables:

```env
GEMINI_API_KEY=your_google_ai_api_key_here
NEXTAUTH_SECRET=your_nextauth_secret_here
```

### Testing Your Setup

To verify that everything is set up correctly, run the test script:

```bash
./test-setup.sh
```

This script will check:
- Node.js and Python installations
- Dependencies installation status
- TypeScript compilation
- Next.js build process
- Environment configuration files

## Project Structure

The project follows a standard Next.js App Router structure, with clear separation of concerns to enhance maintainability and scalability.

```
quantum-observer/
├── public/                     # Static assets (images, icons, etc.)
├── src/
│   ├── app/                    # Next.js App Router (pages & layouts)
│   ├── components/             # Reusable React components
│   │   ├── dashboard/          # Dashboard-specific components
│   │   ├── ui/                 # ShadCN UI components
│   │   └── providers/          # React Context Providers
│   ├── ai/                     # Genkit AI logic
│   │   ├── flows/              # AI pipelines (anomaly detection, etc.)
│   │   └── genkit.ts           # Genkit initialization
│   ├── data/                   # Mock/demo data
│   ├── hooks/                  # Custom React hooks
│   └── lib/                    # Utility functions & types
├── .env                        # Environment variable template
├── next.config.ts              # Next.js configuration
├── tailwind.config.ts          # Tailwind CSS configuration
├── tsconfig.json               # TypeScript configuration
└── package.json
```
