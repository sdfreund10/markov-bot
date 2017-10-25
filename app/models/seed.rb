# frozen_string_literal: true

# == Schema Information
#
# Table name: seeds
#
#  id         :integer          not null, primary key
#  word       :string
#  count      :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Seed < ApplicationRecord
  validates_uniqueness_of :word, scope: [:user_id]
  def self.create_or_increment(word, user_id = nil)
    seed = find_or_initialize_by(word: word, user_id: user_id)

    seed.count += 1
    seed.save!
  end
end
