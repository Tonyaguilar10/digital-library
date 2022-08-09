class AddLastNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :last_name, :string, null: false
  end
end
