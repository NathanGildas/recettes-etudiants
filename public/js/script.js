// Menu mobile et fonctionnalités principales
document.addEventListener('DOMContentLoaded', function() {
    // 1. Gestion du menu mobile
    initMobileMenu();
    
    // 2. Filtrage des recettes (si présent sur la page)
    initRecipeFilters();
    
    // 3. Gestion de la liste de courses (si présent sur la page)
    initShoppingList();
    
    // 4. Gestion des cases à cocher dans la liste de courses
    initCheckboxes();
    
    // 5. Gestion du mode sombre
    initDarkMode();
});

// Initialisation du menu mobile
function initMobileMenu() {
    const menuToggle = document.querySelector('.mobile-menu-toggle');
    const mainNav = document.querySelector('.main-nav');
    
    if (menuToggle && mainNav) {
        // Sauvegarde du texte original des boutons pour réinitialisation
        document.querySelectorAll('.btn-add-to-list').forEach(button => {
            button.dataset.originalText = button.innerHTML;
        });
        
        menuToggle.addEventListener('click', () => {
            mainNav.classList.toggle('active');
            menuToggle.setAttribute('aria-expanded', mainNav.classList.contains('active'));
            
            // Change l'icône
            const icon = menuToggle.querySelector('i');
            if (icon) {
                icon.classList.toggle('fa-bars');
                icon.classList.toggle('fa-times');
            }
        });
        
        // Fermer le menu au clic en dehors
        document.addEventListener('click', function(event) {
            if (mainNav.classList.contains('active') && 
                !mainNav.contains(event.target) && 
                !menuToggle.contains(event.target)) {
                
                mainNav.classList.remove('active');
                menuToggle.setAttribute('aria-expanded', 'false');
                
                const icon = menuToggle.querySelector('i');
                if (icon) {
                    icon.classList.add('fa-bars');
                    icon.classList.remove('fa-times');
                }
            }
        });
    }
}

// Initialisation des filtres de recettes
function initRecipeFilters() {
    const filterForm = document.getElementById('filter-form');
    const resetButton = document.getElementById('reset-filters');
    
    if (filterForm) {
        filterForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            const formData = new FormData(this);
            const params = new URLSearchParams(formData).toString();
            
            fetch(`/recipes/filter?${params}`)
                .then(response => response.text())
                .then(html => {
                    document.getElementById('recipes-container').innerHTML = html;
                    history.pushState(null, '', `?${params}`);
                    
                    // Réinitialiser les gestionnaires d'événements sur les nouveaux éléments
                    initShoppingList();
                })
                .catch(error => {
                    console.error('Erreur de filtrage:', error);
                    showNotification('Erreur lors du filtrage des recettes', 'error');
                });
        });
    }
    
    if (resetButton) {
        resetButton.addEventListener('click', function() {
            document.querySelectorAll('.filter-select').forEach(select => {
                select.value = '';
            });
            
            if (filterForm) {
                filterForm.dispatchEvent(new Event('submit'));
            }
        });
    }
}

// Initialisation de la liste de courses
function initShoppingList() {
    document.querySelectorAll('.btn-add-to-list').forEach(button => {
        // Sauvegarde du texte original pour la réinitialisation
        if (!button.dataset.originalText) {
            button.dataset.originalText = button.innerHTML;
        }
        
        button.addEventListener('click', function() {
            const recipeId = this.dataset.recipeId;
            if (!recipeId) return;
            
            this.disabled = true;
            addToShoppingList(recipeId, this);
        });
    });
}

// Fonction pour ajouter à la liste de courses
function addToShoppingList(recipeId, button) {
    // Vérifier si axios est disponible
    if (typeof axios !== 'undefined') {
        axios.post('/shopping-list', {
            recipe_id: recipeId
        })
        .then(response => {
            // Feedback visuel
            showButtonFeedback(button, true);
        })
        .catch(error => {
            console.error('Error:', error);
            showButtonFeedback(button, false);
        });
    } else {
        // Fallback à fetch si axios n'est pas disponible
        fetch('/shopping-list', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]')?.getAttribute('content')
            },
            body: JSON.stringify({ recipe_id: recipeId })
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            showButtonFeedback(button, true);
        })
        .catch(error => {
            console.error('Error:', error);
            showButtonFeedback(button, false);
        });
    }
}

