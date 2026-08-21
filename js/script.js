document.addEventListener('DOMContentLoaded', () => {
  const usuario = 'R00nni3';
  const repoExcluido = 'portafolio2026';
  const contenedor = document.getElementById('proyectos-container');

  fetch(`https://api.github.com/users/${usuario}/repos?sort=updated`)
    .then(res => {
      if (!res.ok) throw new Error('No se pudo conectar con GitHub');
      return res.json();
    })
    .then(repos => {
      const filtrados = repos.filter(repo => repo.name !== repoExcluido);

      if (filtrados.length === 0) {
        contenedor.innerHTML = '<p class="text-center">Todavía no hay proyectos publicados.</p>';
        return;
      }

      filtrados.forEach(repo => {
        const col = document.createElement('div');
        col.className = 'col-md-4 mb-4 d-flex justify-content-center';
        col.innerHTML = `
          <div class="card" style="width: 18rem;">
            <div class="card-body">
              <h5 class="card-title">${repo.name}</h5>
              <p class="card-text">${repo.description || 'Sin descripción disponible.'}</p>
              <a href="${repo.html_url}" target="_blank" rel="noopener" class="btn btn-primary">Ver en GitHub</a>
            </div>
          </div>
        `;
        contenedor.appendChild(col);
      });
    })
    .catch(err => {
      contenedor.innerHTML = '<p class="text-center text-danger">No se pudieron cargar los proyectos en este momento.</p>';
      console.error(err);
    });
});