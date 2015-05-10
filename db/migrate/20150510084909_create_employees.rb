class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :full_name, null: false
      t.string :photo
      t.string :post, null: false
      t.string :academic_degree
      t.string :academic_title
      t.text :description, null: false
      t.boolean :published, null: false, default: false
      t.integer :position
      t.string :contact_details

      t.timestamps null: false
    end
  end
end
