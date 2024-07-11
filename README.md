# README.md

## Overview

Welcome to the Computational Modelling Repository. This repository contains Jupyter Notebooks and automatic installation files for both Mac and Windows machines. The notebooks are designed for sessions on the computational modelling of tumour growth and the spread of COVID-19. The models employed are based on ordinary differential equations (ODEs), and the programming language used is Julia.

## Repository Structure

- **Notebooks/**: Contains Jupyter Notebooks for the computational modelling sessions.
  - `covid19/`: Contains notebooks for modelling the spread of COVID-19 using ODEs.
    - `covid_19_modelling1.ipynb`
    - `covid_19_modelling2.ipynb`
  - `tumour_growth_model/`: Contains a notebook for modelling tumour growth using ODEs.
    - `ODE_notebook.ipynb`
- **Installation/**: Contains scripts for automatic installation of required software and dependencies.
  - `install_mac.sh`: Script for setting up the environment on Mac machines.
  - `install_windows.bat`: Script for setting up the environment on Windows machines.

## Installation

### Prerequisites

Ensure you have the following installed on your system:

- Julia (version 1.6 or later)
- Jupyter Notebook

### Automatic Installation

For your convenience, automatic installation scripts are provided for both Mac and Windows machines.

#### Mac

1. Open Terminal.
2. Navigate to the `Installation` directory in the repository.
3. Run the installation script:
   ```sh
   ./install_mac.sh
   ```

#### Windows

1. Open Command Prompt.
2. Navigate to the `Installation` directory in the repository.
3. Run the installation script:
   ```cmd
   install_windows.bat
   ```

### Manual Installation

If you prefer manual installation, please follow these steps:

1. Install Julia from [Julia's official website](https://julialang.org/downloads/).
2. Install Jupyter Notebook using Python's package manager:
   ```sh
   pip install notebook
   ```
3. Install the IJulia package in Julia:
   ```julia
   using Pkg
   Pkg.add("IJulia")
   ```
4. Clone this repository:
   ```sh
   git clone https://github.com/yourusername/your-repo-name.git
   ```
5. Navigate to the cloned repository:
   ```sh
   cd your-repo-name
   ```

## Usage

1. Launch Jupyter Notebook:
   ```sh
   jupyter notebook
   ```
2. Open the desired notebook from the `Notebooks` directory.
3. Follow the instructions within the notebook to run the computational models.

## Contribution

Contributions to this repository are welcome. If you wish to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch:
   ```sh
   git checkout -b feature-branch
   ```
3. Make your changes and commit them:
   ```sh
   git commit -m "Description of your changes"
   ```
4. Push to the branch:
   ```sh
   git push origin feature-branch
   ```
5. Open a Pull Request.

## License

This repository is licensed under the MIT License. See the `LICENSE` file for more details.

## Acknowledgements

We would like to thank all contributors and users for their support and feedback. Your contributions are invaluable to the improvement and success of this project.

## Contact

For any queries or issues, please contact [marcsturrock@rcsi.ie](mailto:marcsturrock@rcsi.ie) or open an issue in this repository.

---

