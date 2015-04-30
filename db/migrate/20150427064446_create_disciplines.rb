class CreateDisciplines < ActiveRecord::Migration
  def change
    create_table :disciplines do |t|
      t.string :name, null: false
      t.text :description, null: false

      t.timestamps null: false
    end
  end
end
