using Documenter
using HypergraphsLab

makedocs(
    sitename = "HypergraphsLab",
    format = :html,
    modules = [HypergraphsLab],
	makedocs = true
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
deploydocs(
    repo = "github.com/aleant93/HypergraphsLab.jl.git",
    target = "build"
)
