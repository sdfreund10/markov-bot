# frozen_string_literal: true

class MarkovGenerator
  def initialize(input_string)
    @input = input_string
  end

  def split_string
    @split_string ||= @input.scan(/[\w']+|\.|\?|\!/).map(&:downcase)
  end

  def dictionary
    @dictionary ||= begin
      split_string.each_cons(2).each_with_object({}) do |(_current, _following), dict|
        dict[word1] ||= Dictionary.new
        dict[word1].add_word(word2)
      end
    end
  end

  def generate_sentence
    sentence = [seeds.sample]
    until [".", "?", "!"].include? sentence.last
      sentence << dictionary[sentence.last].generate_word
    end
    sentence
  end

  def seeds
    @input.split(/\.\s/).map { |sentence| sentence.split.first }
  end
end
