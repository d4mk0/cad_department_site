class AddCategoryToAds < ActiveRecord::Migration
  def change
    add_column :ads, :category, :string, null: false
  end
end
