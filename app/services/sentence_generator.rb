# frozen_string_literal: true

class SentenceGenerator
  def initialize(user = nil)
    @user_id = user&.id || User.ids
    @seed = Seed.where(user_id: @user_id).offset(rand(Seed.count)).first
    @dictionary = create_dictionary
  end

  def sentence
    return nil if @seed.nil? || @dictionary.empty?

    sentence = [@seed.word]
    until [".", "?", "!"].include? sentence.last
      sentence << @dictionary[sentence.last.downcase].generate_word
    end
    sentence[0..-2].join(" ") + sentence.last
  end

  def create_dictionary
    Sequence.all.each_with_object({}) do |sequence, dictionary|
      dictionary[sequence.current_word] ||= Generator.new

      dictionary[sequence.current_word].add(
        sequence.next_word => sequence.count
      )
    end
  end

  def generate_word
    num = total * rand
    generator.to_a.bsearch { |_word, per| num < per }.first
  end
end
