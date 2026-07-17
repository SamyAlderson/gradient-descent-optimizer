# src/optimizer.jl

"""
    Optimiseur de gradient descent

L'optimiseur de gradient descent est une implémentation d'un algorithme d'optimisation qui utilise la dérivée des fonctions pour trouver le minimum d'une fonction de coût.

## Fonctions

### `optimize`
- `optimize(x0::Array{Float64}, learning_rate::Float64, max_iter::Int64, tol::Float64)`: 
  Exécute l'algorithme de gradient descent pour trouver le minimum de la fonction de coût.

### `update_parameters!`
- `update_parameters!(params::Array{Float64}, gradient::Array{Float64}, learning_rate::Float64)`: 
  Met à jour les paramètres en fonction du gradient et de la learning rate.

### `check_convergence`
- `check_convergence(params::Array{Float64}, iter::Int64, tol::Float64)`: 
  Vérifie si l'algorithme a convergé.

## Types

### `Optimizer`
- `Optimizer(x0::Array{Float64}, learning_rate::Float64, max_iter::Int64, tol::Float64)`: 
  Initie l'optimiseur avec les paramètres de départ, la learning rate, le nombre d'itérations maximales et la tolérance.
"""

module Optimizer

import MLJ

export optimize, update_parameters!, check_convergence

mutable struct Optimizer
    x0::Array{Float64}
    learning_rate::Float64
    max_iter::Int64
    tol::Float64
    params::Array{Float64}
    iter::Int64
end

function Optimizer(x0::Array{Float64}, learning_rate::Float64, max_iter::Int64, tol::Float64)
    return Optimizer(x0, learning_rate, max_iter, tol, copy(x0), 0)
end

function optimize(x0::Array{Float64}, learning_rate::Float64, max_iter::Int64, tol::Float64)
    optimizer = Optimizer(x0, learning_rate, max_iter, tol)
    for _ in 1:max_iter
        gradient = gradient_descent(x0)
        update_parameters!(optimizer.params, gradient, learning_rate)
        if check_convergence(optimizer.params, optimizer.iter, tol)
            break
        end
        optimizer.iter += 1
    end
    return optimizer.params
end

function update_parameters!(params::Array{Float64}, gradient::Array{Float64}, learning_rate::Float64)
    for i in 1:length(params)
        params[i] -= learning_rate * gradient[i]
    end
end

function check_convergence(params::Array{Float64}, iter::Int64, tol::Float64)
    if iter >= max_iter
        return true
    elseif norm(params - x0) < tol
        return true
    else
        return false
    end
end

function gradient_descent(x0::Array{Float64})
    # Implémentation du gradient descent
    # Pour l'exemple, on suppose que x0 est un vecteur de 2 éléments
    dx = [1.0, 2.0]
    return dx
end

end  # module Optimizer