# frozen_string_literal: true

class Generator
  attr_accessor :dictionary

  def add(word)
    dictionary.merge!(word)
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

  def dictionary
    @dictionary ||= {}
  end
end
