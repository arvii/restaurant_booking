class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
    	t.integer :suggested_by_user_id
    	t.text :reastaurant_name
    	t.text :status
    	t.integer :approved_by_user_id

      t.timestamps
    end

    add_index :restaurants, :suggested_by_user_id
  end
end
