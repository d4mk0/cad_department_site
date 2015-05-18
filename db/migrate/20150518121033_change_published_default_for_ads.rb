class ChangePublishedDefaultForAds < ActiveRecord::Migration
  def up
    change_column :ads, :published, :boolean, default: false
  end

  def down
    change_column :ads, :published, :boolean, default: true
  end
end
