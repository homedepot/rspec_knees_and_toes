# RSpec Knees and Toes

HeadAndShoulders sniffs out brittle tests within your RSpec suite when using Parallel Tests.

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
gem 'head_and_shoulders'
```

And then execute:

    $ bundle

## Setup

Add this line to your application's Rakefile:

```ruby
require 'head_and_shoulders/tasks'
```


And then add the following lines to your '.rspec' configuration file:

```
--format ParallelTests::RSpec::RuntimeLogger --out tmp/parallel_runtime_rspec.log
--format ParallelTests::RSpec::FailuresLogger --out tmp/failing_specs.log
```

## Usage

To bisect a failing parallel spec run, run the following rake task:

    $ rake head_and_shoulders:bisect


## Artifactory

To build a new head & shoulders .gem file:

    $ gem build head_and_shoulders.gemspec
    
To deploy the new version in artifactory:

- Go to https://rubygems.artifactory.homedepot.com/artifactory/webapp/#/artifacts/browse/tree/General/gems-local/gems/head_and_shoulders-0.1.2.gem
- Click in Deploy link in the top right
- Enter `gems-local/gems/` as a target path


