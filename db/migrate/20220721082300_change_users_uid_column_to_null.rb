class ChangeUsersUidColumnToNull < ActiveRecord::Migration[6.0]
  def up
    change_column_null :users, :uid, null: true
  end

  def down
    change_column_null :users, :uid, null: false
  end
end
