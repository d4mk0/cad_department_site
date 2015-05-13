class AddFtpPathToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ftp_path, :string
  end
end
