class AddUserIdToDisciplines < ActiveRecord::Migration
  def change
    add_column :disciplines, :user_id, :integer, null: false, index: true
  end
end
