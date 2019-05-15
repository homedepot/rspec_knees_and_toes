require_relative '../lib/analyze_parallel_spec_logs'
require_relative '../lib/process_lines_between_logged_seeds'
require_relative '../lib/rspec_bisector'

RSpec.describe RSpecKneesAndToes::AnalyzeParallelSpecLogs do

  describe '#bisect_parallel_spec_threads' do
    it 'calls the bisector with failing seeds and their spec groups' do

      failing_spec_lines = double(:failing_spec_lines)
      parallel_runtime_lines = double(:parallel_runtime_lines)
      processor = double(:processor)
      bisector = double(:bisector, bisect: nil)

      analyzer = described_class.new(
        processor: processor,
        bisector: bisector,
        failing_spec_lines: failing_spec_lines,
        parallel_runtime_lines: parallel_runtime_lines
      )

      FIRST_FAILING_SEED = '1234'
      SECOND_FAILING_SEED = '5678'

      allow(processor).to receive(:process_file)
        .with(failing_spec_lines)
        .and_yield('log noise', '1')
        .and_yield('passing specs', '12')
        .and_yield('Failures', FIRST_FAILING_SEED)
        .and_yield('other log noise', '123')
        .and_yield('Failures', SECOND_FAILING_SEED)
        .and_yield('nothing relevant', '123')

      allow(processor).to receive(:process_file)
        .with(parallel_runtime_lines)
        .and_yield('spec/failing_spec_alpha.rb:time_to_run', FIRST_FAILING_SEED)
        .and_yield('spec/failing_spec_bravo.rb:time_to_run', FIRST_FAILING_SEED)
        .and_yield('spec/failing_spec_charlie.rb:time_to_run', SECOND_FAILING_SEED)
        .and_yield('spec/failing_spec_delta.rb:time_to_run', SECOND_FAILING_SEED)
        .and_yield('spec/passing_spec.rb:time_to_run', '12')
        .and_yield('spec/another_passing_spec.rb:time_to_run', '123')

      analyzer.bisect_parallel_spec_threads

      expect(bisector).to have_received(:bisect).with(FIRST_FAILING_SEED, %w(spec/failing_spec_alpha.rb spec/failing_spec_bravo.rb))
      expect(bisector).to have_received(:bisect).with(SECOND_FAILING_SEED, %w(spec/failing_spec_charlie.rb spec/failing_spec_delta.rb))
      expect(bisector).not_to have_received(:bisect).with('12', ['spec/passing_spec.rb'])
      expect(bisector).not_to have_received(:bisect).with('123', ['spec/another_passing_spec.rb'])
    end
  end
end
