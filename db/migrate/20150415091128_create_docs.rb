class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.string :name, null: false
      t.references :user, null: false, index: true

      t.timestamps null: false
    end
  end
end
