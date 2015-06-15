class CreateToDos < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.string :title
      t.boolean :checked, default: false
      t.integer :list_id

      t.timestamps null: false
    end
  end
end
