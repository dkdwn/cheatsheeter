class CreateCheats < ActiveRecord::Migration[8.1]
  def change
    create_table :cheats do |t|
      t.string :name
      t.text :content
      t.string :category

      t.timestamps
    end
  end
end
