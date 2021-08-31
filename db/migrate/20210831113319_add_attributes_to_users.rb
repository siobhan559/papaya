class AddAttributesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bio, :string
    add_column :users, :organization?, :boolean
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :company_name, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :religion, :string
  end
end
