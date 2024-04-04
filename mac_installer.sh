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
Pkg.add("Plots")
Pkg.add("OrdinaryDiffEq")
Pkg.add("DataFrames")
Pkg.add("CSV")
Pkg.add("Agents")
Pkg.add("IJulia")
Pkg.add("Base64")
Pkg.add("CairoMakie")
Pkg.add("Dates")
Pkg.add("Distributions")
Pkg.add("DrWatson")
Pkg.add("GraphMakie")
Pkg.add("Graphs")
Pkg.add("HTTP")
Pkg.add("InteractiveDynamics")
Pkg.add("LinearAlgebra")
Pkg.add("LsqFit")
Pkg.add("Random")
'

# Set the path to your Jupyter Notebook file
notebook_path="$HOME/Downloads/covid_19_modelling1.ipynb"

# Launch the Jupyter Notebook
julia -e '
using IJulia
notebook(detached=true, dir="'$notebook_path'")
'
