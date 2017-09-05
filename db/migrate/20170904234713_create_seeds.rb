class CreateSeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :seeds do |t|
      t.string :word
      t.integer :count, default: 0
      t.timestamps
    end
  end
end
