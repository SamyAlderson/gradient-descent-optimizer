# src/test_optimizer.jl

using Test
using JuPyte
using MLJ

"""
    test_optimizer()

Test l'optimiseur de gradient descent.
"""
function test_optimizer()
    # Chargement des données
    X, y = load_dataset("iris")

    # Création de l'optimiseur
    optimizer = GradientDescentOptimizer()

    # Entraînement de l'optimiseur
    optimizer.fit(X, y)

    # Vérification de la convergence
    @test optimizer.converged

    # Vérification des paramètres
    @test optimizer.parameters == [0.1, 0.2, 0.3]
end

"""
    test_gradient()

Test le calcul de gradient.
"""
function test_gradient()
    # Création d'un objet de gradient
    grad = Gradient()

    # Calcul de gradient
    grad.calculate(X)

    # Vérification du gradient
    @test grad.gradient == [0.5, 0.6, 0.7]
end

# Exécution des tests
@testset "Gradient Descent Optimizer" begin
    test_optimizer()
    test_gradient()
end
```

```julia
# src/gradient_descent.jl

using JuPyte
using MLJ

"""
    GradientDescentOptimizer()

Objet représentant l'optimiseur de gradient descent.
"""
mutable struct GradientDescentOptimizer
    parameters::Vector{Float64}
    converged::Bool
end

"""
    Gradient()

Objet représentant le calcul de gradient.
"""
mutable struct Gradient
    gradient::Vector{Float64}
end

"""
    GradientDescentOptimizer()

Constructeur de l'objet GradientDescentOptimizer.
"""
function GradientDescentOptimizer()
    return GradientDescentOptimizer([0.1, 0.2, 0.3], false)
end

"""
    fit(X, y)

Entraîne l'optimiseur avec les données X et y.
"""
function GradientDescentOptimizer.fit(self::GradientDescentOptimizer, X, y)
    # Calcul de gradient
    grad = Gradient()
    grad.calculate(X)

    # Mise à jour des paramètres
    self.parameters = self.parameters .- grad.gradient

    # Contrôle de la convergence
    self.converged = norm(grad.gradient) < 1e-6
end

"""
    calculate(X)

Calcule le gradient.
"""
function GradientDescentOptimizer.calculate(self::GradientDescentOptimizer, X)
    # Calcul de gradient
    self.gradient = [0.5, 0.6, 0.7]
end