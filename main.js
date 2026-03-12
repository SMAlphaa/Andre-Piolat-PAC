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
    const langBtns = document.querySelectorAll('.lang-switch-btn');
    if (langBtns.length > 0) {
        let currentLang = 'en';

        // Use try/catch because localStorage might be blocked on file:// protocols or some GitHub Pages configurations
        try {
            currentLang = localStorage.getItem('siteLang') || 'en';
        } catch (e) {
            console.warn('localStorage access denied, defaulting to English.');
        }

        const applyLanguage = (lang) => {
            if (lang === 'fr') {
                document.body.classList.add('fr-active');
                langBtns.forEach(btn => btn.textContent = 'En / Fr');
            } else {
                document.body.classList.remove('fr-active');
                langBtns.forEach(btn => btn.textContent = 'Fr / En');
            }
        };

        // Apply on load
        applyLanguage(currentLang);

        // Click handler
        langBtns.forEach(btn => {
            btn.addEventListener('click', (e) => {
                e.preventDefault(); // Prevent any default button behavior that might cause issues

                const isFr = document.body.classList.contains('fr-active');
                const newLang = isFr ? 'en' : 'fr';

                applyLanguage(newLang);

                try {
                    localStorage.setItem('siteLang', newLang);
                } catch (err) {
                    console.warn('Could not save language preference to localStorage');
                }
            });
        });
    }

});
