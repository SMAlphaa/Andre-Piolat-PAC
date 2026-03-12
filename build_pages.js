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
            <div style="display: flex; gap: 3rem; flex-wrap: wrap; align-items: center; margin-top: 2rem;">
                <div style="flex: 1; min-width: 300px; border-radius: 12px; overflow: hidden; box-shadow: 0 10px 30px rgba(0,0,0,0.15);">
                    <img src="https://images.unsplash.com/photo-1577896851231-70ef18881754?auto=format&fit=crop&w=1200&q=80" alt="${p.en}" style="width: 100%; display: block; object-fit: cover; max-height: 500px; border-radius: 8px;">
                </div>
                <div style="flex: 1; min-width: 300px; line-height: 1.8; color: var(--text-dark);">
                    <p class="lang-en" style="margin-bottom: 1rem; font-size: 1.1rem;">
                        This is the English placeholder text for <strong>${p.en}</strong>. It replaces the previous generic Latin dummy text so you can clearly see the translation working when you toggle the languages!
                    </p>
                    <p class="lang-en" style="margin-bottom: 1rem;">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non nisi est sit amet facilisis magna etiam. Dictum at tempor commodo ullamcorper a lacus vestibulum. Magna fringilla urna porttitor rhoncus dolor purus non.
                    </p>
                    
                    <p class="lang-fr" style="margin-bottom: 1rem; font-size: 1.1rem;">
                        Ceci est le texte de remplacement en français pour <strong>${p.fr}</strong>. Il remplace l'ancien texte factice générique en latin afin que vous puissiez clairement voir la traduction fonctionner lorsque vous basculez les langues!
                    </p>
                    <p class="lang-fr" style="margin-bottom: 1rem;">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non nisi est sit amet facilisis magna etiam. Dictum at tempor commodo ullamcorper a lacus vestibulum. Magna fringilla urna porttitor rhoncus dolor purus non.
                    </p>
                </div>
            </div>
        </div>
    </section>

${footerPart}`;

    fs.writeFileSync(p.file, content);
    console.log(`Created ${p.file}`);
});
