# frozen_string_literal: true

class Dictionary
  attr_accessor :dictionary

  def dictionary
    @dictionary ||= Hash.new 0
  end

  def add_word(word)
    dictionary[word] += 1
  end

  def generator
    rolling_sum = 0
    @generator = dictionary.transform_values do |count|
      rolling_sum += count
    end
  end

  def generate_word
    num = total * rand
    generator.to_a.bsearch { |_word, per| num < per }.first
  end

  def total
    dictionary.values.sum
  end
end