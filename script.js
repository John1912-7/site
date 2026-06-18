const posts = [];

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
