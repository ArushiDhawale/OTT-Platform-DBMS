import React, { useState } from 'react';
import axios from 'axios';

function App() {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [message, setMessage] = useState('');

  const handleLogin = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post('http://localhost:8000/login', {
        username,
        password
      });
      setMessage(response.data.message);
      // Redirect to dashboard logic here
    } catch (error) {
      setMessage("Login Failed: Check your username/password");
    }
  };

  return (
    <div className="flex h-screen items-center justify-center bg-gray-900 text-white">
      <form onSubmit={handleLogin} className="bg-gray-800 p-8 rounded-lg shadow-xl w-96">
        <h2 className="text-3xl font-bold mb-6 text-red-600">OTT Login</h2>
        <input 
          type="text" placeholder="Username" 
          className="w-full p-2 mb-4 bg-gray-700 rounded border border-gray-600"
          onChange={(e) => setUsername(e.target.value)}
        />
        <input 
          type="password" placeholder="Password" 
          className="w-full p-2 mb-6 bg-gray-700 rounded border border-gray-600"
          onChange={(e) => setPassword(e.target.value)}
        />
        <button type="submit" className="w-full bg-red-600 p-2 rounded font-bold hover:bg-red-700">
          Sign In
        </button>
        {message && <p className="mt-4 text-center text-sm">{message}</p>}
      </form>
    </div>
  );
}

export default App;