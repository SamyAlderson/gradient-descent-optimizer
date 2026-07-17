# src/gradient_descent.jl

"""
    gradient_descent(
        theta::Vector{Float64},
        X::Matrix{Float64},
        y::Vector{Float64},
        alpha::Float64,
        num_iterations::Integer
    )

Calcul le gradient du coût et met à jour les paramètres θ en utilisant l'algorithme de descente de gradient.

# Arguments
- `theta`: vecteur de paramètres initiaux
- `X`: matrice des features
- `y`: vecteur de valeurs cibles
- `alpha`: taux d'apprentissage
- `num_iterations`: nombre d'itérations

# Returns
- `theta`: vecteur de paramètres mis à jour
"""
function gradient_descent(
    theta::Vector{Float64},
    X::Matrix{Float64},
    y::Vector{Float64},
    alpha::Float64,
    num_iterations::Integer
)
    # Vérification des entrées
    @assert size(X, 2) == length(theta) "Nombre de features doit correspondre au nombre de paramètres"
    @assert size(X, 1) == length(y) "Nombre de lignes de X doit correspondre au nombre de valeurs cibles"

    # Calcul du gradient du coût
    for _ in 1:num_iterations
        # Prédiction
        y_pred = X * theta

        # Calcul de l'erreur
        error = y_pred - y

        # Calcul de la gradient du coût
        gradient = (2 / length(y)) * X' * error

        # Mise à jour des paramètres
        theta .= theta - alpha * gradient
    end

    return theta
end

"""
    gradient_descent_cost(
        theta::Vector{Float64},
        X::Matrix{Float64},
        y::Vector{Float64}
    )

Calcul le coût d'un modèle donné.

# Arguments
- `theta`: vecteur de paramètres
- `X`: matrice des features
- `y`: vecteur de valeurs cibles

# Returns
- `cost`: coût du modèle
"""
function gradient_descent_cost(
    theta::Vector{Float64},
    X::Matrix{Float64},
    y::Vector{Float64}
)
    # Prédiction
    y_pred = X * theta

    # Calcul de l'erreur
    error = y_pred - y

    # Calcul du coût
    cost = (1 / 2) * sum(error.^2)

    return cost
end