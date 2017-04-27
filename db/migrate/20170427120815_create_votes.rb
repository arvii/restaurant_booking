class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :user
      t.references :poll
      t.references :restaurant

      t.timestamps
    end
  end
end
