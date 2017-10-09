# frozen_string_literal: true

class SentenceProcessor
  def initialize(string, user_id = nil)
    @string = string
    @user_id = user_id
  end

  def seeds
    @string.split(/[\.\?\!]\s/).map do |sentence|
      sentence.split(" ").first
    end
  end

  def add_seeds
    Seed.transaction do
      seeds.each do |word|
        Seed.create_or_increment(word, @user_id)
      end
    end
  end

  def create_sequences
    Sequence.transaction do
      split_string.each_cons(2) do |current_word, next_word|
        Sequence.create_or_increment(current_word, next_word, @user_id)
      end
    end
  end

  def split_string
    @string.scan(/[\w']+|\.|\?|\!/).map(&:downcase)
  end
end
