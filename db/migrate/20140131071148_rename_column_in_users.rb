class RenameColumnInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :remeber_token,:remember_token
  end
end
