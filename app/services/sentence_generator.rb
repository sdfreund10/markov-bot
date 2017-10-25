# frozen_string_literal: true

class SentenceGenerator
  def initialize(user = nil)
    @user_id = user&.id || User.ids
    @seed = Seed.where(user_id: @user_id).pluck(:word).sample
    @dictionary = build_dictionary(user)
  end

  def sentence
    return "You haven't trained me yet!" if @seed.nil? || @dictionary.empty?

    sentence = Array(@seed)
    until [".", "?", "!"].include? sentence.last
      sentence << @dictionary[sentence.last.downcase].generate_word
    end
    sentence[0..-2].join(" ") + sentence.last
  end

  def build_dictionary(user)
    if user.default?
      Rails.cache.fetch(user.cache_key) do
        create_dictionary
      end
    else
      create_dictionary
    end
  end

  def create_dictionary
    Sequence.where(user_id: @user_id)
            .each_with_object({}) do |sequence, dictionary|
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
