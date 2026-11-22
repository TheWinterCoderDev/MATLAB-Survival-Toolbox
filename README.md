
# 🧮 MATLAB Survival Toolbox

### Numerical Methods & Computational Engineering

![MATLAB](https://img.shields.io/badge/Language-MATLAB-E16737?style=flat-square)
![License](https://img.shields.io/badge/License-GPLv3-blue?style=flat-square)
![Status](https://img.shields.io/badge/Status-Under_Development-orange?style=flat-square)
![Engineering](https://img.shields.io/badge/Domain-Computational_Engineering-00599C?style=flat-square)
[![MATLAB CI](https://github.com/TheWinterCoderDev/MATLAB-Survival-Toolbox/actions/workflows/matlab-ci.yml/badge.svg?branch=main)](https://github.com/TheWinterCoderDev/MATLAB-Survival-Toolbox/actions/workflows/matlab-ci.yml)


## Overview

MATLAB Survival Toolbox is an educational open-source
collection of numerical algorithms originally developed
during my Civil Engineering studies at the Universitat
Politècnica de Catalunya (UPC).

The project aims to provide accessible, understandable
and reproducible implementations of fundamental
numerical methods used in computational engineering.

Originally developed as an academic resource, the project
is now being progressively modernized with improved
numerical robustness, documentation and software
engineering practices.

## Objectives

- Provide educational implementations of numerical methods.
- Support engineering students and computational researchers.
- Connect mathematical theory with practical programming.
- Promote reproducible computational engineering.
- Improve numerical accuracy and software reliability.


## Available Algorithms

### Module 01 — Numerical Linear Algebra

| Algorithm | Description | Source |
|---|---|---|
| Forward Substitution | Lower triangular systems | [Source](src/linear_algebra/forward_substitution.m) |
| Backward Substitution | Upper triangular systems | [Source](src/linear_algebra/backward_substitution.m) |
| Gaussian Elimination | Linear systems with partial pivoting | [Source](src/linear_algebra/gaussian_elimination.m) |

### Legacy Implementations

Original academic implementations are preserved for
historical and educational purposes.

These implementations are not actively validated.

| Algorithm | Source |
|---|---|
| Gaussian Elimination | [Source](legacy/GaussEl.m) |
| Forward Substitution | [Source](legacy/forwardsubstitution.m) |
| Backward Substitution | [Source](legacy/backsubstitution.m) |
| Euler's Number Approximation | [Source](legacy/eApproximation.m) |
| Whittaker's Method | [Source](legacy/whittaker_method.m) |

## Quick Start

Open the repository root directory in MATLAB.

Add the source code to the MATLAB search path:

```matlab
addpath(genpath('src'));
```

Run the linear system example:

```matlab
run('examples/example_linear_system.m');
```

## Running Tests

Execute the automated test suite:

```matlab
addpath(genpath('src'));
results = runtests('tests');
disp(results);
assert(~isempty(results) && all([results.Passed]));
```

## Technical Documentation

- [Numerical Linear Algebra](docs/linear_algebra.md)
- [Changelog](CHANGELOG.md)
- [Security Policy](SECURITY.md)
- [License](LICENSE)

## Limitations

The toolbox is intended for educational and research
purposes. It is not certified for production or
safety-critical engineering applications.

The numerical algorithms must be independently
verified before being used in real engineering projects.

## Development Roadmap

### Phase I — Repository Modernization

- [x] Professional repository documentation
- [ ] Modular directory structure
- [ ] Standardized function documentation
- [ ] Input validation
- [ ] Review of legacy implementations

### Phase II — Numerical Validation

- [ ] Automated unit tests
- [ ] Comparison with built-in MATLAB functions
- [ ] Numerical error analysis
- [ ] Performance benchmarks
- [ ] Reproducible examples

### Phase III — Toolbox Expansion

- [ ] Nonlinear equation solvers
- [ ] Numerical interpolation
- [ ] Numerical differentiation
- [ ] Numerical integration
- [ ] Ordinary differential equations
- [ ] Numerical optimization

### Phase IV — Engineering Applications

- [ ] Structural engineering examples
- [ ] Transportation engineering applications
- [ ] Civil infrastructure modelling
- [ ] Applied computational case studies

## Contributing

Contributions, corrections, suggestions and educational
examples are welcome through GitHub Issues and Pull Requests.

## License

This project is distributed under the GNU General Public
License v3.0.

See the [LICENSE](LICENSE) file for details.

## Author

**Raúl Galdeano Pazos — The Winter Coder**

Civil Engineering | Computational Engineering |
Data & Automation | Transportation Systems

[LinkedIn](https://www.linkedin.com/in/raulgaldeanopazos/)

---

*Survival is just the first step — mastery comes next.*

**Ad Victoriam!**
