# == Schema Information
#
# Table name: sequences
#
#  id           :integer          not null, primary key
#  current_word :string           not null
#  next_word    :string           not null
#  count        :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sequence < ApplicationRecord
  validates_uniqueness_of :current_word, scope: [:next_word]

  def self.create_or_increment(word1, word2)
    sequence = find_or_initialize_by(current_word: word1, next_word: word2)

    sequence.count += 1
    sequence.save!
  end
end
