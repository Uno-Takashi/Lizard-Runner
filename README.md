# lizard-runner action

[![pyt](https://github.com/Uno-Takashi/lizard-runner/actions/workflows/pyt.yml/badge.svg?branch=main&event=push)](https://github.com/Uno-Takashi/lizard-runner/actions/workflows/pyt.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/Uno-Takashi/lizard-runner/blob/main/LICENSE)
[![Python](https://img.shields.io/badge/Python-F9DC3E.svg?logo=python&style=flat)](https://www.python.org/)
[![Docker](https://img.shields.io/badge/-Docker-EEE.svg?logo=docker&style=flat)](https://www.docker.com/)

Lizard Runner is a third-party OSS Github Action for easy execution of [lizard](http://www.lizard.ws/).

- **Rapid Container**
  - The Lizard Runner employs a lightweight container to achieve build times that are competitive with the combination of actions/setup-python and pip. In most cases, preparation to begin analysis takes less than 30 seconds.
- **Easy-to-use variable specification**
  - Wrapping command line arguments allows for more intuitive execution.
- **Can be embedded in CI**
  - The complexity of the code can always be measured. This prevents the inclusion of overly complex codes.

## 🗞️ Introduction

As code becomes more complex, it becomes less maintainable.

Often, code that was easy to modify in the early stages of a product's life can become so complex and huge before long that it becomes unmaintainable.

## 🛠️ Why We Built It

In general, CI allows engineers to gain psychological security by keeping test code running. That is, they continue to be assured that the code they add will not have a fatal negative impact on the service.

We wanted to incorporate and visualize code complexity within the CI framework. By doing this, we wanted to make it more psychologically safe for engineers to merge code, ensuring that the code they wrote would not become a bottleneck in the refurbishment.

For this reason, we have created a Github action that makes it easy to run lizard!

## 📚 Usage

## 📥 Inputs

Most of the input is the same as in the [lizard](http://www.lizard.ws/), but some original input is required for lizard-runner. Some arguments are also wrapped for convenience.

## 📤 Outputs

## 🛒 How to Get

GitHub Marcket Place
