class CreatePolls < ActiveRecord::Migration[5.0]
  def change
    create_table :polls do |t|
      t.integer :started_by
      t.text :restaurant
      t.integer :number_of_people
      t.integer :budget
      t.text :occasion
      t.text :status

      t.timestamps
    end

    add_index :polls, :started_by
  end
end
