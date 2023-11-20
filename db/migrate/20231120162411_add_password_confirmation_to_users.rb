class AddPasswordConfirmationToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :password_confirm, :boolean
  end
end
