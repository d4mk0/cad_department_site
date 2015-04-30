class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, null: false, default: ''
      t.text :text, null: false, default: ''
      t.string :permalink, null: false, default: '', index: true
      t.boolean :published, null: false, default: false

      t.timestamps null: false
    end
  end
end
