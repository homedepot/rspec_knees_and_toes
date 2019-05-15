require_relative '../lib/analyze_parallel_spec_logs'
require_relative '../lib/process_lines_between_logged_seeds'
require_relative '../lib/rspec_bisector'

module RSpecKneesAndToes
  class AnalyzeParallelSpecLogs
    def initialize(processor: ProcessLinesBetweenLoggedSeeds.new,
                   bisector: RspecBisector.new,
                   failing_spec_lines: File.readlines('tmp/failing_specs.log'),
                   parallel_runtime_lines: File.readlines('tmp/parallel_runtime_rspec.log'))
      @processor = processor
      @bisector = bisector
      @failing_spec_lines = failing_spec_lines
      @parallel_runtime_lines = parallel_runtime_lines
    end

    def bisect_parallel_spec_threads
      extract_seeds_with_failures.each do |seed, failures|
        @bisector.bisect(seed, failures)
      end
    end

    private

    def extract_seeds_with_failures
      failing_seeds = []
      seeds_with_failures = Hash.new {|hash, key| hash[key] = []}

      @processor.process_file(@failing_spec_lines) do |line, seed|
        if /Failures/.match(line)
          failing_seeds << seed
        end
      end

      @processor.process_file(@parallel_runtime_lines) do |line, seed|
        if /spec\//.match(line) && failing_seeds.include?(seed)
          seeds_with_failures[seed] << line[0..line.index(':')-1]
        end
      end

      seeds_with_failures
    end
  end
end
