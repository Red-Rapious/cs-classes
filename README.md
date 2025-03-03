# cs-classes
Simple LaTeX class and package for Computer Science classes. Mostly intended for personal use.

## Usage
We recommend adding the repository as a submodule in your LaTeX project. This way, you can easily update the class and package.
```bash
git submodule add https://github.com/Red-Rapious/cs-classes
```

Then, you can include the class and package in your LaTeX document.
```latex
\documentclass{cs-classes/cs-classes}
\usepackage{cs-classes/cs-packages}
...
```

Note that the `cs-classes` class is supposed to work without the package, and reciprocally. However, the package is designed to be used with the class.

Adding the repository as a submodule allows you to easily update the class and package. Future versions are meant to be backward compatible, but it is not guaranteed.

## Description
The cs-classes is based on the `article` class. It provides the following functionalities:
- French mode (option `french`), English by default
- Custom title page
- Redefinition of some symbols (`\epsilon`, `\phi`, `\leq`, ...)
- Definition of multiple theorems depending on the language
- Definition of custom letters, such as mathematical sets, in often used math fonts (`\R` for `\mathbb{R}`, ...)
- Custom commands for sets, semantics brackets, traces, ...