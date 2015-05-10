class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.string :title, null: false
      t.text :code, null: false
      t.boolean :published, null: false, default: false
      t.integer :position

      t.timestamps null: false
    end
  end
end
