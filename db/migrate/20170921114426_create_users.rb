class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :public, default: false
      t.string :token
      t.timestamps
    end
  end
end
