#!/bin/bash

# Install juliaup if not already installed
if ! command -v juliaup &> /dev/null
then
    curl -fsSL https://install.julialang.org | sh
    echo 'export PATH="$HOME/.juliaup/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc
fi

# Install Julia using juliaup
juliaup add stable
juliaup default stable

# Install required Julia packages
julia -e '
using Pkg
Pkg.add(["Plots", "OrdinaryDiffEq", "DataFrames", "CSV", "Agents", "IJulia", "Base64", "CairoMakie", "Distributions", "Dates", "Graphs", "LsqFit", "DrWatson", "GraphMakie", "HTTP", "Random", "LinearAlgebra", "InteractiveDynamics"])
'

# Set the download URL and destination path
notebook_url="https://raw.githubusercontent.com/Msturroc/covid_models/main/covid_19_modelling1.ipynb"
notebook_path="$HOME/Downloads/covid_19_modelling1.ipynb"

# Download the Jupyter Notebook using Julia
julia -e '
using HTTP
notebook_url = "'$notebook_url'"
notebook_path = "'$notebook_path'"
response = HTTP.get(notebook_url)
open(notebook_path, "w") do file
    write(file, response.body)
end
println("Notebook downloaded to $notebook_path")
'

# Launch the Jupyter Notebook
julia -e '
using IJulia
notebook(detached=true, dir="'$HOME/Downloads'", file="covid_19_modelling1.ipynb")
'
