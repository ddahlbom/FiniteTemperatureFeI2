using DrWatson
@quickactivate "FiniteTemperatureFeI2"

using Sunny, GLMakie
include(srcdir("model.jl"))
include(srcdir("structure_factor_utils.jl"))

# Test model
sys, crystal = FeI2_sys_and_cryst((4, 4, 4))
length(Sunny.eachsite(sys))

# Test sum rule
observables = observable_matrices()
sc = dynamical_correlations(sys; Δt = 0.05, nω=100, ωmax = 10.0, observables)
add_sample!(sc, sys)
total_spectral_weight(sc, sys)
