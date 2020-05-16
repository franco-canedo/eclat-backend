class AddMottoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :motto, :string
    add_column :users, :who_we_are, :string
    add_column :users, :company_name, :string
    add_column :users, :company_address, :string
    add_column :users, :email, :string
    add_column :users, :phone_number, :string
  end
end
