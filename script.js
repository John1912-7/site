const posts = [
  {
    title: 'Ինչ անել, եթե շունը քաշում է կապը զբոսանքի ժամանակ',
    url: 'posts/shuny-qashum-e-kapy/',
    category: 'զբոսանք',
    excerpt: 'Ինչու է շունը շտապում առաջ, ինչ է մտածում զբոսանքի ժամանակ և ինչպես քայլ առ քայլ սովորեցնել հանգիստ քայլել թուլացած կապով։'
  },
  {
    title: 'Ինչ անել, եթե շան ձագը կծում է ձեռքերը',
    url: 'posts/shan-dzagy-kcum-e-dzerqery/',
    category: 'ձագերի վարժեցում',
    excerpt: 'Պարզ բացատրություն՝ ինչու են ձագերը կծում ձեռքերը, ինչպես փոխարինել այդ վարքը խաղալիքով և ինչ սխալներից խուսափել։'
  },
  {
    title: 'Ինչպես սովորեցնել շանը չցատկել մարդկանց վրա',
    url: 'posts/shuny-chcatkel-mardkanc-vra/',
    category: 'վարքագիծ',
    excerpt: 'Ինչու է շունը ցատկում հյուրերի կամ անցորդների վրա և ինչպես սովորեցնել հանգիստ ողջույն՝ առանց գոռալու կամ պատժելու։'
  },
  {
    title: 'Ինչպես սովորեցնել շանը «արի» հրամանը',
    url: 'posts/sovorecnel-shany-ari-hramany/',
    category: 'կանչ',
    excerpt: 'Վստահ կանչի ուղեցույց՝ ինչպես դարձնել տիրոջ մոտ գալը շան համար լավագույն ընտրությունը նույնիսկ շեղումների ժամանակ։'
  },
  {
    title: 'Ինչու է շունը հաչում և ինչ անել',
    url: 'posts/inchu-e-shuny-hachum/',
    category: 'վարքագիծ',
    excerpt: 'Հաչոցը հասկանալու ուղեցույց՝ վախ, ձանձրույթ, ուշադրություն կամ զգուշացում, և քայլեր՝ հաչոցը հանգիստ նվազեցնելու համար։'
  }
];

const menuButton = document.querySelector('[data-menu-toggle]');
const menu = document.querySelector('[data-menu]');
const grid = document.querySelector('[data-post-grid]');
const emptyState = document.querySelector('[data-empty-state]');
const searchInput = document.querySelector('[data-search]');
const filterButtons = document.querySelectorAll('[data-filter]');
const year = document.querySelector('[data-year]');

let activeFilter = 'all';

if (year) {
  year.textContent = new Date().getFullYear();
}

if (menuButton && menu) {
  menuButton.addEventListener('click', () => {
    const isOpen = menu.classList.toggle('is-open');
    menuButton.setAttribute('aria-expanded', String(isOpen));
  });
}

function normalize(value) {
  return value.trim().toLowerCase();
}

function renderPosts() {
  if (!grid || !emptyState) return;

  const query = normalize(searchInput?.value || '');
  const filteredPosts = posts.filter((post) => {
    const matchesFilter = activeFilter === 'all' || post.category === activeFilter;
    const haystack = normalize(`${post.title} ${post.excerpt} ${post.category}`);
    return matchesFilter && (!query || haystack.includes(query));
  });

  grid.innerHTML = filteredPosts.map((post) => `
    <article class="post-card">
      <p class="eyebrow">${post.category}</p>
      <h3><a href="${post.url}">${post.title}</a></h3>
      <p>${post.excerpt}</p>
    </article>
  `).join('');

  emptyState.hidden = filteredPosts.length > 0;
}

filterButtons.forEach((button) => {
  button.addEventListener('click', () => {
    activeFilter = button.dataset.filter || 'all';
    filterButtons.forEach((item) => item.classList.toggle('is-active', item === button));
    renderPosts();
  });
});

searchInput?.addEventListener('input', renderPosts);
renderPosts();
