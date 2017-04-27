class ChangePollsColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :polls, :started_by, :started_by_user_id
    remove_column :polls, :restaurant
  end
end
