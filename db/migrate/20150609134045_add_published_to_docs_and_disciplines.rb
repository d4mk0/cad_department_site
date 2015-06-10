class AddPublishedToDocsAndDisciplines < ActiveRecord::Migration
  def change
    add_column :docs, :published, :boolean, default: true, null: false
    add_column :disciplines, :published, :boolean, default: true, null: false
  end
end
