class ChangeRestaurantColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :restaurants, :reastaurant_name, :name
  end
end
