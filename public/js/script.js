// 1. Gestion plus robuste du menu mobile
const menuToggle = document.querySelector('.mobile-menu-toggle');
const mainNav = document.querySelector('.main-nav');

if (menuToggle && mainNav) {
    menuToggle.addEventListener('click', () => {
        mainNav.classList.toggle('active');
        menuToggle.setAttribute('aria-expanded', mainNav.classList.contains('active'));
    });
}

// 2. Filtrage des recettes amélioré
const initRecipeFilters = () => {
    const filterButton = document.querySelector('.filters button');
    if (!filterButton) return;

    filterButton.addEventListener('click', async () => {
        const filters = {
            budget: document.getElementById('budget')?.value,
            time: document.getElementById('time')?.value,
            ingredients: document.getElementById('ingredients')?.value
        };

        try {
            // Exemple avec fetch API
            const response = await fetch('/api/recipes/filter', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(filters)
            });
            const recipes = await response.json();
            updateRecipeList(recipes);
        } catch (error) {
            console.error('Filter error:', error);
            showNotification('Erreur de filtrage', 'error');
        }
    });
};

// 3. Gestion de liste de courses améliorée
const initShoppingList = () => {
    document.querySelectorAll('.btn-add-to-list').forEach(button => {
        button.addEventListener('click', async function() {
            const recipeId = this.dataset.recipeId;
            if (!recipeId) return;

            this.disabled = true;
            
            try {
                await addToShoppingList(recipeId);
                showButtonFeedback(this, 'Ajouté!', true);
            } catch (error) {
                showButtonFeedback(this, 'Erreur', false);
            } finally {
                setTimeout(() => {
                    this.disabled = false;
                    resetButton(this);
                }, 2000);
            }
        });
    });
};

// Helper functions
const showButtonFeedback = (button, text, success) => {
    button.innerHTML = `<i class="fas fa-${success ? 'check' : 'times'}"></i> ${text}`;
    button.style.backgroundColor = success ? '#4CAF50' : '#F44336';
};

const resetButton = (button) => {
    button.innerHTML = button.dataset.originalText;
    button.style.backgroundColor = '';
};