// Afficher un feedback visuel sur le bouton
function showButtonFeedback(button, success) {
    const icon = button.querySelector('i');
    const originalClass = icon ? icon.className : '';
    
    if (icon) {
        icon.className = success ? 'fas fa-check' : 'fas fa-times';
    }
    
    if (success) {
        button.classList.add('bg-green-500', 'text-white');
    } else {
        button.classList.add('bg-red-500', 'text-white');
    }
    
    setTimeout(() => {
        if (icon && originalClass) {
            icon.className = originalClass;
        }
        button.classList.remove('bg-green-500', 'bg-red-500', 'text-white');
        button.disabled = false;
    }, 2000);
}

// Initialisation des cases à cocher
function initCheckboxes() {
    document.querySelectorAll('input[type="checkbox"]').forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            const label = this.nextElementSibling;
            if (label) {
                if (this.checked) {
                    label.classList.add('line-through', 'text-gray-400');
                } else {
                    label.classList.remove('line-through', 'text-gray-400');
                }
            }
        });
    });
}

// Supprimer de la liste de courses
function removeFromShoppingList(recipeId) {
    if (confirm('Supprimer cette recette de votre liste de courses ?')) {
        if (typeof axios !== 'undefined') {
            axios.delete(`/shopping-list/${recipeId}`)
                .then(response => {
                    window.location.reload();
                });
        } else {
            fetch(`/shopping-list/${recipeId}`, {
                method: 'DELETE',
                headers: {
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]')?.getAttribute('content')
                }
            })
            .then(response => {
                if (response.ok) {
                    window.location.reload();
                }
            });
        }
    }
}

// Vider la liste de courses
function clearShoppingList() {
    if (confirm('Vider complètement votre liste de courses ?')) {
        if (typeof axios !== 'undefined') {
            axios.delete('/shopping-list/clear')
                .then(response => {
                    window.location.reload();
                });
        } else {
            fetch('/shopping-list/clear', {
                method: 'DELETE',
                headers: {
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]')?.getAttribute('content')
                }
            })
            .then(response => {
                if (response.ok) {
                    window.location.reload();
                }
            });
        }
    }
}

// Gestion du mode sombre
function initDarkMode() {
    const darkModeToggle = document.getElementById('dark-mode-toggle');
    if (darkModeToggle) {
        darkModeToggle.addEventListener('click', () => {
            document.documentElement.classList.toggle('dark');
            
            // Sauvegarde préférence
            if (document.documentElement.classList.contains('dark')) {
                localStorage.theme = 'dark';
            } else {
                localStorage.theme = 'light';
            }
        });
    }
}

// Fonction utilitaire pour afficher des notifications
function showNotification(message, type = 'success', duration = 3000) {
    // Créer la notification si elle n'existe pas déjà
    let notification = document.getElementById('notification');
    if (!notification) {
        notification = document.createElement('div');
        notification.id = 'notification';
        notification.style.position = 'fixed';
        notification.style.bottom = '20px';
        notification.style.right = '20px';
        notification.style.padding = '10px 20px';
        notification.style.borderRadius = '5px';
        notification.style.transition = 'all 0.3s ease';
        notification.style.opacity = '0';
        notification.style.transform = 'translateY(20px)';
        notification.style.zIndex = '9999';
        document.body.appendChild(notification);
    }
    
    // Définir le style selon le type
    notification.textContent = message;
    if (type === 'success') {
        notification.style.backgroundColor = '#4CAF50';
        notification.style.color = 'white';
    } else if (type === 'error') {
        notification.style.backgroundColor = '#F44336';
        notification.style.color = 'white';
    } else if (type === 'warning') {
        notification.style.backgroundColor = '#FF9800';
        notification.style.color = 'white';
    } else if (type === 'info') {
        notification.style.backgroundColor = '#2196F3';
        notification.style.color = 'white';
    }
    
    // Animer l'apparition
    setTimeout(() => {
        notification.style.opacity = '1';
        notification.style.transform = 'translateY(0)';
    }, 10);
    
    // Disparition automatique
    setTimeout(() => {
        notification.style.opacity = '0';
        notification.style.transform = 'translateY(20px)';
        
        // Supprimer complètement après l'animation
        setTimeout(() => {
            if (notification.parentNode) {
                notification.parentNode.removeChild(notification);
            }
        }, 300);
    }, duration);
}