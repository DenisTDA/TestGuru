class AddLastnameAndTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string
    add_column :users, :type, :string, null: false, default: 'User'
    add_index :users, :type
  end
end
