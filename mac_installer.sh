#!/bin/bash

# Install juliaup if not already installed
if ! command -v juliaup &> /dev/null
then
    curl -fsSL https://install.julialang.org | sh
    echo 'export PATH="$HOME/.juliaup/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc
fi

# Install Julia using juliaup
juliaup add release
juliaup default release

# Install required Julia packages
julia -e '
using Pkg
Pkg.add(["Plots", "OrdinaryDiffEq", "DataFrames", "CSV", "Agents", "IJulia", "Base64", "CairoMakie", "Distributions", "Dates", "Graphs", "LsqFit", "DrWatson", "GraphMakie", "HTTP", "Random", "LinearAlgebra", "InteractiveDynamics"])
'

#curl -L -o precompiled_packages.so "https://rcsicampus-my.sharepoint.com/:u:/r/personal/marcsturrock_rcsi_com/Documents/RSS/precompiled_packages.so?csf=1&web=1&e=9zc8fy"


# Set the download URLs and destination paths
notebook_urls=(
    "https://raw.githubusercontent.com/Msturroc/covid_models/main/ODE_notebook.ipynb"
    "https://raw.githubusercontent.com/Msturroc/covid_models/main/covid_19_modelling1.ipynb"
    "https://raw.githubusercontent.com/Msturroc/covid_models/main/covid_19_modelling2.ipynb"
    
)
notebook_paths=(
    "$HOME/Downloads/ODE_notebook.ipynb"
    "$HOME/Downloads/covid_19_modelling1.ipynb"
    "$HOME/Downloads/covid_19_modelling2.ipynb"
)

# Download the Jupyter Notebooks using Julia
for ((i=0; i<${#notebook_urls[@]}; i++))
do
    julia -e '
    using HTTP
    notebook_url = "'${notebook_urls[$i]}'"
    notebook_path = "'${notebook_paths[$i]}'"
    response = HTTP.get(notebook_url)
    open(notebook_path, "w") do file
        write(file, response.body)
    end
    println("Notebook downloaded to $notebook_path")
    '
done

# Launch the Jupyter Notebook
julia -e '
using IJulia
notebook_dir = "'$HOME/Downloads'"
notebook(dir=notebook_dir,detached=true)
'
