class AddDisciplineIdToDocs < ActiveRecord::Migration
  def change
    add_column :docs, :discipline_id, :integer
  end
end
