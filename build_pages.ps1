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
        $imgHtml = "<img src=`"https://images.unsplash.com/photo-1577896851231-70ef18881754?auto=format&fit=crop&w=1200&q=80`" alt=`"$enTerm`" style=`"width: 100%; display: block; object-fit: cover; max-height: 500px; border-radius: 8px;`">"
    }

    $loremIpsum = @"
                <div style=`"flex: 1; min-width: 300px; line-height: 1.8; color: var(--text-dark);`">
                    <p class=`"lang-en`" style=`"margin-bottom: 1rem; font-size: 1.1rem;`">
                        This is the English placeholder text for <strong>$enTerm</strong>. It replaces the previous generic Latin dummy text so you can clearly see the translation working when you toggle the languages!
                    </p>
                    <p class=`"lang-en`" style=`"margin-bottom: 1rem;`">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non nisi est sit amet facilisis magna etiam. Dictum at tempor commodo ullamcorper a lacus vestibulum. Magna fringilla urna porttitor rhoncus dolor purus non.
                    </p>
                    
                    <p class=`"lang-fr`" style=`"margin-bottom: 1rem; font-size: 1.1rem;`">
                        Ceci est le texte de remplacement en français pour <strong>$frTerm</strong>. Il remplace l'ancien texte factice générique en latin afin que vous puissiez clairement voir la traduction fonctionner lorsque vous basculez les langues!
                    </p>
                    <p class=`"lang-fr`" style=`"margin-bottom: 1rem;`">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non nisi est sit amet facilisis magna etiam. Dictum at tempor commodo ullamcorper a lacus vestibulum. Magna fringilla urna porttitor rhoncus dolor purus non.
                    </p>
                </div>
"@

    $galleryHtml = @"
    <!-- Image Gallery -->
    <section class=`"section section-alt`" style=`"background-color: #f8fafc; padding: 4rem 0;`">
        <div class=`"container`">
            <h3 style=`"text-align: center; color: var(--primary-color); margin-bottom: 2rem; font-size: 2rem; position: relative; padding-bottom: 1rem;`">
                <span class=`"lang-en`">Highlights & Memories</span>
                <span class=`"lang-fr`">Faits Saillants et Souvenirs</span>
            </h3>
            <div style=`"display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 1.5rem; margin-top: 2rem;`">
                <div style=`"border-radius: 12px; overflow: hidden; height: 250px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);`">
                    <img src=`"https://images.unsplash.com/photo-1543269865-cbf427effbad?auto=format&fit=crop&w=800&q=80`" alt=`"Gallery`" style=`"width: 100%; height: 100%; object-fit: cover; transition: transform 0.3s;`" onmouseover=`"this.style.transform='scale(1.05)'`" onmouseout=`"this.style.transform='scale(1)'`">
                </div>
                <div style=`"border-radius: 12px; overflow: hidden; height: 250px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);`">
                    <img src=`"https://images.unsplash.com/photo-1509062522246-3755977927d7?auto=format&fit=crop&w=800&q=80`" alt=`"Gallery`" style=`"width: 100%; height: 100%; object-fit: cover; transition: transform 0.3s;`" onmouseover=`"this.style.transform='scale(1.05)'`" onmouseout=`"this.style.transform='scale(1)'`">
                </div>
                <div style=`"border-radius: 12px; overflow: hidden; height: 250px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);`">
                    <img src=`"https://images.unsplash.com/photo-1529390079861-591de354faf5?auto=format&fit=crop&w=800&q=80`" alt=`"Gallery`" style=`"width: 100%; height: 100%; object-fit: cover; transition: transform 0.3s;`" onmouseover=`"this.style.transform='scale(1.05)'`" onmouseout=`"this.style.transform='scale(1)'`">
                </div>
            </div>
        </div>
    </section>
"@

    $content = "$headerPart

    <!-- Page Content -->
    <section class=`"section`">
        <div class=`"container`">
            <h2 class=`"section-title`">
                <span class=`"lang-en`">$enTerm</span>
                <span class=`"lang-fr`">$frTerm</span>
            </h2>
            <div style=`"display: flex; gap: 3rem; flex-wrap: wrap; align-items: center; margin-top: 2rem; margin-bottom: 2rem;`">
                <div style=`"flex: 1; min-width: 300px; border-radius: 12px; overflow: hidden; box-shadow: 0 10px 30px rgba(0,0,0,0.15); border: 4px solid var(--white);`">
$imgHtml
                </div>
$loremIpsum
            </div>
        </div>
    </section>

$galleryHtml

$footerPart"

    Set-Content -Path $fileName -Value $content -Encoding UTF8
    Write-Host "Created $fileName"
}
