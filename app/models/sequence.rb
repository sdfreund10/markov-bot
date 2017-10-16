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
#  user_id      :integer
#

class Sequence < ApplicationRecord
  validates_uniqueness_of :current_word, scope: [:next_word, :user_id]

  def self.create_or_increment(current, word, user_id = nil)
    sequence = find_or_initialize_by(
      current_word: current, next_word: word, user_id: user_id
    )

    sequence.count += 1
    sequence.save!
  end
end
