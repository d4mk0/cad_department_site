class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.references :doc, null: false, index: true
      t.string :path

      t.timestamps null: false
    end
    add_foreign_key :versions, :docs
  end
end
