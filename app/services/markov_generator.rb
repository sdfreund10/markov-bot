# frozen_string_literal: true

class MarkovGenerator
  def initialize(input_string)
    @input = input_string.squish
  end

  def split_string
    @split_string ||= @input.scan(/[\w']+|\.|\?|\!/).map(&:downcase)
  end

  def dictionary
    @dictionary ||= begin
      split_string.each_cons(3).inject({}) do |dict, (word1, word2, word3)|
        dict[[word1, word2]] ||= Dictionary.new
        dict[[word1, word2]].add_word(word3)
        dict
      end
    end
  end

  def generate_sentence
    sentence = dictionary.keys.sample(2)
    until [".", "?", "!"].include? sentence.last
      sentence << dictionary[sentence.last].generate_word.first
    end
    sentence
  end
end
