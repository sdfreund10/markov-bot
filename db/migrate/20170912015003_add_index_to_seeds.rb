class AddIndexToSeeds < ActiveRecord::Migration[5.1]
  def change
    add_index :seeds, :word
  end
end
