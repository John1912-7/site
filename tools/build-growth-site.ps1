$ErrorActionPreference = 'Stop'

$siteUrl = 'https://john1912-7.github.io/site'
$today = '2026-06-23'
$rssDate = 'Tue, 23 Jun 2026 12:00:00 +0400'
$out = Join-Path (Get-Location) 'site-growth-update'
$postsOut = Join-Path $out 'posts'
New-Item -ItemType Directory -Force -Path $postsOut | Out-Null

$posts = @(
  @{ slug='shuny-qashum-e-kapy'; title='Ինչ անել, եթե շունը քաշում է կապը զբոսանքի ժամանակ'; cat='զբոսանք'; summary='Ինչու է շունը շտապում առաջ և ինչպես սովորեցնել հանգիստ քայլել թուլացած կապով։'; old=$true },
  @{ slug='shan-dzagy-kcum-e-dzerqery'; title='Ինչ անել, եթե շան ձագը կծում է ձեռքերը'; cat='ձագերի վարժեցում'; summary='Ինչու են ձագերը կծում ձեռքերը և ինչպես փոխարինել այդ վարքը անվտանգ խաղալիքով։'; old=$true },
  @{ slug='shuny-chcatkel-mardkanc-vra'; title='Ինչպես սովորեցնել շանը չցատկել մարդկանց վրա'; cat='վարքագիծ'; summary='Ինչպես սովորեցնել շանը հանգիստ ողջունել հյուրերին և անցորդներին։'; old=$true },
  @{ slug='sovorecnel-shany-ari-hramany'; title='Ինչպես սովորեցնել շանը «արի» հրամանը'; cat='կանչ'; summary='Վստահ կանչի քայլեր՝ տանը, բակում և շեղումների պայմաններում։'; old=$true },
  @{ slug='inchu-e-shuny-hachum'; title='Ինչու է շունը հաչում և ինչ անել'; cat='վարքագիծ'; summary='Ինչպես հասկանալ հաչոցի պատճառը և նվազեցնել այն հանգիստ մեթոդներով։'; old=$true },
  @{ slug='inchpes-sovorecnel-shany-nstel'; title='Ինչպես սովորեցնել շանը «նստիր» հրամանը'; cat='հնազանդություն'; summary='Պարզ քայլեր՝ ինչպես սովորեցնել շանը նստել հրամանով, առանց ճնշման և ավելորդ կրկնությունների։'; why='«Նստիր» հրամանը օգնում է շանը կանգ առնել, կենտրոնանալ և սպասել։ Այն հարմար է տանը, դռան մոտ, հյուրերի ժամանակ և զբոսանքի ընթացքում։'; steps=@('Պարգևը պահեք շան քթի մոտ և դանդաղ բարձրացրեք դեպի գլխի վերևը։','Նստելու պահին ասեք «նստիր», գովեք և տվեք պարգևը։','Կրկնեք կարճ սեանսներով՝ հետո ավելացնելով դուռ, բակ և փողոց։') },
  @{ slug='shuny-chi-lsum-inch-anel'; title='Ինչ անել, եթե շունը չի լսում տիրոջը'; cat='հնազանդություն'; summary='Ինչու է շունը անտեսում հրամանները և ինչպես վերականգնել ուշադրությունը հանգիստ վարժանքներով։'; why='Շունը հաճախ չի լսում, երբ հրամանը դեռ բավարար արժեք չունի կամ միջավայրը չափազանց շեղող է։ Պետք է սկսել այնտեղից, որտեղ շունը կարող է հաջողվել։'; steps=@('Օրվա ընթացքում մի քանի անգամ կանչեք շան անունը և պարգևատրեք հայացքը։','Հրամանները պահեք կարճ, նույն բառով և նույն ժեստով։','Եթե շունը չի արձագանքում, նվազեցրեք շեղումները, ոչ թե բարձրացրեք ձայնը։') },
  @{ slug='shuny-vakhenum-e-dursum'; title='Ինչ անել, եթե շունը վախենում է դրսում'; cat='վարքագիծ'; summary='Ինչպես օգնել վախեցող շանը փողոցում, ձայների, մարդկանց և մեքենաների մոտ ավելի հանգիստ զգալ։'; why='Վախեցող շունը չի փորձում վատ պահել իրեն․ նրա համար միջավայրը դժվար է։ Ճնշումը կարող է վախը ուժեղացնել, իսկ ճիշտ հեռավորությունը օգնում է սովորել։'; steps=@('Ընտրեք հանգիստ երթուղի և կարճ զբոսանքներ։','Պարգևատրեք, երբ շունը տեսնում է շեղումը և նորից նայում է ձեզ։','Մի ստիպեք մոտենալ վախեցնող մարդուն, մեքենային կամ ձայնին։') },
  @{ slug='shuny-menak-mnalis-hachum-e'; title='Ինչ անել, եթե շունը մենակ մնալիս հաչում է'; cat='վարքագիծ'; summary='Մենակ մնալու վարժանքներ՝ ինչպես նվազեցնել հաչոցը, անհանգստությունը և դռան մոտ լարվածությունը։'; why='Մենակ մնալիս հաչոցը կարող է լինել ձանձրույթ կամ անհանգստություն։ Խնդիրը լուծվում է փոքր բացակայություններով, ոչ թե վերադարձից հետո պատժելով։'; steps=@('Սկսեք 10-30 վայրկյան բացակայությունից և վերադարձեք մինչ լարումը կաճի։','Դուրս գալուց առաջ պահեք հանգիստ ռեժիմ և թողեք անվտանգ զբաղմունք։','Ժամանակը ավելացրեք միայն այն ժամանակ, երբ շունը հանգիստ է մնում։') },
  @{ slug='shan-dzagi-khnamq-arajin-orer'; title='Շան ձագի խնամք առաջին օրերին տանը'; cat='ձագերի վարժեցում'; summary='Ինչ պատրաստել շան ձագի համար, ինչպես կազմակերպել քունը, սնունդը, զուգարանը և առաջին կանոնները։'; why='Առաջին օրերը ձևավորում են ձագի վստահությունը և տան կանոնները։ Պարզ միջավայրը օգնում է նրան արագ հանգստանալ։'; steps=@('Սկզբում թույլ տվեք ուսումնասիրել մեկ-երկու սենյակ, ոչ ամբողջ տունը։','Քնից, ուտելուց և խաղից հետո տարեք զուգարանի նույն տեղը։','Կարճ խաղից հետո տվեք հանգիստ անկյուն, որովհետև հոգնած ձագը հաճախ սկսում է կծել։') },
  @{ slug='shan-patvastumner-hayastanum'; title='Շան պատվաստումներ Հայաստանում․ ինչ պետք է իմանալ'; cat='առողջություն'; summary='Ընդհանուր ուղեցույց պատվաստումների, անասնաբույժի այցերի և անվտանգ զբոսանքի մասին Հայաստանում։'; why='Պատվաստումները շան առողջության և անվտանգ շփման կարևոր մասն են։ Այս նյութը ընդհանուր տեղեկություն է, իսկ կոնկրետ գրաֆիկը պետք է որոշի անասնաբույժը։'; steps=@('Պահեք պատվաստումների գրքույկը և հարցրեք հաջորդ այցի օրը։','Մինչ լիարժեք պաշտպանությունը խուսափեք անծանոթ կենդանիների հետ վտանգավոր շփումից։','Վատ ինքնազգացողության, փսխման կամ թուլության դեպքում կապվեք անասնաբույժի հետ։') },
  @{ slug='shuny-che-utum-inch-anel'; title='Ինչ անել, եթե շունը չի ուտում'; cat='առողջություն'; summary='Ինչ պատճառներով շունը կարող է հրաժարվել ուտելուց, երբ հետևել տանը և երբ դիմել անասնաբույժի։'; why='Ախորժակի կորուստը կարող է լինել շոգից, սթրեսից կամ սննդի փոփոխությունից, բայց երբեմն առողջական խնդիր է։ Կարևոր է նայել ընդհանուր վիճակին։'; steps=@('Ստուգեք՝ շունը ջուր խմում է, ակտիվ է, կա՞ փսխում կամ լուծ։','Մի փոխեք սնունդը ամեն ժամ և մի ստիպեք ուտել։','Եթե շունը վատ է զգում, ձագ է կամ չի ուտում մեկ օրից ավելի, զանգեք անասնաբույժին։') },
  @{ slug='shuny-krcum-e-kahuyqy'; title='Ինչ անել, եթե շունը կրծում է կահույքը'; cat='վարքագիծ'; summary='Ինչու է շունը կրծում կահույքը, ինչպես տալ անվտանգ այլընտրանք և նվազեցնել ձանձրույթը տանը։'; why='Կահույք կրծելը հաճախ ձանձրույթի, ատամների փոփոխության կամ անհանգստության նշան է։ Շանը պետք է տալ թույլատրելի կրծելու տարբերակ։'; steps=@('Հեռացրեք վտանգավոր իրերը և սահմանափակեք տարածքը, երբ չեք հետևում։','Տվեք անվտանգ կրծելու խաղալիք և գովեք ճիշտ ընտրությունը։','Ավելացրեք քթի աշխատանք, կարճ վարժանքներ և հանգիստ զբոսանք։') },
  @{ slug='shuny-vazum-e-mardkanc-koghm'; title='Ինչ անել, եթե շունը վազում է մարդկանց կողմը'; cat='կանչ'; summary='Ինչպես սովորեցնել շանը չվազել մարդկանց, երեխաների կամ հյուրերի կողմը և վերադառնալ տիրոջ կանչին։'; why='Նույնիսկ բարի շունը կարող է վախեցնել մարդուն։ Լավ վարքը նշանակում է վերահսկելի վերադարձ և ուրիշների տարածքը հարգելը։'; steps=@('Աշխատեք երկար կապով և մարդկանցից անվտանգ հեռավորության վրա։','Կանչեք շանը մինչ նա շատ գրգռված չէ և պարգևատրեք վերադարձը։','Մոտենալ թույլ տվեք միայն հանգիստ քայլքով և մարդու համաձայնությամբ։') },
  @{ slug='inchpes-sovorecnel-shany-teghy-hramany'; title='Ինչպես սովորեցնել շանը «տեղը» հրամանը'; cat='հնազանդություն'; summary='Տան մեջ հանգիստ տեղ ունենալու քայլեր՝ ինչպես սովորեցնել շանը մնալ իր գորգի կամ մահճակալի վրա։'; why='«Տեղը» հրամանը օգնում է հյուրերի, ուտելու կամ հանգստի ժամանակ։ Այն չպետք է լինի պատիժ․ տեղը պետք է լինի հարմար և ապահով։'; steps=@('Ընտրեք գորգ կամ մահճակալ, որտեղ շունը հանգիստ կարող է պառկել։','Պարգևը դրեք տեղում և գովեք, երբ շունը բարձրանում է գորգի վրա։','Սկզբում պահանջեք մի քանի վայրկյան, հետո աստիճանաբար երկարացրեք մնալու ժամանակը։') }
)

