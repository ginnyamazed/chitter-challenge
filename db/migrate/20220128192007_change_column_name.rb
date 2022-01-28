class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :crypted_password, :password_digest
    remove_column :users, :login
    remove_column :users, :perishable_token
    remove_column :users, :persistence_token
    remove_column :users, :single_access_token
    remove_column :users, :password_salt
  end
end
