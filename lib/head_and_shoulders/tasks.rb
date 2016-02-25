require 'analyze_parallel_spec_logs'

namespace :head_and_shoulders do
  desc 'Analyze parallel spec logs and run RSpec bisect on test groups that have failed.'
  task :bisect do
    puts 'Beginning bisect of parallel spec failures.....'

    HeadAndShoulders::AnalyzeParallelSpecLogs.new.bisect_parallel_spec_threads
  end
end
