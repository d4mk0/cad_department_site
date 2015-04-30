class CreateDisciplines < ActiveRecord::Migration
  def change
    create_table :disciplines do |t|
      t.string :name, null: false, default: ''
      t.text :description, null: false, default: ''

      t.timestamps null: false
    end
  end
end
