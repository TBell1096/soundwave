import React, { useEffect, useState } from 'react';
import { Platform, SafeAreaView, Text } from 'react-native';

const API = Platform.OS === 'web' ? 'http://localhost:8080' : 'http://10.0.2.2:8080';

export default function App() {
    const [status, setStatus] = useState('checking...');

    useEffect(() => {
        fetch(`${API}/api/health`)
            .then(r => r.json())
            .then(d => setStatus(`Backend: ${d.status}`))
            .catch(e => setStatus(`Error: ${e.message}`));
    }, []);

    return (
        <SafeAreaView style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
            <Text style={{ fontSize: 22 }}>{status}</Text>
        </SafeAreaView>
    );
}