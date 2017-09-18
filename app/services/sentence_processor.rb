# frozen_string_literal: true

class SentenceProcessor
  def initialize(string)
    @string = string
  end

  def seeds
    @string.split(/[\.\?\!]\s/).map do |sentence|
      sentence.split(" ").first
    end
  end

  def add_seeds
    seeds.each do |word|
      Seed.create_or_increment(word)
    end
  end

  def create_sequences
    split_string.each_cons(2) do |current_word, next_word|
      Sequence.create_or_increment(current_word, next_word)
    end
  end

  def split_string
    @string.scan(/[\w']+|\.|\?|\!/).map(&:downcase)
  end
end
