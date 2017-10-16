# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  public     :boolean          default(FALSE)
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :sequences
  has_many :seeds

  def clear_data
    sequences.delete_all
    seeds.delete_all
  end
end
