class AddUsersNamePassNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:users, :name, false)
    change_column_null(:users, :pass, false)
  end
end
