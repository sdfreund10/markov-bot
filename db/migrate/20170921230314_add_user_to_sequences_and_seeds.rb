class AddUserToSequencesAndSeeds < ActiveRecord::Migration[5.1]
  def change
    add_reference :sequences, :user
    add_reference :seeds, :user
  end
end
