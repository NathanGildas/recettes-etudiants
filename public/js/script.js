// Mobile Menu Toggle
document.querySelector('.mobile-menu-toggle').addEventListener('click', function() {
    document.querySelector('.main-nav').classList.toggle('active');
});

// Recipe Filter Functionality
document.querySelector('.filters button').addEventListener('click', function() {
    const budgetFilter = document.getElementById('budget').value;
    const timeFilter = document.getElementById('time').value;
    const ingredientsFilter = document.getElementById('ingredients').value;
    
    // In a real app, this would make an API call or filter client-side data
    console.log('Filtering by:', {
        budget: budgetFilter,
        time: timeFilter,
        ingredients: ingredientsFilter
    });
    
    alert('Filtrage appliqué! Dans une application réelle, cela filtrerait les recettes.');
});

// Add to Shopping List
document.querySelectorAll('.btn-add-to-list').forEach(button => {
    button.addEventListener('click', function() {
        const recipeId = this.getAttribute('data-recipe-id');
        
        // In a real app, this would add to local storage or make an API call
        console.log('Adding recipe to shopping list:', recipeId);
        
        // Visual feedback
        const originalText = this.innerHTML;
        this.innerHTML = '<i class="fas fa-check"></i> Ajouté!';
        this.style.backgroundColor = '#4CAF50';
        
        setTimeout(() => {
            this.innerHTML = originalText;
            this.style.backgroundColor = '';
        }, 2000);
    });
});

// Smooth scrolling for anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        e.preventDefault();
        
        const targetId = this.getAttribute('href');
        if (targetId === '#') return;
        
        const targetElement = document.querySelector(targetId);
        if (targetElement) {
            window.scrollTo({
                top: targetElement.offsetTop - 100,
                behavior: 'smooth'
            });
        }
    });
});