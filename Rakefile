require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require_relative './lib/analyze_parallel_spec_logs'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :head_and_shoulders do
  desc 'Analyze parallel spec logs and run RSpec bisect on test groups that have failed.'
  task :bisect do
    print 'Beginning bisect of parallel spec failures...'

    HeadAndShoulders::AnalyzeParallelSpecLogs.new.bisect_parallel_spec_threads
  end
end
