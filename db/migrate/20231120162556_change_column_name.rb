class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :password_confirm, :email_confirmed
  end
end
