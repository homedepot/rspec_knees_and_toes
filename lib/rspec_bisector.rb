module RSpecKneesAndToes
  class RspecBisector
    def bisect(seed, failures)
      puts "Bisecting test group for failing seed #{seed}"
      puts `rspec --seed #{seed} --bisect #{failures.join(' ')}`
    end
  end
end
