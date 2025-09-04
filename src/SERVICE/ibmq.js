const apiKey = process.env.IBM_QUANTUM_API_KEY;

// Example: using fetch to call IBM Quantum API
async function getQuantumJobs() {
  const response = await fetch('https://quantum-computing.ibm.com/api/jobs', {
    headers: {
      'Authorization': `Bearer ${7uB1rS41OFhMS_7U9HUwE1bD7ApCAvuNoXC1CpufFL1R}`,
    },
  });
  return await response.json();
}

export { getQuantumJobs };
