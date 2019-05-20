# frozen_string_literal: true

require_relative '../lib/rspec_bisector'

RSpec.describe RSpecKneesAndToes::RspecBisector do
  let(:bisector) { described_class.new }
  let(:seed) { 1234 }
  let(:failures) { ['abcd.rb:1', 'cdef.rb:2'] }

  describe '#bisect' do
    it 'executes a bisect at the given seen' do
      expect(bisector).to receive(:`).with('rspec --seed 1234 --bisect abcd.rb:1 cdef.rb:2').and_return('Done')
      bisector.bisect(seed, failures)
    end
  end
end
