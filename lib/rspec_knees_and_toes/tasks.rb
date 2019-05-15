# frozen_string_literal: true

require 'analyze_parallel_spec_logs'

namespace :knees_and_toes do
  desc 'Analyze parallel spec logs and run RSpec bisect on test groups that have failed.'
  task :bisect do
    puts 'Beginning bisect of parallel spec failures.....'

    RSpecKneesAndToes::AnalyzeParallelSpecLogs.new.bisect_parallel_spec_threads
  end
end
