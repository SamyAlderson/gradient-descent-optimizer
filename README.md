# Gradient Descent Optimizer
## Simple gradient descent implementation for optimization

This is a basic Julia implementation of the gradient descent optimizer. It's a straightforward way to minimize a cost function, and I used it to test some math library functionality. This optimizer is not particularly efficient or robust, but it works for small problems.

### Install

You can install this package using Julia's package manager:
```bash
julia> using Pkg
julia> Pkg.add("https://github.com/SamyAlderson/gradient-descent-optimizer.git")
```

### Usage

To use the optimizer, create a new Julia script and add the following:
```julia
using GradientDescentOptimizer

# Define a cost function and its gradient
cost(x) = x^2
grad_cost(x) = 2x

# Initialize the optimizer
optimizer = GradientDescentOptimizer(cost, grad_cost, 0.1, 100)

# Run the optimizer
result = optimize(optimizer)

# Print the result
println(result)
```

### Build from Source

This package uses the standard `Pkg.build` command to build:
```bash
julia> Pkg.build("gradient-descent-optimizer")
```

### Run Tests

This package includes a test suite. You can run the tests using the following command:
```bash
julia> using Test
julia> Test.run("GradientDescentOptimizer")
```

### Project Structure

* `src/GradientDescentOptimizer.jl`: The main implementation file.
* `src/test_gradient_descent_optimizer.jl`: The test suite.
* `src/test_gradient_descent_optimizer_utils.jl`: Helper functions for testing.
* `README.md`: This file.

### License

Copyright (c) 2026 SamyAlderson

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.