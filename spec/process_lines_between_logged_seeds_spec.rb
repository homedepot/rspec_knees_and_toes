require_relative '../lib/process_lines_between_logged_seeds'

RSpec.describe RSpecKneesAndToes::ProcessLinesBetweenLoggedSeeds do

    let(:processor) { described_class.new }

    describe '#process_file' do
      let(:file_lines) { [
        'Randomized with seed 1234',
        'nonsense',
        'more nonsense',
        'Randomized with seed 1234',

        'no one cares about this',

        'Randomized with seed 5678',
        'further nonsense',
        'excessive nonsense',
        'Randomized with seed 5678',
      ] }

      it 'yields lines inside a seed section along with that line\'s seed' do
        yields = []
        processor.process_file(file_lines) do |line, seed|
          yields << [line, seed]
        end

        expect(yields).to eq [
          ['nonsense', '1234'],
          ['more nonsense', '1234'],

          ['further nonsense', '5678'],
          ['excessive nonsense', '5678']
        ]
      end
    end

end
