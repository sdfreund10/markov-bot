class CreateSequences < ActiveRecord::Migration[5.1]
  def change
    create_table :sequences do |t|
      t.string :current_word, null: false
      t.string :next_word, null: false
      t.integer :count, default: 0
      t.timestamps
    end
  end
end
