<reference lib="dom" />
import { AppRegistry } from "react-native";
import App from './App';


AppRegistry.registerComponent('Soundwave', () => App);
AppRegistry.runApplication('Soundwave', {rootTag: document.getElementById('root'), initialProps: {}, });