import { defineConfig } from "vite";
import react from '@vitejs/plugin-react';

export default defineConfig({
    plugins: [react()],
    define: {__DEV__: JSON.stringify(true)},
    resolve: {
        alias: { 'react-native': 'react-native-web' },
        extensions: ['.web.tsx', '.web.ts', '.tsx', '.ts', '.web.js', '.js'],
    },
});

