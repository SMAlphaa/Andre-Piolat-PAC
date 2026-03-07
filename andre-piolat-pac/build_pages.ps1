$pages = @(
    "programs.html|Programs / Events|Programmes / Événements",
    "after-school.html|After school programs|Programmes parascolaires",
    "hot-lunch.html|Hot lunch|Repas chaud",
    "school-events.html|School events|Événements scolaires",
    "past-events.html|Past school events|Événements scolaires passés",
    "renovation-2026.html|Renovation 2026|Rénovation 2026",
    "about.html|About PAC|À propos de l’APÉ",
    "meeting-schedule.html|Meeting schedule|Calendrier des réunions",
    "minutes.html|Minutes of meetings|Procès-verbaux des réunions",
    "who-we-are.html|Who we are|Qui sommes-nous",
    "get-involved.html|Get involved|Impliquez-vous",
    "fundraisers.html|Fundraisers|Levées de fonds",
    "resources.html|General info / Resources|Informations générales / Ressources",
    "calendar.html|School calendar / Schedule|Calendrier scolaire / Horaire",
    "procedures.html|Procedures|Procédures",
    "contact.html|Contact Us|Contactez-nous"
)

$indexContent = Get-Content -Raw -Encoding UTF8 index.html

$splitToken1 = "<!-- Hero Banner (Home) -->"
$splitToken2 = "<!-- Footer Area -->"

$headerPart = $indexContent.Substring(0, $indexContent.IndexOf($splitToken1))
$footerPartIndex = $indexContent.IndexOf($splitToken2)
$footerPart = $indexContent.Substring($footerPartIndex)

foreach ($p in $pages) {
    $parts = $p.Split('|')
    $fileName = $parts[0]
    $enTerm = $parts[1]
    $frTerm = $parts[2]

    $imgHtml = ""
    if ($fileName -eq "get-involved.html") {
        $imgHtml = "<img src=`"img/get-involved.jpg`" alt=`"Get Involved`" style=`"width: 100%; display: block; object-fit: cover; max-height: 500px; border-radius: 8px;`">"
    } elseif ($fileName -eq "school-events.html") {
        $imgHtml = "<img src=`"img/events-1.jpg`" alt=`"School Events`" style=`"width: 100%; display: block; object-fit: cover; max-height: 500px; border-radius: 8px;`">"
    } elseif ($fileName -eq "past-events.html") {
        $imgHtml = "<img src=`"img/events-2.jpg`" alt=`"Past Events`" style=`"width: 100%; display: block; object-fit: cover; max-height: 500px; border-radius: 8px;`">"
    } elseif ($fileName -eq "renovation-2026.html") {
        $imgHtml = "<img src=`"img/renovation.jpg`" alt=`"Renovation 2026`" style=`"width: 100%; display: block; object-fit: cover; max-height: 500px; border-radius: 8px;`">"
    } else {
        $imgHtml = @"
                 <div class=`"placeholder-img`" style=`"min-height: 400px;`">
                    <span class=`"lang-en`">[Input Image/Text for $enTerm here]</span>
                    <span class=`"lang-fr`">[Saisir une image/texte pour $frTerm ici]</span>
                 </div>
"@
    }

    $loremIpsum = @"
            <div style=`"margin-top: 2rem; line-height: 1.8; color: var(--text-dark);`">
                <p class=`"lang-en`">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                <p class=`"lang-fr`">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            </div>
"@

    $content = "$headerPart

    <!-- Page Content -->
    <section class=`"section`">
        <div class=`"container`">
            <h2 class=`"section-title`">
                <span class=`"lang-en`">$enTerm</span>
                <span class=`"lang-fr`">$frTerm</span>
            </h2>
            <div style=`"margin-top: 2rem; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 15px rgba(0,0,0,0.1);`">
$imgHtml
            </div>
$loremIpsum
        </div>
    </section>

$footerPart"

    Set-Content -Path $fileName -Value $content -Encoding UTF8
    Write-Host "Created $fileName"
}
