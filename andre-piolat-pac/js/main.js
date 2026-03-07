document.addEventListener('DOMContentLoaded', () => {

    // Mobile Menu Toggle Feature
    const mobileMenuBtn = document.getElementById('mobileMenuBtn');
    const mainNav = document.getElementById('mainNav');

    if (mobileMenuBtn && mainNav) {
        mobileMenuBtn.addEventListener('click', () => {
            mainNav.classList.toggle('nav-open');
        });
    }

    // Language Toggle Feature
    const langBtn = document.getElementById('langToggle');
    if (langBtn) {
        let currentLang = 'en';

        // Use try/catch because localStorage might be blocked on file:// protocols
        try {
            currentLang = localStorage.getItem('siteLang') || 'en';
        } catch (e) {
            console.warn('localStorage access denied, defaulting to English.');
        }

        if (currentLang === 'fr') {
            document.body.classList.add('fr-active');
            langBtn.textContent = 'En / Fr';
        } else {
            document.body.classList.remove('fr-active');
            langBtn.textContent = 'Fr / En';
        }

        langBtn.addEventListener('click', () => {
            const isFr = document.body.classList.contains('fr-active');

            if (isFr) {
                // Switch to English
                document.body.classList.remove('fr-active');
                langBtn.textContent = 'Fr / En';
                try { localStorage.setItem('siteLang', 'en'); } catch (e) { }
            } else {
                // Switch to French
                document.body.classList.add('fr-active');
                langBtn.textContent = 'En / Fr';
                try { localStorage.setItem('siteLang', 'fr'); } catch (e) { }
            }
        });
    }

});
