class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title, null: false
      t.text :short_description, null: false
      t.text :text, null: false
      t.boolean :published, null: false, default: false
      t.integer :views, null: false, default: 0

      t.timestamps null: false
    end
  end
end
