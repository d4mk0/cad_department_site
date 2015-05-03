class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.boolean :published, null: false, default: true

      t.timestamps null: false
    end
  end
end
