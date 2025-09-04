const apiKey = process.env.IBM_QUANTUM_API_KEY;

// Example: using fetch to call IBM Quantum API
async function getQuantumJobs() {
  const response = await fetch('https://quantum-computing.ibm.com/api/jobs', {
    headers: {
      'Authorization': `Bearer ${apiKey}`,
    },
  });
  return await response.json();
}

export { getQuantumJobs };
