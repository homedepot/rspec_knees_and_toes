# RSpec Knees and Toes

[![Ruby Version](https://img.shields.io/badge/ruby-2.6.3-00ADD8.svg?style=flat)](https://www.ruby-lang.org/en/)
[![Gem Version](https://badge.fury.io/rb/rspec_knees_and_toes.svg)](https://badge.fury.io/rb/rspec_knees_and_toes)
[![Code Coverage](https://img.shields.io/codecov/c/github/homedepot/rspec_knees_and_toes.svg?style=flat)](https://codecov.io/gh/homedepot/rspec_knees_and_toes)
[![Build Status](https://travis-ci.org/homedepot/rspec_knees_and_toes.svg?branch=master)](https://travis-ci.org/homedepot/rspec_knees_and_toes)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg?style=flat)](LICENSE)

RSpecKneesAndToes sniffs out brittle tests within your RSpec suite when using Parallel Tests.

It uses the Parallel Tests log files to identify groups of seeds and specs that failed on the previous run and runs RSpec bisect on the offending groups.

RSpec Knees and Toes: Because our first name had a trademark. 

## Prerequisites

This gem assumes that: you are using the following within your application:

- You are using RSpec
- You are using Parallel Tests (https://rubygems.org/gems/parallel_tests)
- You have enabled random spec ordering in RSpec (e.g., you have `config.order = :random` in your RSpec configuration)
- You are logging failures and parallel spec runs as detailed in the Setup section below

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec_knees_and_toes'
```

And then execute:

    $ bundle

## Setup

Add this line to your application's Rakefile:

```ruby
require 'rspec_knees_and_toes/tasks'
```


And then add the following lines to your '.rspec' configuration file:

```
--format ParallelTests::RSpec::RuntimeLogger --out tmp/parallel_runtime_rspec.log
--format ParallelTests::RSpec::FailuresLogger --out tmp/failing_specs.log
```

## Usage

To bisect a failing parallel spec run, run the following rake task:

    $ rake knees_and_toes:bisect

## Build

To run tests, just use `rspec`. To build a new knees and toes .gem file:

    $ gem build rspec_knees_and_toes.gemspec

## Contributing

Check out the [contributing](CONTRIBUTING.md) readme for information on how to contribute to the project.

## License 

This project is released under the Apache2 free software license. More information can be found in the [LICENSE](LICENSE) file.