function PostUrl($slug) { $siteUrl + '/posts/' + $slug + '/' }
function SaveText($path, $content) {
  $dir = Split-Path -Parent $path
  if ($dir) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
  Set-Content -LiteralPath $path -Value $content -Encoding UTF8
}
function Card($p) {
  '<article class=''post-card'' data-category=''' + $p.cat + '''><p class=''eyebrow''>' + $p.cat + '</p><h3><a href=''posts/' + $p.slug + '/''>' + $p.title + '</a></h3><p>' + $p.summary + '</p></article>'
}
function NewPostHtml($p) {
  $url = PostUrl $p.slug
  $steps = ($p.steps | ForEach-Object { '<li>' + $_ + '</li>' }) -join [Environment]::NewLine
  $jsonLd = [ordered]@{ '@context'='https://schema.org'; '@type'='BlogPosting'; headline=$p.title; description=$p.summary; datePublished=$today; dateModified=$today; author=@{ '@type'='Organization'; name='Dog Training Academy' }; publisher=@{ '@type'='Organization'; name='Dog Training Academy' }; mainEntityOfPage=$url; inLanguage='hy-AM'; articleSection=$p.cat } | ConvertTo-Json -Compress -Depth 5
@"
<!doctype html>
<html lang='hy-AM'>
<head>
  <meta charset='utf-8'>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
  <meta name='google-site-verification' content='IKltP1oUj7Y3BJdkTE2-DUNCvV29QHhHrTNKxxtqPhs'>
  <script async src='https://www.googletagmanager.com/gtag/js?id=G-8R0RKRNPSK'></script>
  <script>window.dataLayer=window.dataLayer||[];function gtag(){dataLayer.push(arguments);}gtag('js',new Date());gtag('config','G-8R0RKRNPSK');</script>
  <title>$($p.title)</title>
  <meta name='description' content='$($p.summary)'>
  <meta name='robots' content='index, follow, max-image-preview:large'>
  <link rel='canonical' href='$url'>
  <link rel='stylesheet' href='../../styles.css'>
  <meta property='og:type' content='article'>
  <meta property='og:site_name' content='Dog Training Academy'>
  <meta property='og:title' content='$($p.title)'>
  <meta property='og:description' content='$($p.summary)'>
  <meta property='og:url' content='$url'>
  <meta property='og:image' content='$siteUrl/assets/hero-training.webp'>
  <script type='application/ld+json'>$jsonLd</script>
</head>
<body>
  <header class='site-header'><nav class='nav'><a class='brand' href='../../'><span class='brand-mark'>DTA</span><span>Dog Training Academy</span></a><div class='nav-links'><a href='../../#articles'>Հոդվածներ</a><a href='../../about/'>Մեր մասին</a><a href='../../contact/'>Կապ</a></div></nav></header>
  <main class='post-page'><article class='post-article'><header class='post-hero'><p class='breadcrumb'><a href='../../'>Գլխավոր</a> / $($p.cat)</p><p class='eyebrow'>$($p.cat)</p><h1>$($p.title)</h1><p class='post-lead'>$($p.summary)</p><div class='quick-box'><h2>Կարճ պատասխան</h2><p>$($p.why)</p><a class='button primary' href='#steps'>Անցնել քայլերին</a></div></header><div class='post-content'><section><h2>Ինչու է սա կարևոր</h2><p>$($p.why)</p></section><section id='steps'><h2>Գործնական քայլեր</h2><ol class='guide-steps'>$steps</ol></section><section><h2>7 օրվա փոքր ծրագիր</h2><p><strong>Օր 1-2․</strong> Աշխատեք հանգիստ վայրում՝ 3-5 րոպե։</p><p><strong>Օր 3-4․</strong> Ավելացրեք փոքր շեղում և պարգևատրեք ճիշտ պահը։</p><p><strong>Օր 5-7․</strong> Կրկնեք իրական իրավիճակներում՝ պահելով նույն կանոնները։</p></section><section class='related-posts'><h2>Կարդացեք նաև</h2><a href='../shuny-chi-lsum-inch-anel/'>Ինչ անել, եթե շունը չի լսում տիրոջը</a><a href='../sovorecnel-shany-ari-hramany/'>Ինչպես սովորեցնել շանը «արի» հրամանը</a><a href='../shuny-qashum-e-kapy/'>Ինչ անել, եթե շունը քաշում է կապը</a></section></div></article></main>
  <footer class='footer'><div><a class='brand footer-brand' href='../../'><span class='brand-mark'>DTA</span><span>Dog Training Academy</span></a><p>Գործնական խորհուրդներ շների հետ ավելի լավ կապի համար։</p></div><nav><a href='../../#articles'>Հոդվածներ</a><a href='../../about/'>Մեր մասին</a><a href='../../contact/'>Կապ</a></nav><p class='copyright'>© <span data-year></span> Dog Training Academy.</p></footer>
  <script src='../../script.js' defer></script>
</body>
</html>
"@
}

if (Test-Path 'assets') { Copy-Item assets (Join-Path $out 'assets') -Recurse -Force }
foreach ($f in @('.nojekyll','robots.txt','manifest.webmanifest')) { if (Test-Path $f) { Copy-Item $f (Join-Path $out $f) -Force } }
foreach ($p in $posts | Where-Object { $_.old }) { if (Test-Path ('posts/' + $p.slug)) { Copy-Item ('posts/' + $p.slug) (Join-Path $postsOut $p.slug) -Recurse -Force } }

$cards = ($posts | ForEach-Object { Card $_ }) -join [Environment]::NewLine
$filters = @('all','ձագերի վարժեցում','հնազանդություն','զբոսանք','կանչ','վարքագիծ','առողջություն')
$filterHtml = ($filters | ForEach-Object { $label = if ($_ -eq 'all') { 'Բոլորը' } else { $_ }; $active = if ($_ -eq 'all') { ' is-active' } else { '' }; '<button type=''button'' class=''filter-chip' + $active + ''' data-filter=''' + $_ + '''>' + $label + '</button>' }) -join [Environment]::NewLine

$index = @"
<!doctype html>
<html lang='hy-AM'>
<head>
  <meta charset='utf-8'><meta name='viewport' content='width=device-width, initial-scale=1'>
  <meta name='google-site-verification' content='IKltP1oUj7Y3BJdkTE2-DUNCvV29QHhHrTNKxxtqPhs'>
  <script async src='https://www.googletagmanager.com/gtag/js?id=G-8R0RKRNPSK'></script><script>window.dataLayer=window.dataLayer||[];function gtag(){dataLayer.push(arguments);}gtag('js',new Date());gtag('config','G-8R0RKRNPSK');</script>
  <title>Dog Training Academy | Շների վարժեցում Հայաստանում</title>
  <meta name='description' content='Հայերեն բլոգ շների վարժեցման մասին Հայաստանում՝ հնազանդություն, ձագերի խնամք, վարքագիծ, զբոսանք, կանչ և առողջություն։'>
  <meta name='robots' content='index, follow, max-image-preview:large'><link rel='canonical' href='$siteUrl/'><link rel='stylesheet' href='styles.css'><link rel='alternate' type='application/rss+xml' href='$siteUrl/feed.xml'>
  <meta property='og:title' content='Dog Training Academy | Շների վարժեցում Հայաստանում'><meta property='og:description' content='Գործնական հայերեն խորհուրդներ շների տերերի համար։'><meta property='og:image' content='$siteUrl/assets/hero-training.webp'>
</head>
<body>
  <header class='site-header'><nav class='nav'><a class='brand' href='./'><span class='brand-mark'>DTA</span><span>Dog Training Academy</span></a><div class='nav-links'><a href='#articles'>Հոդվածներ</a><a href='about/'>Մեր մասին</a><a href='contact/'>Կապ</a></div></nav></header>
  <main>
    <section class='hero'><img src='assets/hero-training.webp' alt='Շան վարժեցում Հայաստանում' width='720' height='407'><div class='hero-overlay'></div><div class='hero-content'><p class='eyebrow'>Հանգիստ և գործնական ուսուցում</p><h1>Dog Training Academy</h1><p class='hero-copy'>Հայերեն ուղեցույցներ շների հնազանդության, վարքագծի, ձագերի խնամքի և անվտանգ զբոսանքի համար։</p><div class='hero-actions'><a class='button primary' href='#articles'>Դիտել հոդվածները</a><a class='button secondary' href='#problems'>Ընտրել խնդիր</a></div></div></section>
    <section class='section problem-band' id='problems'><p class='eyebrow'>Հայտնի խնդիրներ</p><h2>Ընտրեք, թե ինչն է հիմա դժվար ձեր շան հետ</h2><div class='problem-grid'><a href='posts/shuny-chi-lsum-inch-anel/'>Շունը չի լսում</a><a href='posts/shuny-vakhenum-e-dursum/'>Վախենում է դրսում</a><a href='posts/shuny-menak-mnalis-hachum-e/'>Մենակ մնալիս հաչում է</a><a href='posts/shuny-krcum-e-kahuyqy/'>Կրծում է կահույքը</a><a href='posts/shuny-che-utum-inch-anel/'>Չի ուտում</a><a href='posts/shan-dzagi-khnamq-arajin-orer/'>Ձագի առաջին օրեր</a></div></section>
    <section class='section content-shell' id='articles'><div class='content-main'><div class='section-heading split-heading'><div><p class='eyebrow'>Բլոգ</p><h2>Շների վարժեցման հոդվածներ</h2></div><label class='search-box'><input type='search' placeholder='Որոնել հոդվածներում' data-search></label></div><div class='filter-row'>$filterHtml</div><div class='article-grid' data-post-grid>$cards</div><div class='empty-state' data-empty-state hidden><h3>Այս որոնմամբ հոդված չի գտնվել։</h3></div></div><aside class='sidebar'><div class='sidebar-panel'><h2>Սկսեք այստեղից</h2><ul class='link-list'><li><a href='posts/shuny-chi-lsum-inch-anel/'>Շունը չի լսում</a></li><li><a href='posts/shuny-qashum-e-kapy/'>Քաշում է կապը</a></li><li><a href='posts/shan-dzagi-khnamq-arajin-orer/'>Ձագի խնամք</a></li></ul></div></aside></section>
  </main>
  <footer class='footer'><div><a class='brand footer-brand' href='./'><span class='brand-mark'>DTA</span><span>Dog Training Academy</span></a><p>Գործնական խորհուրդներ շների հետ ավելի լավ կապի համար։</p></div><nav><a href='#articles'>Հոդվածներ</a><a href='about/'>Մեր մասին</a><a href='contact/'>Կապ</a><a href='sitemap.xml'>Sitemap</a></nav><p class='copyright'>© <span data-year></span> Dog Training Academy.</p></footer><script src='script.js' defer></script>
</body>
</html>
"@

$postsJson = $posts | Select-Object title,@{n='url';e={'posts/' + $_.slug + '/'}},@{n='category';e={$_.cat}},@{n='excerpt';e={$_.summary}} | ConvertTo-Json -Compress -Depth 3
$scriptTemplate = @'
const posts = __POSTS__;
const grid = document.querySelector('[data-post-grid]');
const emptyState = document.querySelector('[data-empty-state]');
const searchInput = document.querySelector('[data-search]');
const filterButtons = document.querySelectorAll('[data-filter]');
const year = document.querySelector('[data-year]');
let activeFilter = 'all';
if (year) year.textContent = new Date().getFullYear();
function normalize(value) { return value.trim().toLowerCase(); }
function renderPosts() {
  if (!grid || !emptyState) return;
  const query = normalize(searchInput?.value || '');
  const filtered = posts.filter((post) => (activeFilter === 'all' || post.category === activeFilter) && (!query || normalize(post.title + ' ' + post.excerpt + ' ' + post.category).includes(query)));
  grid.innerHTML = filtered.map((post) => '<article class=\'post-card\'><p class=\'eyebrow\'>' + post.category + '</p><h3><a href=\'' + post.url + '\'>' + post.title + '</a></h3><p>' + post.excerpt + '</p></article>').join('');
  emptyState.hidden = filtered.length > 0;
}
filterButtons.forEach((button) => button.addEventListener('click', () => {
  activeFilter = button.dataset.filter || 'all';
  filterButtons.forEach((item) => item.classList.toggle('is-active', item === button));
  renderPosts();
}));
searchInput?.addEventListener('input', renderPosts);
renderPosts();
'@
$script = $scriptTemplate.Replace('__POSTS__', $postsJson)

$extraCss = '.problem-grid{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:12px}.problem-grid a{min-height:72px;display:flex;align-items:center;padding:16px 18px;border:1px solid var(--line);border-radius:8px;background:#fff;color:var(--green-deep);font-weight:900}.simple-page{width:min(920px,calc(100% - 32px));margin:0 auto;padding:58px 0}.simple-page h1{font-size:clamp(2.4rem,6vw,4.8rem);line-height:1}.trust-grid{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:16px;margin-top:30px}.trust-card{padding:20px;border:1px solid var(--line);border-radius:8px;background:#fff}@media(max-width:880px){.problem-grid,.trust-grid{grid-template-columns:repeat(2,minmax(0,1fr))}}@media(max-width:620px){.problem-grid,.trust-grid{grid-template-columns:1fr}}'
$baseCss = if (Test-Path 'styles.css') { Get-Content styles.css -Raw -Encoding UTF8 } else { (Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/John1912-7/site/main/styles.css' -UseBasicParsing).Content }

$about = @"
<!doctype html><html lang='hy-AM'><head><meta charset='utf-8'><meta name='viewport' content='width=device-width, initial-scale=1'><title>Մեր մասին | Dog Training Academy</title><meta name='description' content='Dog Training Academy-ի մասին․ հայերեն շների վարժեցման բլոգ Հայաստանում։'><link rel='canonical' href='$siteUrl/about/'><link rel='stylesheet' href='../styles.css'></head><body><header class='site-header'><nav class='nav'><a class='brand' href='../'><span class='brand-mark'>DTA</span><span>Dog Training Academy</span></a><div class='nav-links'><a href='../#articles'>Հոդվածներ</a><a href='../contact/'>Կապ</a></div></nav></header><main class='simple-page'><p class='eyebrow'>Մեր մասին</p><h1>Հայերեն բլոգ շների հանգիստ վարժեցման մասին</h1><p class='simple-lead'>Dog Training Academy-ը ստեղծված է շների տերերի համար, ովքեր ուզում են պարզ քայլեր՝ առանց կոշտ մեթոդների և խառնաշփոթ խորհուրդների։</p><div class='trust-grid'><section class='trust-card'><h2>Պարզ</h2><p>Կարճ պատասխան, քայլեր և FAQ։</p></section><section class='trust-card'><h2>Հանգիստ</h2><p>Պարգևատրում և կանխատեսելի կանոններ։</p></section><section class='trust-card'><h2>Հայերեն</h2><p>Թեմաներ Հայաստանի շների տերերի համար։</p></section></div></main><footer class='footer'><div><a class='brand footer-brand' href='../'><span class='brand-mark'>DTA</span><span>Dog Training Academy</span></a></div><nav><a href='../#articles'>Հոդվածներ</a><a href='../contact/'>Կապ</a></nav></footer><script src='../script.js' defer></script></body></html>
"@
$contact = @"
<!doctype html><html lang='hy-AM'><head><meta charset='utf-8'><meta name='viewport' content='width=device-width, initial-scale=1'><title>Կապ | Dog Training Academy</title><meta name='description' content='Կապ Dog Training Academy-ի հետ․ հարցեր, համագործակցություն և առաջարկներ։'><link rel='canonical' href='$siteUrl/contact/'><link rel='stylesheet' href='../styles.css'></head><body><header class='site-header'><nav class='nav'><a class='brand' href='../'><span class='brand-mark'>DTA</span><span>Dog Training Academy</span></a><div class='nav-links'><a href='../#articles'>Հոդվածներ</a><a href='../about/'>Մեր մասին</a></div></nav></header><main class='simple-page'><p class='eyebrow'>Կապ</p><h1>Հարցեր և համագործակցություն</h1><p class='simple-lead'>Այս էջը պատրաստ է իրական email-ի, Instagram-ի կամ Telegram-ի համար։ Տեղադրեք միայն այն կոնտակտը, որը պատրաստ եք հրապարակել հանրային կայքում։</p><div class='trust-grid'><section class='trust-card'><h2>Հարցեր</h2><p>Ընթերցողները կարող են առաջարկել նոր թեմաներ։</p></section><section class='trust-card'><h2>Գործընկերներ</h2><p>Հարմար է pet shop-երի կամ ծառայությունների համար։</p></section><section class='trust-card'><h2>Կոնտակտ</h2><p>Ավելացրեք հրապարակման համար հաստատված տվյալներ։</p></section></div></main><footer class='footer'><div><a class='brand footer-brand' href='../'><span class='brand-mark'>DTA</span><span>Dog Training Academy</span></a></div><nav><a href='../#articles'>Հոդվածներ</a><a href='../about/'>Մեր մասին</a></nav></footer><script src='../script.js' defer></script></body></html>
"@

$urls = @($siteUrl + '/', $siteUrl + '/about/', $siteUrl + '/contact/') + ($posts | ForEach-Object { PostUrl $_.slug })
$sitemap = "<?xml version='1.0' encoding='UTF-8'?>`n<urlset xmlns='http://www.sitemaps.org/schemas/sitemap/0.9'>`n" + (($urls | ForEach-Object { '  <url><loc>' + $_ + '</loc><lastmod>' + $today + '</lastmod><changefreq>monthly</changefreq><priority>0.9</priority></url>' }) -join "`n") + "`n</urlset>`n"
$feedItems = ($posts | ForEach-Object { '    <item><title>' + $_.title + '</title><link>' + (PostUrl $_.slug) + '</link><guid>' + (PostUrl $_.slug) + '</guid><pubDate>' + $rssDate + '</pubDate><description>' + $_.summary + '</description></item>' }) -join [Environment]::NewLine
$feed = "<?xml version='1.0' encoding='UTF-8'?><rss version='2.0' xmlns:atom='http://www.w3.org/2005/Atom'><channel><title>Dog Training Academy</title><link>$siteUrl/</link><description>Հայերեն հոդվածներ շների վարժեցման մասին Հայաստանում։</description><language>hy-AM</language><lastBuildDate>$rssDate</lastBuildDate><atom:link href='$siteUrl/feed.xml' rel='self' type='application/rss+xml' />$feedItems</channel></rss>"

SaveText (Join-Path $out 'index.html') $index
SaveText (Join-Path $out 'script.js') $script
SaveText (Join-Path $out 'styles.css') ($baseCss + $extraCss)
SaveText (Join-Path $out 'sitemap.xml') $sitemap
SaveText (Join-Path $out 'feed.xml') $feed
SaveText (Join-Path $out 'about/index.html') $about
SaveText (Join-Path $out 'contact/index.html') $contact
foreach ($p in $posts | Where-Object { -not $_.old }) { SaveText (Join-Path (Join-Path $postsOut $p.slug) 'index.html') (NewPostHtml $p) }
Get-ChildItem $out -Recurse -File | Select-Object FullName,Length
