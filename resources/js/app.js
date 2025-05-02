import './bootstrap';
import '../css/app.css';
import Alpine from 'alpinejs';
window.Alpine = Alpine;
Alpine.start();
document.addEventListener('alpine:init', () => {
    Alpine.store('darkMode', false);
});