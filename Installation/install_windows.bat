@echo off

REM Check if Julia is already installed
where julia >nul 2>nul
if %errorlevel% equ 0 (
    echo Julia is already installed.
) else (
    REM Download and install Julia
    echo Downloading Julia installer...
    curl -L -o julia-installer.exe https://julialang-s3.julialang.org/bin/winnt/x64/1.8/julia-1.8.5-win64.exe
    echo Installing Julia...
    start /wait julia-installer.exe /S /D=C:\Julia
    echo Julia installation completed.
)

REM Add Julia to PATH
setx PATH "%PATH%;C:\Julia\bin"

REM Install required Julia packages
echo Installing required Julia packages...
julia -e "using Pkg; Pkg.add([\"Plots\", \"OrdinaryDiffEq\", \"DataFrames\", \"CSV\", \"Agents\", \"IJulia\", \"Base64\", \"CairoMakie\", \"Distributions\", \"Dates\", \"Graphs\", \"LsqFit\", \"DrWatson\", \"GraphMakie\", \"HTTP\", \"Random\", \"LinearAlgebra\", \"InteractiveDynamics\"])"

REM Set the download URLs and destination paths
set "notebook_url1=https://raw.githubusercontent.com/Msturroc/covid_models/main/covid_19_modelling1.ipynb"
set "notebook_path1=%USERPROFILE%\Downloads\covid_19_modelling1.ipynb"
set "notebook_url2=https://raw.githubusercontent.com/Msturroc/covid_models/main/covid_19_modelling2.ipynb"
set "notebook_path2=%USERPROFILE%\Downloads\covid_19_modelling2.ipynb"

REM Download the Jupyter Notebooks using Julia
echo Downloading Jupyter Notebooks...
julia -e "using HTTP; notebook_url1 = \"%notebook_url1%\"; notebook_path1 = \"%notebook_path1%\"; response1 = HTTP.get(notebook_url1); open(notebook_path1, \"w\") do file; write(file, response1.body); end; println(\"Notebook downloaded to %notebook_path1%\")"
julia -e "using HTTP; notebook_url2 = \"%notebook_url2%\"; notebook_path2 = \"%notebook_path2%\"; response2 = HTTP.get(notebook_url2); open(notebook_path2, \"w\") do file; write(file, response2.body); end; println(\"Notebook downloaded to %notebook_path2%\")"

REM Launch the Jupyter Notebook
echo Launching Jupyter Notebook...
julia -e "using IJulia; notebook_dir = \"%USERPROFILE%\\Downloads\"; notebook(dir=notebook_dir, detached=true)"

echo Installation and setup completed.
pause
