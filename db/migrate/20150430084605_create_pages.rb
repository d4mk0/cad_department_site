class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.string :permalink, null: false, index: true
      t.boolean :published, null: false, default: false

      t.timestamps null: false
    end
  end
end
