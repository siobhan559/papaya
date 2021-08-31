class RenameColumnInUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :organization?, :organization
  end
end
