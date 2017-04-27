class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
  	rename_column :polls, :started_by_user, :started_by_user_id
  end
end
