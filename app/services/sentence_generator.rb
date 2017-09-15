# frozen_string_literal: true

class SentenceGenerator
  def initialize
    @seed = Seed.find(rand(Seed.count)).word
    @dictionary = create_dictionary
  end

  def sentence
    sentence = [@seed]
    until [".", "?", "!"].include? sentence.last
      sentence << @dictionary[sentence.last.downcase].generate_word
    end
    sentence[0..-2].join(" ") + sentence.last
  end

  def create_dictionary
    Sequence.all.inject({}) do |dictionary, sequence|
      dictionary[sequence.current_word] ||= Generator.new

      dictionary[sequence.current_word].add(
        sequence.next_word => sequence.count
      )
      dictionary
    end
  end

  def generate_word
    num = total * rand
    generator.to_a.bsearch { |_word, per| num < per }.first
  end
end
