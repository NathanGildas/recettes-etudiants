@include('partials.header')

<main>
    <section class="add-recipe">
        <div class="container">
            <h1>Ajouter une recette</h1>
            <form action="/add-recipe" method="POST">
                @csrf
                <label for="title">Nom de la recette</label>
                <input type="text" name="title" required>

                <label for="prepTime">Temps de préparation (min)</label>
                <input type="number" name="prepTime" required>

                <label for="budget">Budget (€ / €€)</label>
                <input type="text" name="budget" required>

                <label for="ingredients">Ingrédients (séparés par des virgules)</label>
                <input type="text" name="ingredients" required>

                <label for="image">Nom de l'image (ex: pasta.jpg)</label>
                <input type="text" name="image" required>

                <button type="submit" class="btn btn-primary">Ajouter</button>
            </form>
        </div>
    </section>
</main>

@include('partials.footer')
