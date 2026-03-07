const fs = require('fs');

const pages = [
    { file: 'programs.html', en: 'Programs / Events', fr: 'Programmes / Événements' },
    { file: 'after-school.html', en: 'After school programs', fr: 'Programmes parascolaires' },
    { file: 'hot-lunch.html', en: 'Hot lunch', fr: 'Repas chaud' },
    { file: 'school-events.html', en: 'School events', fr: 'Événements scolaires' },
    { file: 'past-events.html', en: 'Past school events', fr: 'Événements scolaires passés' },
    { file: 'renovation-2026.html', en: 'Renovation 2026', fr: 'Rénovation 2026' },
    { file: 'about.html', en: 'About PAC', fr: 'À propos de l’APÉ' },
    { file: 'meeting-schedule.html', en: 'Meeting schedule', fr: 'Calendrier des réunions' },
    { file: 'minutes.html', en: 'Minutes of meetings', fr: 'Procès-verbaux des réunions' },
    { file: 'who-we-are.html', en: 'Who we are', fr: 'Qui sommes-nous' },
    { file: 'get-involved.html', en: 'Get involved', fr: 'Impliquez-vous' },
    { file: 'fundraisers.html', en: 'Fundraisers', fr: 'Levées de fonds' },
    { file: 'resources.html', en: 'General info / Resources', fr: 'Informations générales / Ressources' },
    { file: 'calendar.html', en: 'School calendar / Schedule', fr: 'Calendrier scolaire / Horaire' },
    { file: 'procedures.html', en: 'Procedures', fr: 'Procédures' },
    { file: 'contact.html', en: 'Contact Us', fr: 'Contactez-nous' }
];

const indexContent = fs.readFileSync('index.html', 'utf8');

// The header ends right before <!-- Hero Banner
const headerPart = indexContent.split('<!-- Hero Banner (Home) -->')[0];

const footerPartMatch = indexContent.split('<!-- Footer Area -->');
const footerPart = '<!-- Footer Area -->' + footerPartMatch[1];

pages.forEach(p => {
    const content = `${headerPart}

    <!-- Page Content -->
    <section class="section">
        <div class="container">
            <h2 class="section-title">
                <span class="lang-en">${p.en}</span>
                <span class="lang-fr">${p.fr}</span>
            </h2>
            <div style="margin-top: 2rem;">
                 <div class="placeholder-img" style="min-height: 400px;">
                    <span class="lang-en">[Input Image/Text for ${p.en} here]</span>
                    <span class="lang-fr">[Saisir une image/texte pour ${p.fr} ici]</span>
                 </div>
            </div>
        </div>
    </section>

${footerPart}`;

    fs.writeFileSync(p.file, content);
    console.log(`Created ${p.file}`);
});
