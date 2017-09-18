class AddIndexToSequence < ActiveRecord::Migration[5.1]
  def change
    add_index :sequences, %i[current_word next_word]
  end
end
