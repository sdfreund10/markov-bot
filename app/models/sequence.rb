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

  def self.create_or_increment(current, word)
    sequence = find_or_initialize_by(current_word: current, next_word: word)

    sequence.count += 1
    sequence.save!
  end
end
