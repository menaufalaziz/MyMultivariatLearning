using Distributions, StatsPlots

# The parameters
μ = [0.0, 2.0]
ρ12 = 0.5

σ = [2.0 ρ12*sqrt(σ[1, 1] * σ[2, 2])
  ρ12*sqrt(σ[1, 1] * σ[2, 2]) 1.0]

# Create the bivariate normal Distributions
d = MvNormal(μ, σ)

# Visualization
# Create a grid

x = range(-5, 5, length=100)
y = range(-5, 5, length=100)
z = [pdf(d, [xi, yi]) for xi in x, yi in y]

# Plot the surface
plot(x, y, z, st=:surface, title="bivariate normal pdf")

