class AddImagesToFoodItems < ActiveRecord::Migration[5.0]
  def change
  	add_column :food_items, :image_url, :string
  end
end
