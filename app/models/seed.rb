# == Schema Information
#
# Table name: seeds
#
#  id         :integer          not null, primary key
#  word       :string
#  count      :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Seed < ApplicationRecord
  def self.create_or_increment(word)
    seed = find_or_initialize_by(word: word)

    seed.count += 1
    seed.save!
  end
end
