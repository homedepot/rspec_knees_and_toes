# frozen_string_literal: true

module RSpecKneesAndToes
  class ProcessLinesBetweenLoggedSeeds
    attr_reader :failing_seeds

    def initialize
      @current_seed = nil
    end

    def process_file(file_lines)
      reset

      file_lines.each do |line|
        process_log_line(line) do |seed|
          yield line, seed if seed
        end
      end
    end

    private

    def reset
      @current_seed = nil
    end

    def process_log_line(line)
      seed = get_seed_if_seed_line(line)

      if seed && !@current_seed
        @current_seed = seed
      elsif seed && @current_seed == seed
        @current_seed = nil
      else
        yield @current_seed
      end
    end

    def get_seed_if_seed_line(line)
      match = /Randomized with seed (?<seed>\d*)/.match(line)
      match && match[:seed]
    end
  end
end
